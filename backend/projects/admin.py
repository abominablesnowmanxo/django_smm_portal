from django.contrib import admin

from .models import ContentType, Heading, PostIdea, Formats, Done, SocialNetwork, Project


class PostIdeaAdmin(admin.ModelAdmin):
    list_display = ('author', 'theme', 'project', 'format', 'publish_date', 'is_done')
    list_filter = ['author', 'publish_date', 'format', 'is_done']


admin.site.register(PostIdea, PostIdeaAdmin)
admin.site.register(Done)
admin.site.register(ContentType)
admin.site.register(Heading)
admin.site.register(Formats)
admin.site.register(SocialNetwork)
admin.site.register(Project)
