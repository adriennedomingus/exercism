from datetime import date
import datetime
import calendar

WEEKDAYS = { 0: "Monday",
         1: "Tuesday",
         2: "Wednesday",
         3: "Thursday",
         4: "Friday",
         5: "Saturday",
         6: "Sunday",
       }

SCHEDULE = { "1st": 0,
             "2nd": 1,
             "3rd": 2,
             "4th": 3,
             "5th": 4,
             "last": -1,
           }

def meetup_day(year, month, day_of_week, schedule):
    correct_day_options = limit_days_based_on_day_of_week(year, month, day_of_week)
    if schedule == "teenth":
        return find_teenth(correct_day_options)
    else:
        return correct_day_options[SCHEDULE[schedule]]

def find_teenth(correct_day_options):
    correct = filter(lambda x: x.day > 12 and x.day < 20, correct_day_options)
    return correct[0]

def limit_days_based_on_day_of_week(year, month, day_of_week):
    correct_day_options = []
    for x in create_all_dates_in_month(year, month):
        if WEEKDAYS[x.weekday()] == day_of_week:
            correct_day_options.append(x)
    return correct_day_options

def create_all_dates_in_month(year, month):
    date_objects = []
    for x in days_in_given_month(year, month):
        date_objects.append(date(year, month, x))
    return date_objects

def days_in_given_month(year, month):
    return range(1, last_day_of_month(year, month) + 1)

def last_day_of_month(year, month):
    return calendar.monthrange(year, month)[1]
