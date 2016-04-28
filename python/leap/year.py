def is_leap_year(year):
    return divisible_by_four(year) and (not_divisible_by_hundred(year) or divisible_by_four_hundred(year))

def divisible_by_four(year):
    return year % 4 == 0

def not_divisible_by_hundred(year):
    return year % 100 != 0

def divisible_by_four_hundred(year):
    return year % 400 == 0
