class Garden
  attr_reader :plants, :students

  STUDENTS = [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry
  ]

  PLANTS = {
    'G' => :grass,
    'C' => :clover,
    'R' => :radishes,
    'V' => :violets
  }
  def initialize(plants, students=STUDENTS)
    @plants = plants
    @students = students.map(&:downcase).map(&:to_sym).sort
  end

  def garden
    plants.split("\n").map do |row|
      row.split("")
    end.map do |row|
      row.map { |plant| PLANTS[plant] }
    end
  end

  def method_missing(name)
    garden[0][students.index(name) * 2, 2] + garden[1][students.index(name) * 2, 2]
  end
end
