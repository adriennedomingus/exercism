class FoodChain
  VERSION = 2

  ANIMALS =
  [ ["fly",    "I don't know why she swallowed the fly. Perhaps she'll die."],
    ["spider", "It wriggled and jiggled and tickled inside her."],
    ["bird",   "How absurd to swallow a bird!"],
    ["cat",    "Imagine that, to swallow a cat!"],
    ["dog",    "What a hog, to swallow a dog!"],
    ["goat",   "Just opened her throat and swallowed a goat!"],
    ["cow",    "I don't know how she swallowed a cow!"],
    ["horse",  "She's dead, of course!"]
  ]

  def self.song
    first_pass
    @song[0..-2].map do |line|
      line += "\n"
    end.join
  end

  def self.first_pass
    @song = []
    ANIMALS.each_with_index do |animal, index|
      @song << "I know an old lady who swallowed a #{ANIMALS[index][0]}."
      unless index == 0
        @song << "#{ANIMALS[index][1]}"
      end
      index.times do
        case ANIMALS[index-1][0]
        when "spider"
          @line =  "She swallowed the #{ANIMALS[index][0]} to catch the #{ANIMALS[index-1][0]} that #{ANIMALS[index-1][1].split(' ')[1..-1].join(' ')}"
          flies_dont_catch_horses
        when "cow"
          break
        else
          @line =  "She swallowed the #{ANIMALS[index][0]} to catch the #{ANIMALS[index-1][0]}."
          flies_dont_catch_horses
        end
        index = index - 1
      end
        @song << "#{ANIMALS[0][1]}\n"
    end
    @song
  end

  def self.flies_dont_catch_horses
    unless @line == "She swallowed the fly to catch the horse."
      @song << @line
    end
  end
end
