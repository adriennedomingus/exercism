class Meetup

  def initialize(month, year)
    @month = month
    @year = year
  end

  def teenth_range
    (13..19).to_a
  end

  def day(weekday, schedule)
    days = (Date.new(@year, @month)..Date.new(@year, @month, -1)).to_a
    options = days.select { |date| date.strftime('%A') == weekday.to_s.capitalize}
    if schedule == :teenth
      options.find { |date| teenth_range.include?(date.day)}
    elsif schedule == :first
      options.first
    elsif schedule == :second
      options[1]
    elsif schedule == :third
      options[2]
    elsif schedule == :fourth
      options[3]
    elsif schedule == :last
      options.schedule.to_s
    end
  end
end
