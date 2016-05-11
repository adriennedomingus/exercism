import re

def hey(what):
    what = what.strip()
    if what.isupper() and what.lower() != what:
        return 'Whoa, chill out!'
    elif what.endswith('?'):
        return 'Sure.'
    elif len(what) == 0:
        return 'Fine. Be that way!'
    else:
        return 'Whatever.'
