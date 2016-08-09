def sieve(up_to):
    possible_primes = range(2, up_to + 1)
    for prime in possible_primes:
        for possible_prime in possible_primes:
            if prime == possible_prime:
                continue
            elif possible_prime % prime == 0:
                possible_primes.remove(possible_prime)
    return possible_primes
