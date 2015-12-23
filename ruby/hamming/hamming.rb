class Hamming

  VERSION = 1

  def self.compute(strand1, strand2)
    strand1 = strand1.chars
    strand2 = strand2.chars
    diff = 0
    if strand1.length != strand2.length
      raise ArgumentError.new
    else
      strand1.each_with_index do |char, index|
        diff += 1 if strand1[index] != strand2[index]
      end
      diff
    end
  end
end
