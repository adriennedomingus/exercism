class Deque

  def initialize
    @head = nil
    @tail = nil
  end

  def push(data)
    if @head == nil
      node = Node.new(data)
      @head = node
      @tail = node
    else
      node = Node.new(data)
      @tail.next_node = node
      node.previous_node = @tail
      @tail = node
    end
  end

  def pop
    if @head == @tail
      return_value = @head.data
      @head = nil
      @tail = nil
    else
      return_value = @tail.data
      @tail = @tail.previous_node
    end
    return_value
  end

  def shift
    return_value = @head.data
    @head = @head.next_node
    return_value
  end

  def unshift(data)
    node = Node.new(data)
    if @head == nil
      @head = node
      @tail = node
    else
      @head.previous_node = node
      node.next_node = @head
      @head = node
    end
  end
end

class Node
  attr_accessor :data, :next_node, :previous_node

  def initialize(data)
    @data = data
    @next_node = nil
    @previous_node = nil
  end
end
