class Year

  VERSION = 1

  def self.leap?(year)
    divisible_by?(year, 400) || divisible_by?(year, 4) && !divisible_by?(year, 100)
  end

  def self.divisible_by?(year, num)
    year % num == 0
  end
end
