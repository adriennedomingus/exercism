class Acronym

  VERSION = 1

  def self.abbreviate(phrase)
    new_phrase = extract_acronym(phrase).gsub(/\W/, " ")
    new_phrase.chars.select.with_index do |letter, index|
      letter.upcase == letter || new_phrase[index - 1] == " "
    end.delete_if { |character| character == " " }
       .map { |letter| letter.upcase }.join
  end

  def self.extract_acronym(phrase)
    phrase.include?(":") ? phrase.split(":")[0] : phrase
  end
end
