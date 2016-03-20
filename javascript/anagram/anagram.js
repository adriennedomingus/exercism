Anagram = function(word) {
  this.matches = function(options) {
    if (typeof options === 'string') {
      options = Array.prototype.slice.call(arguments);
    }
    var matches = [];
    var sortedWord = word.toLowerCase().split("").sort()
    var sortedOptions = []
    for (var i = 0; i < options.length; i++) {
      if (word.toLowerCase() === options[i].toLowerCase()) {
        options.splice(i, 1)
      }
    }
    for (var i = 0; i < options.length; i++) {
      sortedOptions.push(options[i].toLowerCase().split("").sort());
    }
    for (var i = 0; i < options.length; i++) {
      if (this.compareContents(sortedWord, sortedOptions[i])) {
        matches.push(options[i]);
      }
    }
    return matches;
  }

  this.compareContents = function(array1, array2) {
    if (array1.length != array2.length) {
      return false;
    }
    for (var i = 0; i < array1.length; i++) {
      if (array1[i] != array2[i]) {
        return false;
      }
    }
    return true;
  }
}

module.exports = Anagram
