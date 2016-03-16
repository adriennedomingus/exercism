var Pangram = function(string) {

  var letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

  this.isPangram = function() {
    for (var i = 0; i < letters.length; i++) {
      if (string.toLowerCase().indexOf(letters[i]) === -1) {
        return false;
      }
    }
    return true;
  }
}

module.exports = Pangram;
