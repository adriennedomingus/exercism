def sum_of_multiples(max_number, multiples):
    sum = 0
    for number in range(max_number):
        if any(possible_multiple != 0 and number % possible_multiple == 0 for possible_multiple in multiples):
            sum += number
    return sum
