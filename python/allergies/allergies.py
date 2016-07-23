class Allergies():

    ALLERGENS = { 'eggs':         1,
                  'peanuts':      2,
                  'shellfish':    4,
                  'strawberries': 8,
                  'tomatoes':     16,
                  'chocolate':    32,
                  'pollen':       64,
                  'cats':         128 }

    def __init__(self, score):
        self.score = score
        self.lst = list(allergy for allergy in self.ALLERGENS if self.is_allergic_to(allergy))

    def is_allergic_to(self, possible_allergen):
        return self.ALLERGENS[possible_allergen] & self.score
