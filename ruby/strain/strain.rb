class Array
  def keep(&block)
    kept = []
    self.each do |item|
      if block.call(item)
        kept << item
      end
    end
    kept
  end

  def discard(&block)
    discarded = []
    self.each do |item|
      if !block.call(item)
        discarded << item
      end
    end
    discarded
  end
end
