class RailFenceCipher
  VERSION = 1

  def self.encode(phrase, number_of_rails)
    return phrase if number_of_rails == 1
    rails = create_structure(phrase, number_of_rails)
    rails.flatten.delete(nil)
    rails.join
  end

  def self.decode(phrase, number_of_rails)
    return phrase if number_of_rails == 1
    rails = create_structure(phrase, number_of_rails)
    rails = correct_decoded_rails(rails, phrase.chars)
    flatten_result(rails)
  end

  private

    def self.create_structure(phrase, number_of_rails)
      rails = []
      number_of_rails.times do
        rails << []
      end
      fill_in_rails(phrase.chars, number_of_rails, rails)
    end

    def self.fill_in_rails(letters, number_of_rails, rails)
      rail_number = 0
      direction = "down"
      letters.each_with_index do |letter, index|
        if rail_number < (number_of_rails - 1) && direction == 'down'
          rails[rail_number][index] = letter
        elsif rail_number == (number_of_rails - 1) && direction == 'down'
          rails[rail_number][index] = letter
          direction = "up"
        elsif rail_number > 0 && direction == 'up'
          rails[rail_number][index] = letter
        elsif rail_number == 0 && direction == 'up'
          rails[rail_number][index] = letter
          direction = "down"
        end
        direction == "up" ? rail_number -= 1 : rail_number += 1
      end
      rails
    end

    def self.correct_decoded_rails(rails, letters)
      rails.each do |rail|
        rail.map! do |letter|
          if letter != nil
            letter = letters[0]
            letters.shift
          end
        end
      end
      rails
    end

    def self.flatten_result(rails)
      result = []
      rails.each do |rail|
        rail.each_with_index do |letter, index|
          result[index] = letter unless letter == nil
        end
      end
      result.join
    end
end
