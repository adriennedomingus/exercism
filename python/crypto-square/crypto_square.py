import re
import math

def encode(string):
    message = re.sub("[^a-z0-9]+", "", string.lower()).lower()
    num_columns = int(math.ceil(math.sqrt(len(message))))
    rows = ""
    for index, letter in enumerate(message):
        if index % num_columns == 0:
            rows += "\n"
        rows += letter
    encoded = to_columns(rows.strip().split('\n'))
    return ' '.join(encoded)

def to_columns(rows):
    columns = []
    while len(columns) < len(rows[0]):
        columns.append([])
    for row in rows:
        for index, letter in enumerate(row):
            columns[index].append(letter)
    return [''.join(column) for column in columns]
