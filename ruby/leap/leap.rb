class Year

  VERSION = 1

  def self.leap?(year)
    if every_four_not_100(year) || every_400(year)
      "Yes, #{year} is a leap year"
    else
      "No, #{year} is not a leap year"
    end
  end

  def self.every_four_not_100(year)
    year % 4 == 0 && year % 100 != 0
  end

  def self.every_400(year)
    year % 400 == 0
  end

end
