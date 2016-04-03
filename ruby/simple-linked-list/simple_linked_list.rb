class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, next_node = nil)
    @datum = datum
    @next = next_node
  end

  def tail?
    @next == nil
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def push(data)
    node = Element.new(data)
    if @head == nil
      @head = node
    else
      node.next = @head
      @head = node
    end
  end

  def size
    size = 0
    unless @head == nil
      current_node = @head
      until current_node.nil?
        size += 1
        current_node = current_node.next
      end
    end
    size
  end

  def empty?
    @head == nil
  end

  def tail
    if @head
      current_node = @head
      until current_node.tail?
        current_node = current_node.next
      end
      current_node
    end
  end

  def peek
    if @head
      @head.datum
    else
      nil
    end
  end

  def pop
    current_node = @head
    if @head.next == nil
      return_value = @head.datum
      @head = nil
    else
      return_value = @head.datum
      @head = @head.next
    end
    return_value
  end

  def self.from_a(array)
    l = new
    unless array == nil
      array.reverse.each do |datum|
        l.push(datum)
      end
    end
    l
  end

  def to_a
    array = []
    unless @head == nil
      current_node = @head
      array << @head.datum
      until current_node.tail?
        current_node = current_node.next
        array << current_node.datum
      end
    end
    array
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_node = @head
    until current_node.nil?
      new_list.push(current_node.datum)
      current_node = current_node.next
    end
    new_list
  end
end
