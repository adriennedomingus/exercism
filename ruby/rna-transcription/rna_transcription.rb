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
    strand.split('').each do |nucleotide|
      if nucleotide != 'A' && nucleotide != 'G' && nucleotide != 'C' && nucleotide != 'T'
        raise ArgumentError.new
      end
    end
  end

  def self.verify_rna(strand)
    strand.split('').each do |nucleotide|
      if nucleotide != 'A' && nucleotide != 'G' && nucleotide != 'C' && nucleotide != 'U'
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
