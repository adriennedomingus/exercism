from datetime import datetime
from datetime import timedelta

def add_gigasecond(date):
    return date + timedelta(seconds = GIGASECOND)

GIGASECOND = 10 ** 9
