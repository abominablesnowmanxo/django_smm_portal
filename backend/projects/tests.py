from django.test import TestCase
from django.urls import reverse
from django.contrib.auth import get_user_model

User = get_user_model()


class HomePageViewTest(TestCase):

    def setUp(self):
        self.test_user = User.objects.create_user(username='testuser', password='123Password')
        self.url = reverse('projects:home')

    def test_home_page_view_for_authenticated_user(self):
        self.client.login(username='testuser', password='123Password')
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        self.assertTrue(response.context['user'].is_authenticated)
        self.assertTemplateUsed(response, 'projects/home.html')

    def test_home_page_view_for_unauthenticated_user(self):
        response = self.client.get(self.url)
        print(response, flush=True)
        self.assertEqual(response.status_code, 302)
        # self.assertFalse(response.get('user'))
        # self.assertTrue(response.context['user'].is_authenticated)
        self.assertRedirects(response, '/accounts/login/?next=/')
