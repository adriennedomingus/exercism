function School() {
  var roster = {}

  this.roster = function() {
    return roster;
  }

  this.add = function(student, grade) {
    if (roster[grade] === undefined ) {
      roster[grade] = [student];
    } else {
      roster[grade].push(student)
      roster[grade] = roster[grade].sort()
    }
  }

  this.grade = function(grade) {
    if (roster[grade]) {
      return roster[grade];
    }
    return [];
  }
}

module.exports = School;
