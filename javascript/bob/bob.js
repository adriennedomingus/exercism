var Bob = function() {};

Bob.prototype.hey = function(input) {
  if (input === input.toUpperCase()  && input != input.toLowerCase()) {
    return 'Whoa, chill out!';
  } if (input.endsWith("?")) {
    return 'Sure.';
  } if (input.replace(/\s/g, "") === "") {
    return 'Fine. Be that way!';
  }
    return "Whatever.";
};

module.exports = Bob;
