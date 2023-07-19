import datetime
import calendar
from collections import namedtuple


CURRENT_MONTH = datetime.datetime.now().month
CURRENT_YEAR = datetime.datetime.now().year
Date = namedtuple('Date', ['year', 'month'])


class MyCalendar:
    def __init__(self, year=CURRENT_YEAR, month=CURRENT_MONTH):
        self.month = month
        self.year = year

    @property
    def previous_date(self):
        if self.month == 1:
            month = 12
            year = self.year - 1
        else:
            month = self.month - 1
            year = self.year
        return Date(year, month)

    @property
    def next_date(self):
        if self.month == 12:
            month = 1
            year = self.year + 1
        else:
            month = self.month + 1
            year = self.year
        return Date(year, month)

    @property
    def month_name(self):
        month_name = calendar.month_name[self.month]
        return month_name

    @property
    def month_dates(self):
        dates_gen = calendar.Calendar().itermonthdates(self.year, self.month)
        return [date for date in dates_gen]

    @classmethod
    def week_dates(cls):
        today = datetime.date.today()
        current_weekday = today.weekday()  # Monday is 0 and Sunday is 6
        start_of_week = today - datetime.timedelta(days=current_weekday)
        dates_of_week = [start_of_week + datetime.timedelta(days=i) for i in range(7)]
        print(dates_of_week)
        return dates_of_week
