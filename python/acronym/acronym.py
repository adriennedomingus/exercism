import re

def abbreviate(phrase):
    phrase = re.sub("[\W]", " ", phrase)
    acronym = ""
    for index, letter in enumerate(phrase):
        if uppercase_or_leading_letter(phrase, index, letter) and not_space(letter) and previous_letter_not_capitalized(phrase, index, letter):
            acronym += letter
    return acronym.upper()

def uppercase_or_leading_letter(phrase, index, letter):
    return letter == letter.upper() or phrase[index - 1] == " "

def not_space(letter):
    return letter != " "

def previous_letter_not_capitalized(phrase, index, letter):
    return phrase[index - 1] == " " or phrase[index - 1] != phrase[index - 1].upper()
