def prime_factors(number):
    prime_factors = []
    current_factor = 2
    while number > 1:
        while number % current_factor == 0:
            prime_factors.append(current_factor)
            number /= current_factor
        current_factor += 1
    return prime_factors
