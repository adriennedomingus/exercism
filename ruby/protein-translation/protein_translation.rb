class Translation

  CODONS = {
    'Methionine' => ['AUG'],
    'Phenylalanine' => ['UUU', 'UUC'],
    'Leucine' => ['UUA', 'UUG'],
    'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
    'Tyrosine' => ['UAU', 'UAC'],
    'Cysteine' => ['UGU', 'UGC'],
    'Tryptophan' => ['UGG'],
    'STOP' => ['UAA', 'UAG', 'UGA']
  }
  CODONS.default = nil

  def self.of_codon(codon)
    CODONS.each do |protein, codons|
      if codons.include?(codon)
        return protein
      end
    end
    raise InvalidCodonError.new
  end

  def self.of_rna(strand)
    codons = split_strand(strand)
    protein = []
    codons.each do |codon|
      return protein if of_codon(codon) == 'STOP'
      protein << of_codon(codon)
    end
    protein
  end

  def self.split_strand(strand)
    strand.scan(/.{3}/)
  end
end

class InvalidCodonError < StandardError
end
