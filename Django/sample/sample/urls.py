from django.contrib import admin
from django.urls import path, include, re_path
from django.conf import settings
from django.contrib.auth.models import User
from django.views.static import serve
from django.conf.urls.static import static
from django_otp.admin import OTPAdminSite
from django_otp.plugins.otp_totp.models import TOTPDevice
from django_otp.plugins.otp_totp.admin import TOTPDeviceAdmin


"""
URLS for admin view which include the 2fa requirement when logging in
"""


class OTPAdmin(OTPAdminSite):
    pass


admin_site = OTPAdmin(name="OTPAdmin")
admin_site.register(User)
admin_site.register(TOTPDevice, TOTPDeviceAdmin)

urlpatterns = [
    path(r"admin", admin_site.urls),  # Ensure you change this from admin.site.urls
    path(r"", include("sampleapp.urls")),
    path(r"", include("django.contrib.auth.urls")),
    # path('auth/', include('social_django.urls', namespace='social')), #incase you need google login method
    re_path(
        r"^media/(?P<path>.*)$", serve, {"document_root": settings.MEDIA_ROOT}
    ),  # serving media files e.g images and files, allows downloading too
    # url(r'^admin/', include('admin_honeypot.urls', namespace='admin_honeypot')), # a fake admin interface to trick users
    re_path(
        r"^static/(?P<path>.*)$", serve, {"document_root": settings.STATIC_ROOT}
    ),  # serve static files e.g css,especially when debug is false
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

handler404 = "sampleapp.views.error_404_view"  # if debug = False and you want users to be redirected when they try to access invalid/missing page
