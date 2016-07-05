def difference(n):
    return abs(sum_of_squares(n) - square_of_sum(n))

def square_of_sum(n):
    return sum(create_range(n)) ** 2

def sum_of_squares(n):
    squares = map(square, create_range(n))
    return sum(squares)

def square(number):
    return number ** 2

def create_range(n):
    return range(1, n + 1)
