function parse(phrase) {
  var newPhrase = phrase.replace(/[.,\/#!$%\^&\*;:{}=\-_~()]/g, " ");
  var allLetters = newPhrase.split("");
  var acronym = "";
  for (var i = 0; i < allLetters.length; i++) {
    if ((letterIsUppercase(allLetters, i) && previousLetterNotUppercase(allLetters, i)) || firstLetterOfWord(allLetters, i)){
      acronym += allLetters[i];
    }
  }
  return acronym.replace(/ /g, "").toUpperCase();
}

function previousLetterNotUppercase(allLetters, i){
  if (allLetters[i - 1]){
    return allLetters[i - 1].toUpperCase() !== allLetters[i - 1];
  }
  return true;
}

function letterIsUppercase(allLetters, i) {
  return allLetters[i] === allLetters[i].toUpperCase();
}

function firstLetterOfWord(allLetters, i){
  return allLetters[i - 1] === " ";
}

module.exports = { parse: parse };
