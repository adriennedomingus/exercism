class Atbash

  def self.encode(word)
    normalized_word(word).map do |letter|
      if alphabet.find_index(letter.downcase)
        new_letter_index(letter)
      else
        letter
      end
    end.join.gsub(/(.{5})/, '\1 ').strip
  end

  def self.normalized_word(word)
    word.gsub(/\W/, "").split("")
  end

  def self.new_letter_index(letter)
    alphabet[(alphabet.find_index(letter.downcase) - 25).abs]
  end

  def self.alphabet
    ("a".."z").to_a
  end
end
