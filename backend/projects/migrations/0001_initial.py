# Generated by Django 4.2.3 on 2023-07-09 08:58

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
                'verbose_name_plural': 'Статусы',
                'ordering': ['is_done'],
            },
        ),
        migrations.CreateModel(
            name='Formats',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('format', models.CharField(max_length=32)),
            ],
            options={
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
                'verbose_name_plural': 'Площадки',
                'ordering': ['social_network_name'],
            },
        ),
        migrations.CreateModel(
            name='PostIdea',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('theme', models.CharField(max_length=64, verbose_name='Тема')),
                ('short_description', models.TextField(null=True, verbose_name='Краткое описание')),
                ('full_description', models.TextField(blank=True, null=True, verbose_name='Описание')),
                ('publish_date', models.DateField(blank=True, null=True, verbose_name='Дата публикации')),
                ('hashtags', models.CharField(blank=True, max_length=64, null=True, verbose_name='Хэштеги')),
                ('geolocation', models.CharField(blank=True, max_length=128, null=True, verbose_name='Геолокация')),
                ('references', models.TextField(blank=True, null=True, verbose_name='Референсы')),
                ('inventory', models.TextField(blank=True, null=True, verbose_name='Инвентарь')),
                ('to_do_list', models.TextField(blank=True, null=True, verbose_name='To Do List')),
                ('notes', models.TextField(blank=True, null=True, verbose_name='Заметки')),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='postideas', to=settings.AUTH_USER_MODEL)),
                ('content_type', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='projects.contenttype', verbose_name='Тип контента')),
                ('format', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projects.formats', verbose_name='Формат')),
                ('heading', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='projects.heading', verbose_name='Рубрика')),
                ('is_done', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projects.done', verbose_name='Готово')),
                ('social_network', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='projects.socialnetwork', verbose_name='Площадка')),
            ],
            options={
                'verbose_name_plural': 'Идеи для постов',
            },
        ),
    ]
