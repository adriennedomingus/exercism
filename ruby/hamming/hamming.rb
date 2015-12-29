class Hamming

  VERSION = 1

  def self.compute(strand1, strand2)
    verify_strands(strand1, strand2)
    strand1, strand2 = strand1.chars, strand2.chars
    diff = 0
    strand1.each_with_index do |char, index|
      diff += 1 if strand1[index] != strand2[index]
    end
    diff
  end

  def self.verify_strands(strand1, strand2)
    if strand1.length != strand2.length
      raise ArgumentError.new("Looks like your strand lengths aren't the same.")
    end
  end
end
