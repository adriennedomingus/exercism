class Sieve

  attr_reader :limit

  def initialize(limit)
    @limit = limit
    @primes = []
  end

  def primes
    possible_numbers = 2.upto(limit).to_a
    until possible_numbers.empty?
      @primes << possible_numbers.shift
      possible_numbers.each do |number|
        if number % @primes.last == 0
          possible_numbers.delete(number)
        end
      end
    end
    @primes
  end
end
