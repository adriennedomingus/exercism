VERSION = 1

class Raindrops

  def self.convert(number)
    result = []
    result << 'Pling' if number % 3 == 0
    result << 'Plang' if number % 5 == 0
    result << 'Plong' if number % 7 == 0
    result << number if result.length == 0
    result.join
  end

end
