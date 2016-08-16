VOWELS = "aeiou"
TWO_LETTER_COMBOS = ("ch", "th", "qu")
THREE_LETTER_COMBOS = ("squ", "sch", "thr")

def translate(phrase):
    if " " in phrase:
        return " ".join([translate_word(word) for word in phrase.split(" ")])
    else:
        return translate_word(phrase)

def translate_word(word):
    if word[0] in VOWELS or edge_case_consonant_start(word):
        return handle_vowel_start(word)
    elif word[0:3] in THREE_LETTER_COMBOS:
        return handle_consonant_start(word, 3)
    elif word[0:2] in TWO_LETTER_COMBOS:
        return handle_consonant_start(word, 2)
    else:
        return handle_consonant_start(word, 1)

def handle_vowel_start(word):
    return word + "ay"

def handle_consonant_start(word, count):
    first = word[0:count]
    return word[count:] + first + "ay"

def edge_case_consonant_start(word):
    return (word[0] == "y" or word[0] == "x") and word[1] not in VOWELS
