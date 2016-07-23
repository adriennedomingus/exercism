class Allergies
  attr_reader :score

  ALLERGENS = { 'eggs' =>         1,
                'peanuts' =>      2,
                'shellfish' =>    4,
                'strawberries' => 8,
                'tomatoes' =>     16,
                'chocolate' =>    32,
                'pollen' =>       64,
                'cats' =>         128 }

  def initialize(score)
    @score = score
  end

  def allergic_to?(possible_allergen)
    ALLERGENS[possible_allergen] & score != 0
  end

  def list
    ALLERGENS.keys.select do |allergen|
      allergic_to?(allergen)
    end
  end
end
