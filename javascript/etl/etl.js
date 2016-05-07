var ETL = function() {
}

ETL.prototype.transform = function(old) {
  var transformed = {}
  for (var score in old) {
    for (var i = 0; i < old[score].length; i++) {
      transformed[old[score][i].toLowerCase()] = parseInt(score)
    }
  }
  return transformed;
}

module.exports = ETL;
