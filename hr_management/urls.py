from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from hr_app import views  # <--- أضف هذا السطر للاستيراد


urlpatterns = [
    path('admin/', admin.site.urls),
    path('force-reset-admin-password-now-a1b2c3d4/', views.force_reset_admin_password, name='force_reset_admin_password'),

    path('', include('hr_app.urls')),
]

# Serve media files during development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
