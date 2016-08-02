import random
import re

ALPHABET = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

class Cipher():

    def __init__(self, key=None):
        if key == None:
            self.key = self.generate_random_key(key)
        elif len(re.sub("[^a-z]+", "", key)) != len(key):
            raise ValueError()
        else:
            self.key = key

    def encode(self, phrase):
        return self.translate(phrase, 1)

    def decode(self, phrase):
        return self.translate(phrase, -1)

    def translate(self, phrase, direction):
        while len(self.key) < len(phrase):
            self.key += self.key
        encoded = ""
        for index, letter in enumerate(phrase):
            if letter.lower() in ALPHABET:
                transformation = ALPHABET.index(self.key[index])
                new_index = (ALPHABET.index(letter.lower()) + transformation * direction) % 26
                encoded += ALPHABET[new_index]
        return encoded


    def generate_random_key(self, key):
        key = ""
        while len(key) < 100:
            key += ALPHABET[random.randrange(25)]
        return key


class Caesar(Cipher):
    def __init__(self):
        self.key = 'd'
