class Prime

  def self.nth(n)
    if n == 0
      raise ArgumentError.new("Sorry, you must request at least one prime number.")
    else
      primes = []
      number = 1
      until primes.length == n do
        number += 1
        if prime_number(number) == true
          primes << number
        end
      end
      primes.last
    end
  end

  def prime_number(number)
    return false if number <= 1
    2.upto(Math.sqrt(number).to_i) do |divisor|
      return false if number % divisor == 0
    end
    true
  end
end
