import re

def hey(what):
    what = what.strip()
    if what.upper() == what and what.lower() != what:
        return 'Whoa, chill out!'
    elif what.endswith('?'):
        return 'Sure.'
    elif len(re.sub(r'\W', '', what)) == 0:
        return 'Fine. Be that way!'
    else:
        return 'Whatever.'
