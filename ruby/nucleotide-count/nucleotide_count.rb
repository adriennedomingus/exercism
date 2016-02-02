class Nucleotide
  attr_reader :nucleotides

  VALID_NUCLEOTIDES = ['A', 'T', 'G', 'C']

  def initialize(dna)
    @nucleotides = dna.chars
    if nucleotides.any? { |nucleotide| !VALID_NUCLEOTIDES.include?(nucleotide) }
      raise ArgumentError
    end
  end

  def self.from_dna(dna)
    new(dna)
  end

  def count(nucleotide)
    nucleotides.select do |single|
      single == nucleotide
    end.count
  end

  def histogram
    histogram = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    nucleotides.each do |nucleotide|
      histogram[nucleotide] += 1
    end
    histogram
  end
end
