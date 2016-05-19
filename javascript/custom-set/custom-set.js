function CustomSet(input) {
  this.input = input;
}

CustomSet.prototype.delete = function(numberToDelete){
  var toRemove = this.input.indexOf(numberToDelete);
  this.input.splice(toRemove, 1);
  this.input = this.input.sort();
  return this;
};

CustomSet.prototype.eql = function(set){
  for (var i = 0; i < this.length; i++) {
    if(this.input[i] !== set.input[i]) {
      return false;
    }
  }
  return true;
};

CustomSet.prototype.difference = function(set) {
  for (var i = 0; i < set.input.length; i++) {
    if (this.input.indexOf(set.input[i]) > -1) {
      this.delete(set[i]);
    }
  }
  return this;
};

CustomSet.prototype.disjoint = function(set) {
  if (set.input){
    for (var i = 0; i < set.input.length; i++) {
      if (this.input.indexOf(set.input[i]) > -1) {
        return false;
      }
    }
  }
  return true;
};

CustomSet.prototype.empty = function() {
  this.input = null;
  return this;
};

CustomSet.prototype.intersection = function(set) {
  for (var i = 0; i < set.input.length; i++) {
    if (this.input.indexOf(set.input[i]) === -1) {
      this.delete(set[i]);
    }
  }
  return this;
};

CustomSet.prototype.member = function(num) {
  for (var i = 0; i < this.input.length; i++) {
    if (this.input.indexOf(num) > -1) {
      return true;
    }
  }
  return false;
};

CustomSet.prototype.put = function(number) {
  this.input.push(number);
  this.input = this.input.sort();
  return this;
};

CustomSet.prototype.size = function () {
  var uniqueArray = [];
  if (this.input) {
    for (var i = 0; i < this.input.length; i++) {
      if (uniqueArray.indexOf(this.input[i]) === -1) {
        uniqueArray.push(this.input[i]);
      }
    }
    return uniqueArray.length;
  }
  return 0;
};

module.exports = CustomSet;
