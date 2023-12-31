# Generated by Django 4.2.3 on 2023-07-17 06:49

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ContentType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content_type', models.CharField(max_length=64)),
            ],
            options={
                'verbose_name': 'Тип контента',
                'verbose_name_plural': 'Типы контента',
                'ordering': ['content_type'],
            },
        ),
        migrations.CreateModel(
            name='Done',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_done', models.CharField(max_length=32)),
            ],
            options={
                'verbose_name': 'Статус',
                'verbose_name_plural': 'Статусы',
                'ordering': ['is_done'],
            },
        ),
        migrations.CreateModel(
            name='Format',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('format', models.CharField(max_length=32)),
            ],
            options={
                'verbose_name': 'Формат',
                'verbose_name_plural': 'Форматы',
                'ordering': ['format'],
            },
        ),
        migrations.CreateModel(
            name='Heading',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('heading', models.CharField(max_length=64)),
            ],
            options={
                'verbose_name': 'Рубрика',
                'verbose_name_plural': 'Рубрики',
                'ordering': ['heading'],
            },
        ),
        migrations.CreateModel(
            name='SocialNetwork',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('social_network_name', models.CharField(max_length=64)),
            ],
            options={
                'verbose_name': 'Площадка',
                'verbose_name_plural': 'Площадки',
                'ordering': ['social_network_name'],
            },
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='projects', to=settings.AUTH_USER_MODEL, verbose_name='Автор')),
            ],
            options={
                'verbose_name': 'Проект',
                'verbose_name_plural': 'Проекты',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='PostIdea',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('theme', models.CharField(max_length=64, verbose_name='Тема')),
                ('short_description', models.TextField(verbose_name='Краткое описание')),
                ('full_description', models.TextField(blank=True, null=True, verbose_name='Описание')),
                ('publish_date', models.DateField(blank=True, null=True, verbose_name='Дата публикации')),
                ('hashtags', models.CharField(blank=True, max_length=64, null=True, verbose_name='Хэштеги')),
                ('geolocation', models.CharField(blank=True, max_length=128, null=True, verbose_name='Геолокация')),
                ('references', models.TextField(blank=True, null=True, verbose_name='Референсы')),
                ('inventory', models.TextField(blank=True, null=True, verbose_name='Инвентарь')),
                ('to_do_list', models.TextField(blank=True, null=True, verbose_name='To Do List')),
                ('notes', models.TextField(blank=True, null=True, verbose_name='Заметки')),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='postideas', to=settings.AUTH_USER_MODEL, verbose_name='Автор')),
                ('content_type', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='postideas', to='projects.contenttype', verbose_name='Тип контента')),
                ('format', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='postideas', to='projects.format', verbose_name='Формат')),
                ('heading', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='postideas', to='projects.heading', verbose_name='Рубрика')),
                ('is_done', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='postideas', to='projects.done', verbose_name='Готово')),
                ('project', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='postideas', to='projects.project', verbose_name='Проект')),
                ('social_network', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='postideas', to='projects.socialnetwork', verbose_name='Площадка')),
            ],
            options={
                'verbose_name': 'Идея для поста',
                'verbose_name_plural': 'Идеи для постов',
            },
        ),
    ]
