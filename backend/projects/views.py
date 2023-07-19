import json
from datetime import datetime
from typing import Any, Dict
from django.core.exceptions import PermissionDenied
from django.forms.models import BaseModelForm
from django.http import HttpResponse, JsonResponse
from django.db.models.query import QuerySet
from django.shortcuts import get_object_or_404, render
from django.views.generic import (
    CreateView, DeleteView, ListView, TemplateView, UpdateView
)
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.urls import reverse, reverse_lazy

from utils.my_calendar import MyCalendar
from .forms import PostIdeaForm, RubricatorForm
from .models import ContentType, PostIdea, Project, Rubricator


class HomePageView(LoginRequiredMixin, TemplateView):
    template_name = 'projects/home.html'


class IdeasListView(LoginRequiredMixin, ListView):
    template_name = 'projects/all_ideas.html'
    context_object_name = 'ideas'
    paginate_by = 6

    def get_queryset(self) -> QuerySet[Any]:
        queryset = PostIdea.objects.select_related(
                'project','format', 'is_done'
                ).filter(author=self.request.user)

        q = self.request.GET.get('q')
        if q:
            queryset = queryset.filter(project__name__icontains=q)
        return queryset.order_by('-publish_date')

    def get_context_data(self, *args, **kwargs) -> Dict[str, Any]:
        context = super().get_context_data(*args, **kwargs)

        query_params = self.request.GET.copy()
        if 'page' in query_params:
            del query_params['page']

        context['query_string'] = query_params.urlencode()
        context['projects'] = Project.objects.filter(author=self.request.user)
        return context


class RubricatorListView(LoginRequiredMixin, ListView):
    template_name = 'projects/rubricator.html'
    context_object_name = 'topics'

    def get_queryset(self) -> QuerySet[Any]:
        queryset = Rubricator.objects.select_related(
            'content_type', 'heading'
            ).filter(author=self.request.user)

        q = self.request.GET.get('q')
        if q:
            queryset = Rubricator.objects.filter(content_type__content_type=q)
        return queryset

    def get_context_data(self, **kwargs: Any) -> Dict[str, Any]:
        context = super().get_context_data(**kwargs)
        context['content_types'] = ContentType.objects.all()
        return context


class RubricatorCreateView(LoginRequiredMixin, CreateView):
    model = Rubricator
    form_class = RubricatorForm
    template_name = 'projects/create_rubricator.html'
    success_url = reverse_lazy('projects:rubricator')

    def form_valid(self, form: BaseModelForm) -> HttpResponse:
        form.instance.author = self.request.user
        return super().form_valid(form)


class RubricatorUpdateView(LoginRequiredMixin, UpdateView):
    model = Rubricator
    form_class = RubricatorForm
    template_name = 'projects/update_rubricator.html'
    success_url = reverse_lazy('projects:rubricator')


class IdeaCreateView(LoginRequiredMixin, CreateView):
    model = PostIdea
    form_class = PostIdeaForm
    template_name = 'projects/create_idea.html'

    def form_valid(self, form: BaseModelForm) -> HttpResponse:
        form.instance.author = self.request.user
        return super().form_valid(form)

    def get_initial(self) -> Dict[str, Any]:
        initial = super().get_initial()
        publish_date = self.request.GET.get('date')
        if publish_date:
            initial['publish_date'] = datetime.strptime(publish_date, '%Y-%m-%d')
        return initial

    def get_success_url(self) -> str:
        next_url = self.request.GET.get('next')
        if next_url:
            return next_url
        return reverse('projects:all_ideas')


class PostCreateView(LoginRequiredMixin, CreateView):
    model = PostIdea
    form_class = PostIdeaForm
    template_name = 'projects/create_post.html'
    success_url = reverse_lazy('projects:all_ideas')

    def form_valid(self, form: BaseModelForm) -> HttpResponse:
        form.instance.author = self.request.user
        return super().form_valid(form)


class IdeaUpdateView(LoginRequiredMixin, UpdateView):
    model = PostIdea
    form_class = PostIdeaForm
    template_name = 'projects/update_idea.html'
    success_url = reverse_lazy('projects:all_ideas')

    def get_object(self):
        obj = super().get_object()
        if obj.author != self.request.user:
            raise PermissionDenied()
        return obj


class PostUpdateView(LoginRequiredMixin, UpdateView):
    model = PostIdea
    form_class = PostIdeaForm
    template_name = 'projects/update_post.html'

    def get_success_url(self) -> str:
        next_url = self.request.GET.get('next')
        if next_url:
            return next_url
        return reverse('projects:all_ideas')

    def get_object(self):
        obj = super().get_object()
        if obj.author != self.request.user:
            raise PermissionDenied()
        return obj


class PostDeleteView(LoginRequiredMixin, DeleteView):
    model = PostIdea
    template_name = 'projects/delete_idea.html'
    success_url = reverse_lazy('projects:all_ideas')
    context_object_name = 'post'

    def get_object(self):
        obj = super().get_object()
        if obj.author != self.request.user:
            raise PermissionDenied()
        return obj


@login_required
def month_calendar(request, year, month):
    my_calendar = MyCalendar(year, month)
    current_year = my_calendar.year
    prev_date = my_calendar.previous_date
    next_date = my_calendar.next_date
    month_name = my_calendar.month_name
    month_dates = my_calendar.month_dates
    today = datetime.now().date
    posts = (PostIdea.objects
             .filter(publish_date__in=month_dates, author=request.user)
             .select_related('project', 'format', 'is_done')
        )

    return render(request, 'projects/month_calendar.html', {
        'current_year': current_year,
        'month_name': month_name,
        'prev_date': prev_date,
        'next_date': next_date,
        'today': today,
        'month_dates': month_dates,
        'posts': posts
    })


@login_required
def week_calendar(request):
    my_calendar = MyCalendar()
    current_year = my_calendar.year
    prev_date = my_calendar.previous_date
    next_date = my_calendar.next_date
    month_name = my_calendar.month_name
    week_dates = my_calendar.week_dates()
    today = datetime.now().date
    posts = (PostIdea.objects
             .filter(publish_date__in=week_dates, author=request.user)
             .select_related(
                    'author', 'project', 'heading', 'content_type',
                    'social_network', 'format', 'is_done'
                )
            )

    return render(request, 'projects/week_calendar.html', {
        'current_year': current_year,
        'month_name': month_name,
        'prev_date': prev_date,
        'next_date': next_date,
        'today': today,
        'month_dates': range(0,49),
        'week_dates': week_dates,
        'posts': posts
    })


def update_post_date(request):
    if request.method == 'POST':
        post_data = json.loads(request.body.decode("utf-8"))
        post_id = post_data.get('id')
        post_new_publish_date = post_data.get('publishDate')
        post_new_publish_date = datetime.strptime(
            post_new_publish_date, '%b %d, %Y'
        )
        post = get_object_or_404(PostIdea, pk=post_id)
        post.publish_date = post_new_publish_date
        post.save()
        return JsonResponse({'status': 'success'})

    return JsonResponse({'status': 'error', 'message': 'Invalid request'})
