def is_pangram(sentence):
    letters = map(chr, range(97, 123))
    lower_sentence_list = list(sentence.lower())
    for letter in letters:
        if letter not in lower_sentence_list:
            return False
    return True
