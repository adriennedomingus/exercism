class Proverb
  attr_reader :items, :qualifier

  def initialize(*items)
    @qualifier = items.pop[:qualifier] if items.last.kind_of?(Hash)
    @items = items
  end

  def to_s
    items.map.with_index do |item, index|
      index == (items.length - 1) ? last_line : main_line(item, index)
    end.join("\n")
  end

  def last_line
    "And all for the want of a #{qualifier if qualifier}#{" " if qualifier}#{items[0]}."
  end

  def main_line(item, index)
    "For want of a #{item} the #{items[index + 1]} was lost."
  end

end
