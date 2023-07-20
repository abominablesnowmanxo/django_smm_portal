from django import forms

from projects.models import ContentType, Heading
from .models import Rubricator


class RubricatorForm(forms.ModelForm):
    content_type = forms.ModelChoiceField(
        required=False,
        label='Тип контента',
        queryset=ContentType.objects,
        empty_label='Выберите тип контента',
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    heading = forms.ModelChoiceField(
        required=False,
        label='Рубрика',
        queryset=Heading.objects,
        empty_label='Выберите рубрику',
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    class Meta:
        model = Rubricator
        fields = ['content_type', 'heading', 'examples']

        widgets = {
            'examples': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Примеры публикаций', 'rows': 16}),
        }
