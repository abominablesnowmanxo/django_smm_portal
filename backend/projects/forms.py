from django import forms

from .models import ContentType, Done, Heading, Project, PostIdea, Format, SocialNetwork


class PostIdeaForm(forms.ModelForm):
    is_done = forms.ModelChoiceField(
        label='Готово',
        queryset=Done.objects,
        empty_label='Выберите вариант',
        widget=forms.Select(attrs={'class': 'form-control'},)
    )

    format = forms.ModelChoiceField(
        label='Формат',
        queryset=Format.objects,
        empty_label='Выберите формат',
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    social_network = forms.ModelChoiceField(
        required=False,
        label='Площадка',
        queryset=SocialNetwork.objects,
        empty_label='Выберите площадку',
        widget=forms.Select(attrs={'class': 'form-control'})
    )

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


    project = forms.ModelChoiceField(
        label='Проект',
        queryset=Project.objects,
        empty_label='Выберите проект',
        widget=forms.Select(attrs={'class': 'form-control'})
    )


    class Meta:
        model = PostIdea
        fields = [
            'theme', 'publish_date', 'hashtags', 'geolocation', 'short_description', 'full_description', 'references', 'inventory', 'to_do_list',
            'notes','heading', 'content_type', 'social_network', 'format', 'is_done', 'project'
        ]

        widgets = {
            'theme': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Тема публикации'}),
            'publish_date': forms.DateInput(attrs={'type': 'date', 'class': 'form-control', 'placeholder': 'Дата публикации'}),
            'hashtags': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Хэштеги'}),
            'geolocation': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Геолокация'}),
            'short_description': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Описание', 'style': 'height: 100px;'}),
            'full_description': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Описание', 'rows': 8}),
            'references': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Референсы', 'rows': 4}),
            'inventory': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Инвентарь', 'rows': 4}),
            'to_do_list': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'To Do', 'rows': 4}),
            'notes': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Заметки', 'rows': 4}),
        }
