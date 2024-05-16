from django.contrib.auth.models import User
from django.urls import path

from . import views
from django_otp.admin import OTPAdminSite
from django_otp.plugins.otp_totp.models import TOTPDevice
from django_otp.plugins.otp_totp.admin import TOTPDeviceAdmin


class OTPAdmin(OTPAdminSite):
    pass


admin_site = OTPAdmin(name="OTPAdmin")
admin_site.register(User)
admin_site.register(TOTPDevice, TOTPDeviceAdmin)
urlpatterns = [
    path("test/", views.test, name="testing"),
    path("register/", views.register, name="register"),
    path("login/", views.login, name="login"),
    path("logout/", views.logout, name="mylogout"),
    path("", views.dashboard, name="dashboard"),
    path(
        "send-reset-email/",
        views.send_password_reset_email,
        name="send_password_reset_email",
    ),
    path("mpesa/", views.mpesa, name="mpesa"),
]
