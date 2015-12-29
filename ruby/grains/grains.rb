class Grains

  def self.square(number)
    if number == 1
      1
    else
      square(number - 1) * 2
    end
  end

  def self.total
    0.upto(64).reduce do |grains, per_square|
      grains + square(per_square)
    end
  end
end
