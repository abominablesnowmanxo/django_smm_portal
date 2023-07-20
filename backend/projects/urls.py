from django.urls import path

from . import views


app_name = 'projects'

urlpatterns = [
    path('', views.HomePageView.as_view(), name='home'),
    path('all_ideas/', views.IdeasListView.as_view(), name='all_ideas'),

    path('idea/new/', views.IdeaCreateView.as_view(), name='create-idea'),
    path('post/new/', views.PostCreateView.as_view(), name='create-post'),
    path('idea/<int:pk>/update/', views.IdeaUpdateView.as_view(), name='update-idea'),
    path('post/<int:pk>/update/', views.PostUpdateView.as_view(), name='update-post'),
    path('delete/<int:pk>/', views.PostDeleteView.as_view(), name='delete'),
    path('update_post_date/', views.update_post_date, name='update_post_date'),
]
