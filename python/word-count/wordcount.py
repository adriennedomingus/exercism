from collections import Counter
import re

def word_count(string):
    formatted_string = format_string(string)
    return Counter(formatted_string.split())

def format_string(string):
    return re.sub(r'[^0-9a-zA-Z \_\\n\\t]+', " ", string).replace("_", " ").lower()
