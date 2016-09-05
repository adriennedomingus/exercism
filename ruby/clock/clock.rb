class Clock
  attr_accessor :time

  def initialize(hour, minutes = 0)
    @time = hour * 60 + minutes
  end

  def self.at(hour, minutes = 0)
    new(hour, minutes)
  end

  def to_s
    the_hour = time / 60
    the_minutes = time % 60
    if the_hour > 23
      the_hour -= 24
    elsif the_hour < 0
      the_hour += 24
    end
    "#{"%02d" % the_hour}:#{"%02d" % the_minutes}"
  end

  def +(minutes_to_add)
    self.time += minutes_to_add
    self
  end

  def -(minutes_to_subtract)
    self.time -= minutes_to_subtract
    self
  end

  def ==(clock2)
    to_s == clock2.to_s
  end
end
