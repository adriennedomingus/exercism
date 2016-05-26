function Isogram(word) {
  this.word = word.replace(/\W+/g, "").split("");
}

Isogram.prototype.isIsogram = function() {
  var letters = [];
  for (var i = 0; i < this.word.length; i++) {
    if (letters.indexOf(this.word[i].toLowerCase()) !== -1) {
      return false;
    }
    letters.push(this.word[i].toLowerCase());
  }
  return true;
};

module.exports = Isogram;
