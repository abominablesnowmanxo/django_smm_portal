from datetime import datetime
from typing import Any, Dict
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import CreateView, DeleteView, ListView, TemplateView, UpdateView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.exceptions import PermissionDenied
from django.db.models import Q

from utils.my_calendar import MyCalendar
from .forms import PostIdeaForm
from .models import PostIdea, Project


class HomePageView(LoginRequiredMixin, TemplateView):
    template_name = 'projects/home.html'


class IdeasListView(LoginRequiredMixin, ListView):
    model = PostIdea
    template_name = 'projects/all_ideas.html'
    context_object_name = 'ideas'
    paginate_by = 6
    ordering = ('-publish_date')

    def get_queryset(self):
        queryset = super().get_queryset()
        q = self.request.GET.get('q') if self.request.GET.get('q') != None else ''
        queryset = queryset.filter(author=self.request.user, project__name__icontains=q)
        return queryset

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['projects'] = Project.objects.filter(author=self.request.user)
        return context


class IdeaCreateView(LoginRequiredMixin, CreateView):
    model = PostIdea
    form_class = PostIdeaForm
    template_name = 'projects/create_idea.html'
    success_url = reverse_lazy('projects:all_ideas')

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def get_initial(self) -> Dict[str, Any]:
        initial = super().get_initial()
        current_date = self.request.GET.get('date')
        if current_date is not None:
            datetime_date = datetime.strptime(current_date, '%Y-%m-%d')
            initial['publish_date'] = datetime_date
        return initial


class PostCreateView(LoginRequiredMixin, CreateView):
    model = PostIdea
    form_class = PostIdeaForm
    template_name = 'projects/create_post.html'
    success_url = reverse_lazy('projects:all_ideas')


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
    success_url = reverse_lazy('projects:all_ideas')

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


def month_calendar(request):
    my_calendar = MyCalendar()
    current_year = my_calendar.year
    prev_date = my_calendar.previous_date
    next_date = my_calendar.next_date
    month_name = my_calendar.month_name
    month_dates = my_calendar.month_dates
    today = datetime.now().date
    posts = PostIdea.objects.filter(publish_date__in=month_dates).all()

    return render(request, 'projects/month_calendar.html', {
        'current_year': current_year,
        'month_name': month_name,
        'prev_date': prev_date,
        'next_date': next_date,
        'today': today,
        'month_dates': month_dates,
        'posts': posts
    })


def month_calendar_change(request, year, month):
    my_calendar = MyCalendar(year, month)
    current_year = my_calendar.year
    prev_date = my_calendar.previous_date
    next_date = my_calendar.next_date
    month_name = my_calendar.month_name
    month_dates = my_calendar.month_dates
    today = datetime.now().date
    posts = PostIdea.objects.filter(publish_date__in=month_dates).all()

    return render(request, 'projects/month_calendar.html', {
        'current_year': current_year,
        'month_name': month_name,
        'prev_date': prev_date,
        'next_date': next_date,
        'today': today,
        'month_dates': month_dates,
        'posts': posts
    })
