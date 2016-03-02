class Complement

  VERSION = 2

  def self.of_dna(strand)
    verify_dna(strand)
    strand.chars.map do |nucleotide|
      complements[nucleotide]
    end.join
  end

  def self.of_rna(strand)
    verify_rna(strand)
    strand.chars.map do |nucleotide|
      complements.invert[nucleotide]
    end.join
  end

  def self.verify_dna(strand)
    strand.chars.each do |nucleotide|
      if !complements.keys.include?(nucleotide)
        raise ArgumentError.new
      end
    end
  end

  def self.verify_rna(strand)
    strand.chars.each do |nucleotide|
      if !complements.values.include?(nucleotide)
        raise ArgumentError.new
      end
    end
  end

  def self.complements
    {
      'G' => 'C',
      'C' => 'G',
      'T' => 'A',
      'A' => 'U'
    }
  end
end
