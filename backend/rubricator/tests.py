from django.test import TestCase
from django.contrib.auth import get_user_model
from django.urls import reverse

from .models import Rubricator

User = get_user_model()

class RubricatorCreateViewTest(TestCase):

    def setUp(self):
        self.test_user = User.objects.create_user(username='testuser', password='123Password')
        self.url = reverse('rubricator:create')
        self.rubricator_data = {
            'content_type': 'Test ContentType',
            'heading': 'Test Heading',
            'description': 'Test Description'
        }

    # def test_create_rubricator_view_for_authenticated_user(self):
    #     self.client.login(username='testuser', password='123Password')
    #     response = self.client.post(self.url, self.rubricator_data)
    #     self.assertEqual(response.status_code, 201)
