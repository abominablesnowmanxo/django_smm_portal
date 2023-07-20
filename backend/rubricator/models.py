from django.db import models

from accounts.models import CustomUser
from projects.models import ContentType, Heading


class Rubricator(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.SET_NULL, null=True)
    heading = models.ForeignKey(Heading, on_delete=models.SET_NULL, null=True)
    description = models.TextField(verbose_name='Описание', null=True, blank=True)
    author = models.ForeignKey(CustomUser, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.content_type} - {self.heading}'
