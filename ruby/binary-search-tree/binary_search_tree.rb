class Bst
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    if new_data <= data
      if left
        left.insert(new_data)
      else
        @left = Bst.new(new_data)
      end
    else
      if right
        right.insert(new_data)
      else
        @right = Bst.new(new_data)
      end
    end
  end

  def each(&block)
    left && left.each(&block)
    block.call(data)
    right && right.each(&block)
  end
end
