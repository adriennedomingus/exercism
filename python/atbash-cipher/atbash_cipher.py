import re

def encode(phrase):
    phrase = re.sub("[^0-9a-zA-Z]+", "", phrase)
    result = translate(phrase)
    return re.sub("(.{5})", "\\1 ", result, 0, re.DOTALL).strip()

def decode(phrase):
    phrase = re.sub(" ", "", phrase)
    result = translate(phrase)
    return result.strip()

def translate(phrase):
    result = ""
    for letter in phrase:
        if letter.lower() in alphabet():
            current_index = alphabet().index(letter.lower())
            new_index = abs(25 - current_index)
            result += alphabet()[new_index]
        else:
            result += letter
    return result

def alphabet():
    return ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
