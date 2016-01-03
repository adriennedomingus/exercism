class Phrase

  VERSION = 1

  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase.downcase.gsub(/[^a-z0-9\s']/, ' ')
  end

  def word_count
    word_frequencies = Hash.new(0)
    phrase.split.each do |word|
      remove_quotations(word)
      word_frequencies[word] +=1
    end
    word_frequencies
  end

  def remove_quotations(word)
    if word.start_with?("'") && word.end_with?("'")
      word.gsub!("'", "")
    end
  end
end
