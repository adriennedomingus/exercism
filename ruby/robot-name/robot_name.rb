class Robot

  attr_accessor :name

  def initialize(name = name_generator)
    @name = name
  end

  def name_generator
    letters = ('A'..'Z').to_a.sample(2)
    numbers = (0..9).to_a.sample(3)
    (letters + numbers).join
  end

  def reset
    @name = name_generator
  end
end
