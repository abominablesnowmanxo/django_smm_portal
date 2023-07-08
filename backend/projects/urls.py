from django.urls import path

from .views import IdeaCreateView, IdeaUpdateView, IdeasListView, HomePageView, PostCreateView, PostUpdateView
from . import views


app_name = 'projects'

urlpatterns = [
    path('', HomePageView.as_view(), name='home'),
    path('all_ideas/', IdeasListView.as_view(), name='all_ideas'),
    path('month_calendar/', views.month_calendar, name='month-calendar'),
    path('month_calendar/<int:year>/<int:month>/', views.month_calendar_change, name='month-calendar-change'),
    path('idea/new', IdeaCreateView.as_view(), name='create-idea'),
    path('post/new', PostCreateView.as_view(), name='create-post'),
    path('idea/<int:pk>/update', IdeaUpdateView.as_view(), name='update-idea'),
    path('post/<int:pk>/update', PostUpdateView.as_view(), name='update-post'),
    path('delete/<int:pk>', views.PostDeleteView.as_view(), name='delete'),
]
