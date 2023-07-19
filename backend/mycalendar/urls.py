from django.urls import path
from . import views

app_name = 'calendar'

urlpatterns = [
    path('month/<int:year>/<int:month>/', views.month_calendar, name='month-calendar'),
    path('week/', views.week_calendar, name='week-calendar'),
]
