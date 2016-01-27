require 'prime'

class PrimeFactors

  def self.for(number)
    possible_divisors = Prime.take_while { |num| num <= number }
    prime_factors = []
    unless number == 1
      possible_divisors.each do |divisor|
        while number % divisor == 0
          prime_factors << divisor
          number /= divisor
        end
      end
    end
    prime_factors
  end
end
