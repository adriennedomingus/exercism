Hamming = function(strand1, strand2) {
  this.compute = function(strand1, strand2) {
    if (strand1.length !== strand2.length) {
      throw new Error("DNA strands must be of equal length.");
    }
    var broken1 = strand1.split('');
    var broken2 = strand2.split('');
    var counter = 0;
    for (var i = 0; i < strand1.length; i ++ ) {
      if (strand1[i] !== strand2[i]) {
        counter += 1;
      }
    }
    return counter
  }
}

module.exports = Hamming;
