class Hamming

  VERSION = 1

  def self.compute(strand1, strand2)
    verify_strands(strand1, strand2)

    strand1.length.times.count do |diff|
       strand1[diff] != strand2[diff]
    end
  end

  def self.verify_strands(strand1, strand2)
    if strand1.length != strand2.length
      raise ArgumentError.new("Looks like your strand lengths aren't the same.")
    end
  end
end
