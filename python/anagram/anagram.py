def detect_anagrams(word, options):
    return [option for option in options if is_anagram(word, option)]

def alphebatized(word):
    return ''.join(sorted(word))

def is_anagram(word, option):
    if word.lower() == option.lower():
        return False
    elif alphebatized(word.lower()) == alphebatized(option.lower()):
        return True
    return False
