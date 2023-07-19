from django.urls import path

from .views import IdeaCreateView, IdeaUpdateView, IdeasListView, HomePageView, PostCreateView, PostUpdateView, RubricatorCreateView, RubricatorListView, RubricatorUpdateView
from . import views


app_name = 'projects'

urlpatterns = [
    path('', HomePageView.as_view(), name='home'),
    path('all_ideas/', IdeasListView.as_view(), name='all_ideas'),
    path('rubricator/', RubricatorListView.as_view(), name='rubricator'),
    path('rubricator/<int:pk>', RubricatorUpdateView.as_view(), name='update-rubricator'),
    path('week_calendar/', views.week_calendar, name='week-calendar'),
    path('month_calendar/<int:year>/<int:month>/', views.month_calendar, name='month-calendar'),
    path('idea/new/', IdeaCreateView.as_view(), name='create-idea'),
    path('post/new/', PostCreateView.as_view(), name='create-post'),
    path('rubricator/new/', RubricatorCreateView.as_view(), name='create-rubricator'),
    path('idea/<int:pk>/update/', IdeaUpdateView.as_view(), name='update-idea'),
    path('post/<int:pk>/update/', PostUpdateView.as_view(), name='update-post'),
    path('delete/<int:pk>/', views.PostDeleteView.as_view(), name='delete'),
    path('update_post_date/', views.update_post_date, name='update_post_date'),
]
