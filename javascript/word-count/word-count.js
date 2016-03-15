Words = function(string) {
  this.count = function(string) {
    var all = string.match(/\S+/g);
    var theCount = new Object();
    for (var i = 0; i < all.length; i ++) {
      if (isNaN(theCount[all[i]])) {
        theCount[all[i]] = 0
      }
      theCount[all[i]]++
    }
    return theCount;
  }
}

module.exports = Words;
