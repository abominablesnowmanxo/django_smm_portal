from typing import Any, Dict
from django.forms.models import BaseModelForm
from django.db.models.query import QuerySet
from django.http import HttpResponse
from django.views.generic import (
    CreateView, ListView, UpdateView
)
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy

from projects.models import ContentType
from .forms import RubricatorForm
from .models import Rubricator


class RubricatorListView(LoginRequiredMixin, ListView):
    template_name = 'rubricator/rubricator.html'
    context_object_name = 'topics'

    def get_queryset(self) -> QuerySet[Any]:
        queryset = (
            Rubricator.objects
            .select_related('content_type', 'heading')
            .filter(author=self.request.user)
        )

        q = self.request.GET.get('q')
        if q:
            queryset = queryset.filter(content_type__content_type=q)
        return queryset

    def get_context_data(self, **kwargs: Any) -> Dict[str, Any]:
        context = super().get_context_data(**kwargs)
        context['content_types'] = ContentType.objects.all()
        return context


class RubricatorCreateView(LoginRequiredMixin, CreateView):
    model = Rubricator
    form_class = RubricatorForm
    template_name = 'rubricator/create_rubricator.html'
    success_url = reverse_lazy('rubricator:rubricator')

    def form_valid(self, form: BaseModelForm) -> HttpResponse:
        form.instance.author = self.request.user
        return super().form_valid(form)


class RubricatorUpdateView(LoginRequiredMixin, UpdateView):
    model = Rubricator
    form_class = RubricatorForm
    template_name = 'rubricator/update_rubricator.html'
    success_url = reverse_lazy('rubricator:rubricator')
