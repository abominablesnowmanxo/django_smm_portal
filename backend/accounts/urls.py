from django.urls import path
from django.contrib.auth.views import LoginView

from .views import SignUpView
from .forms import LoginForm

app_name = 'accounts'

urlpatterns = [
    path('signup/', SignUpView.as_view(), name='signup'),
    path('login/', LoginView.as_view(template_name='registration/login.html', authentication_form=LoginForm), name='login'),
]
