from django.db import models
from django.urls import reverse
from accounts.models import CustomUser


class Format(models.Model):
    format = models.CharField(max_length=32)

    class Meta:
        ordering = ['format']
        verbose_name = 'Формат'
        verbose_name_plural = 'Форматы'

    def __str__(self):
        return self.format


class Done(models.Model):
    is_done = models.CharField(max_length=32)

    class Meta:
        ordering = ['is_done']
        verbose_name = 'Статус'
        verbose_name_plural = 'Статусы'

    def __str__(self):
        return self.is_done


class SocialNetwork(models.Model):
    social_network_name = models.CharField(max_length=64)

    class Meta:
        ordering = ['social_network_name']
        verbose_name = 'Площадка'
        verbose_name_plural = 'Площадки'

    def __str__(self):
        return self.social_network_name


class Heading(models.Model):
    heading = models.CharField(max_length=64)

    class Meta:
        ordering = ['heading']
        verbose_name = 'Рубрика'
        verbose_name_plural = 'Рубрики'

    def __str__(self):
        return self.heading


class ContentType(models.Model):
    content_type = models.CharField(max_length=64)

    class Meta:
        ordering = ['content_type']
        verbose_name = 'Тип контента'
        verbose_name_plural = 'Типы контента'

    def __str__(self):
        return self.content_type


class Project(models.Model):
    name = models.CharField(max_length=128)
    author = models.ForeignKey(
        CustomUser,
        on_delete=models.CASCADE,
        related_name='projects',
        verbose_name='Автор'
    )

    class Meta:
        ordering = ['name']
        verbose_name = 'Проект'
        verbose_name_plural = 'Проекты'

    def __str__(self):
        return self.name


class Rubricator(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.SET_NULL, null=True)
    heading = models.ForeignKey(Heading, on_delete=models.SET_NULL, null=True)
    examples = models.TextField(null=True, blank=True)
    author = models.ForeignKey(CustomUser, on_delete=models.CASCADE)


class PostIdea(models.Model):
    theme = models.CharField(max_length=64, verbose_name='Тема')
    short_description = models.TextField(verbose_name='Краткое описание')
    full_description = models.TextField(verbose_name='Описание', null=True, blank=True)
    publish_date = models.DateField(verbose_name='Дата публикации', null=True, blank=True)
    hashtags = models.CharField(verbose_name='Хэштеги', max_length=64, null=True, blank=True)
    geolocation = models.CharField(verbose_name='Геолокация', max_length=128, null=True, blank=True)
    references = models.TextField(verbose_name='Референсы', null=True, blank=True)
    inventory = models.TextField(verbose_name='Инвентарь', null=True, blank=True)
    to_do_list = models.TextField(verbose_name='To Do List', null=True, blank=True)
    notes = models.TextField(verbose_name='Заметки', null=True, blank=True)
    author = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='post_ideas', verbose_name='Автор')
    project = models.ForeignKey(Project, on_delete=models.CASCADE, null=True, blank=True, related_name='post_ideas', verbose_name='Проект')
    heading = models.ForeignKey(Heading, on_delete=models.SET_NULL, related_name='post_ideas', null=True, blank=True, verbose_name='Рубрика')
    content_type = models.ForeignKey(ContentType, on_delete=models.SET_NULL, related_name='post_ideas', null=True, blank=True, verbose_name='Тип контента')
    social_network = models.ForeignKey(SocialNetwork, on_delete=models.SET_NULL, related_name='post_ideas', null=True, blank=True, verbose_name='Площадка')
    format = models.ForeignKey(Format, on_delete=models.CASCADE, related_name='post_ideas', verbose_name='Формат')
    is_done = models.ForeignKey(Done, on_delete=models.CASCADE, related_name='post_ideas', verbose_name='Готово')

    class Meta:
        verbose_name = 'Идея для поста'
        verbose_name_plural = 'Идеи для постов'

    def get_absolute_url(self):
        return reverse('projects:update-idea', kwargs={'pk': self.pk})
