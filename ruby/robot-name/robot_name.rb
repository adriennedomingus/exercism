class Robot

  attr_reader :name

  def initialize
    @name = NameGenerator.new.robot_name
  end

  def reset
    @name = NameGenerator.new.robot_name
  end
end

class NameGenerator
  def robot_name
    letters = ('A'..'Z').to_a.sample(2)
    numbers = (0..9).to_a.sample(3)
    (letters + numbers).join
  end
end
