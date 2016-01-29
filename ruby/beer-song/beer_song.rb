class BeerSong

  VERSION = 2

  def verse(verse_number)
      "#{first_line(verse_number)}" \
      "#{second_line(verse_number)}"
  end

  def verses(starting_verse, ending_verse)
    range = (ending_verse..starting_verse).to_a.reverse
    verses = ""
    range.each do |verse_number|
      verses << verse(verse_number) + "\n" \
    end
    verses.chomp
  end

  def lyrics
    verses(99, 0)
  end

  def second_line(verse_number)
    new_bottle_number = verse_number - 1
    if verse_number > 2
      "Take one down and pass it around, #{new_bottle_number} bottles of beer on the wall.\n"
    elsif verse_number == 2
      "Take one down and pass it around, #{new_bottle_number} bottle of beer on the wall.\n"
    elsif verse_number == 1
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif verse_number == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def first_line(verse_number)
    if verse_number != 0
      "#{verse_number} #{singular_or_plural(verse_number)} of beer on the wall, #{verse_number} #{singular_or_plural(verse_number)} of beer.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\n"
    end
  end

  def singular_or_plural(verse_number)
    verse_number > 1 ? "bottles" : "bottle"
  end
end
