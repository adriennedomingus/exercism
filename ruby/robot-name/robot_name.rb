class Robot

  attr_accessor :name

  def initialize(name = name_generator)
    @name = name
  end

  def name_generator
    letters = ('A'..'Z').to_a
    numbers = (0..9).to_a
    name = ""
    2.times do
      name += "#{letters.sample}"
    end
    3.times do
      name += "#{numbers.sample}"
    end
    name
  end

  def reset
    @name = name_generator
  end
end
