class School
  attr_reader :database
  VERSION = 1

  def initialize
    @database = {}
  end

  def to_h
    Hash[database.sort].each do |key, value|
      value = value.sort!
    end
  end

  def add(student, grade)
    database[grade] ||= []
    database[grade] << student
  end

  def grade(grade)
    if database[grade]
      database[grade].sort
    else
      []
    end
  end
end
