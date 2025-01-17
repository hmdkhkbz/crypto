from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", include('dashboard.urls')),
    path("", include('users.urls')),
    path("", include('trading.urls')),
]