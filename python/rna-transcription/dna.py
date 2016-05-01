def to_rna(strand):
    converted = [CONVERSIONS[letter] for letter in strand]
    return ''.join(converted)

CONVERSIONS =  {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'}
