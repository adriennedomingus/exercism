class FlattenArray
  VERSION = 1

  def self.flatten(starting_array, flattened = [])
    starting_array.each do |element|
      element.class == Array ? flatten(element, flattened) : flattened << element if element
    end
    flattened
  end
end
