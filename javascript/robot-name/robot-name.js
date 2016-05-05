Robot = function() {

  this.name = this.generateName()

  this.reset = function() {
    this.name = this.generateName()
  }
}

var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
var numbers = "0123456789".split('')

var rand = function(array) {
  var index = Math.floor(Math.random() * array.length)
  return array[index];
}

var names = []

Robot.prototype.generateName = function() {
  var name = ""
  name += rand(letters);
  name += rand(letters);
  name += rand(numbers);
  name += rand(numbers);
  name += rand(numbers);

  if (names.indexOf(name) === -1) {
    names.push(name)
    return name;
  } else {
    return this.generateName()
  }
}

module.exports = Robot;
