from datetime import datetime
from django.shortcuts import render
from django.contrib.auth.decorators import login_required

from projects.models import PostIdea
from .utils.my_calendar import MyCalendar


@login_required
def month_calendar(request, year, month):
    my_calendar = MyCalendar(year, month)
    prev_date = my_calendar.previous_date
    next_date = my_calendar.next_date
    month_name = my_calendar.month_name
    month_dates = my_calendar.month_dates
    today = datetime.now().date
    posts = (
        PostIdea.objects
        .select_related('project', 'format', 'is_done')
        .filter(publish_date__in=month_dates, author=request.user)
    )

    return render(request, 'mycalendar/month_calendar.html', {
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
    prev_date = my_calendar.previous_date
    next_date = my_calendar.next_date
    month_name = my_calendar.month_name
    week_dates = my_calendar.week_dates()
    today = datetime.now().date
    posts = (
        PostIdea.objects
        .select_related('author', 'project', 'heading', 'content_type',
        'social_network', 'format', 'is_done')
        .filter(publish_date__in=week_dates, author=request.user)
    )

    return render(request, 'mycalendar/week_calendar.html', {
        'month_name': month_name,
        'prev_date': prev_date,
        'next_date': next_date,
        'today': today,
        'month_dates': range(0,49),
        'week_dates': week_dates,
        'posts': posts
    })
