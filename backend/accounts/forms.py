from django import forms
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import (
    AuthenticationForm, UserCreationForm, UserChangeForm
)

attrs = {'class': 'form-control'}


class CustomUserCreationForm(UserCreationForm):

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)
        self.fields['password1'].widget.attrs.update(attrs)
        self.fields['password2'].widget.attrs.update(attrs)

    class Meta:
        model = get_user_model()
        fields = ('username', 'email',)

        widgets = {
                'email': forms.EmailInput(attrs=attrs),
                'username': forms.TextInput(attrs=attrs),
            }


class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = get_user_model()
        fields = ('username', 'email',)


class LoginForm(AuthenticationForm):
    username = forms.CharField(widget=forms.TextInput(attrs=attrs))
    password = forms.CharField(widget=forms.PasswordInput(attrs=attrs))
