class Gigasecond

  VERSION = 1
  GIGASECOND = (10**9)

  def self.from(birthday)
    birthday.to_time + GIGASECOND
  end
end
