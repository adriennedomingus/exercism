def to_rna(strand):
    split = list(strand)
    converted = [conversions()[letter] for letter in split]
    return ''.join(converted)

def conversions():
    return {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'}
