from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
import json
from django_daraja.mpesa.core import MpesaClient
from django.contrib import messages
from .forms import *
from django.contrib.auth.models import auth
from django.contrib.auth import authenticate
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.shortcuts import render
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required


def test(request):
    return HttpResponse("Hello World")


def register(request):
    form = CreateUserForm()
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Account created successfully")
            return redirect("login")
    context = {"form": form}
    return render(request, "register.html", context)


def login(request):
    user_json = "anonymous"
    form = CustomAuthenticationForm()
    if request.method == "POST":
        form = CustomAuthenticationForm(data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
            user = authenticate(request, username=username, password=password)
            if user is not None:
                auth.login(request, user)
                messages.success(request, message="Logged in successfully")
                return redirect("dashboard")
            else:
                messages.warning(request, message="Invalid username or password")
                user_json = json.dumps({})

    context = {"form": form, "user": user_json}

    return render(request, "login.html", context=context)


def logout(request):
    auth.logout(request)
    messages.success(request, "Logged out successfully")
    return redirect("login")


@login_required
def dashboard(request):
    pass


def send_password_reset_email(request):

    user_data = User.objects.get(username="username")

    subject = "Password Reset Request"
    html_message = render_to_string("reset_pass.html", {"user": user_data})
    from_email = ""
    recipient_list = [user_data.email]
    send_mail(subject, "", from_email, recipient_list, html_message=html_message)

    return render(request, "pass_reset_done.html")


def mpesa(request):
    if request.method == "POST":
        phone_number = request.POST.get("phone_number")
        amount = request.POST.get("amount")

        try:
            amount = int(amount)
        except ValueError:
            return HttpResponse("Invalid amount. Please enter a valid integer amount.")

        account_reference = "reference"
        transaction_desc = "Description"
        callback_url = ""
        previous_url = request.META.get("HTTP_REFERRER")
        cl = MpesaClient()
        response = cl.stk_push(
            phone_number, amount, account_reference, transaction_desc, callback_url
        )
        return render(
            request,
            "mpesa.html",
            {"success_message": "Payment successful!", "previous_url": previous_url},
        )

    return render(request, "mpesa.html")


def error_404_view(request, exception):
    return redirect("dashboard")
