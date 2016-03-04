var Bob = function() {};

Bob.prototype.hey = function(input) {
  if (input === input.toUpperCase()  && input != input.toLowerCase()) {
    return 'Whoa, chill out!';
  } else if (input.endsWith("?")) {
    return 'Sure.';
  } else if (input.replace(/\s/g, "") === "") {
    return 'Fine. Be that way!';
  } else {
    return "Whatever.";
  }
};

module.exports = Bob;
