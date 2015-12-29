class Year

  VERSION = 1

  def self.leap?(year)
    true if every_four_not_100(year) || every_400(year)
  end

  def self.every_four_not_100(year)
    year % 4 == 0 && year % 100 != 0
  end

  def self.every_400(year)
    year % 400 == 0
  end

end
