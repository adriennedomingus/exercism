class Luhn():
    def __init__(self, sequence):
        self.sequence = sequence

    def addends(self):
        new_sequence = []
        if len(str(self.sequence)) % 2 == 0:
            for index, number in enumerate(str(self.sequence)):
                if index % 2 != 0:
                    new_sequence.append(int(number))
                else:
                    new_sequence.append(self.double_number(number))
        else:
            for index, number in enumerate(str(self.sequence)):
                if index % 2 == 0:
                    new_sequence.append(int(number))
                else:
                    new_sequence.append(self.double_number(number))
        return new_sequence

    def double_number(self, number):
        if int(number) * 2 > 9:
            return int(number) * 2 - 9
        else:
            return int(number) * 2

    def checksum(self):
        addended = int(''.join(map(str, self.addends())))
        return sum(int(digit) for digit in str(addended))

    def is_valid(self):
        return self.checksum() % 10 == 0

    @staticmethod
    def create(number):
        possible_checksums = range(0, 9)
        for possible_checksum in possible_checksums:
            if Luhn(int(str(number) + str(possible_checksum))).is_valid():
                return int(str(number) + str(possible_checksum))
