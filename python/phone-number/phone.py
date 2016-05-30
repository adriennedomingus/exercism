import re

class Phone():

    def __init__(self, phone_number):
        self.number = self.clean_and_validate(phone_number)

    def clean_and_validate(self, phone_number):
        clean = self.clean(phone_number)
        validate = self.validate(clean)
        return validate

    def clean(self, phone_number):
        non_numeric = re.compile(r'[^\d]+')
        return non_numeric.sub('', phone_number)

    def validate(self, phone_number):
        if len(phone_number) == 11 and phone_number[0] == "1":
            return phone_number[1:11]
        elif len(phone_number) != 10:
            return "0000000000"
        return phone_number

    def area_code(self):
        return self.number[0:3]

    def pretty(self):
        return "({0}) {1}-{2}".format(self.area_code(), self.number[3:6], self.number[6:11])
