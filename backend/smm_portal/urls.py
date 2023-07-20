from django.contrib import admin
from django.urls import include, path


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('projects.urls'), name='projects'),
    path('calendar/', include('mycalendar.urls'), name='calendar'),
    path('rubricator/', include('rubricator.urls'), name='rubricator'),
    path('accounts/', include('accounts.urls'), name='accounts'),
    path('accounts/', include('django.contrib.auth.urls')),
    path("__debug__/", include("debug_toolbar.urls")),
]
