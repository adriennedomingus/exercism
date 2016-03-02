DnaTranscriber = function() {
  'use strict';

  const COMPLEMENTS = {
   "G": "C",
   "C": "G",
   "T": "A",
   "A": "U"
  }

  this.toRna = function(dnaStrand) {
    let mappingFunction = function(nucleotide) {
      return COMPLEMENTS[nucleotide];
    };

    let allNucleotides = dnaStrand.split("").map(mappingFunction);
      return allNucleotides.join("");
  };

};


module.exports = DnaTranscriber;
