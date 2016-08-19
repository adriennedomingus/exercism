def is_perfect(number):
    factors = list(set(
        factor for possible_factor in range(1, int(number**0.5) + 1)
        if number % possible_factor == 0
        for factor in (possible_factor, number//possible_factor)
    ))
    factors.sort()
    factors.pop()
    if sum(num for num in factors) == number:
        return True
    return False
