function PhoneNumber(initial_number) {
  this.number = function() {
    var number = initial_number.replace(/\D/g, "");
    return this.validateNumber(number);
  }

  this.validateNumber = function(number) {
    if (number.length === 10) {
      return number
    } else if(number.length === 11 && number[0] == '1') {
      return number.slice(1, 11);
    } else if (number.length >= 11 || number.length <= 9) {
      return '0000000000';
    }
  }

  this.areaCode = function() {
    return this.number().substring(0, 3);
  }

  this.toString = function() {
    return '(' + this.areaCode() + ') ' + this.number().substring(3, 6) + '-' + this.number().substring(6, 11)
  }
}

module.exports = PhoneNumber
