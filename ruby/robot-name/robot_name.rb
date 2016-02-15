class Robot

  attr_reader :name

  def initialize
    @name = name_generator
  end

  def reset
    @name = name_generator
  end

  private

  def name_generator
    letters = ('A'..'Z').to_a.sample(2)
    numbers = (0..9).to_a.sample(3)
    (letters + numbers).join
  end
end
