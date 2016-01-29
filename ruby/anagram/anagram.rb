class Anagram
  attr_reader :anagrams

  def initialize(word)
    @word = word.downcase
  end

  def match(options)
    @anagrams = options.select do |option|
      option.downcase.chars != @word.chars && option.downcase.chars.sort == @word.chars.sort
    end
  end

end
