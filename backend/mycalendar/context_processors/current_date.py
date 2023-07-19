from datetime import datetime


def current_date(request):
    today = datetime.now()
    return {
        'current_year': int(today.year),
        'current_month': int(today.month),
        'current_day': int(today.day),
    }
