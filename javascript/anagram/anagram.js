Anagram = function(word) {
  this.matches = function(options) {
    if (typeof options === 'string') {
      options = Array.prototype.slice.call(arguments);
    }
    var sortedWord = word.toLowerCase().split("").sort()
    var sortedOptions = this.sortOptions(options);
    this.removeSelf(options);
    return this.findMatches(sortedWord, sortedOptions, options);
  }

  this.findMatches = function(sortedWord, sortedOptions, options) {
    var matches = [];
    for (var i = 0; i < options.length; i++) {
      if (this.compareContents(sortedWord, sortedOptions[i])) {
        matches.push(options[i]);
      }
    }
    return matches
  }

  this.removeSelf = function(options) {
    for (var i = 0; i < options.length; i++) {
      if (word.toLowerCase() === options[i].toLowerCase()) {
        options.splice(i, 1)
      }
    }
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

  this.sortOptions = function(options){
    var sortedOptions = []
    for (var i = 0; i < options.length; i++) {
      sortedOptions.push(options[i].toLowerCase().split("").sort());
    }
    return sortedOptions
  }
}

module.exports = Anagram;
