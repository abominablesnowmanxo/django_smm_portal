from django.contrib import admin

from .models import (
    ContentType, Heading, PostIdea, Format, Done, SocialNetwork, Project
)


@admin.register(PostIdea)
class PostIdeaAdmin(admin.ModelAdmin):
    list_display = (
        'author', 'theme', 'project', 'format', 'publish_date', 'is_done'
    )
    list_filter = ['author', 'publish_date', 'project', 'format', 'is_done']


admin.site.register(Done)
admin.site.register(ContentType)
admin.site.register(Heading)
admin.site.register(Format)
admin.site.register(SocialNetwork)
admin.site.register(Project)
