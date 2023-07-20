from django.urls import path

from . import views

app_name = 'rubricator'

urlpatterns = [
    path('', views.RubricatorListView.as_view(), name='rubricator'),
    path('<int:pk>/update', views.RubricatorUpdateView.as_view(), name='update-rubricator'),
]
