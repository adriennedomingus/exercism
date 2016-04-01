class House
  def self.recite
    song = ""
    number = 1
    until number > 12 do
      song << verse(number) + "\n"
      number += 1
    end
    song.chomp
  end

  def self.verse(number)
    line_number = number
    verse = ""
    number.times do
      if line_number == number
        verse << "This is the #{pieces[-line_number][1]}\n"
      else
        verse << "that #{pieces[-line_number][0]} the #{pieces[-line_number][1]}\n"
      end
      line_number -= 1
    end
    verse
  end

  def self.pieces
    [
      ['', 'horse and the hound and the horn'],
      ['belonged to', 'farmer sowing his corn'],
      ['kept', 'rooster that crowed in the morn'],
      ['woke', 'priest all shaven and shorn'],
      ['married', 'man all tattered and torn'],
      ['kissed', 'maiden all forlorn'],
      ['milked', 'cow with the crumpled horn'],
      ['tossed', 'dog'],
      ['worried', 'cat'],
      ['killed', 'rat'],
      ['ate', 'malt'],
      ['lay in', 'house that Jack built.']
    ]
  end
end
