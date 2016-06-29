class NORTH:
    @staticmethod
    def turn_right(self):
        return EAST

    @staticmethod
    def turn_left(self):
        return WEST

    @staticmethod
    def advance(self, x, y):
        return (x, y + 1)

class EAST:
    @staticmethod
    def turn_right(self):
        return SOUTH

    @staticmethod
    def turn_left(self):
        return NORTH

    @staticmethod
    def advance(self, x, y):
        return (x + 1, y)

class SOUTH:
    @staticmethod
    def turn_right(self):
        return WEST

    @staticmethod
    def turn_left(self):
        return EAST

    @staticmethod
    def advance(self, x, y):
        return (x, y - 1)

class WEST:
    @staticmethod
    def turn_right(self):
        return NORTH

    @staticmethod
    def turn_left(self):
        return SOUTH

    @staticmethod
    def advance(self, x, y):
        return (x - 1, y)

class Robot:
    def __init__(self, direction=NORTH, x = 0, y = 0):
        self.coordinates = (x, y)
        self.bearing = direction

    def turn_right(self):
        self.bearing = self.bearing.turn_right(self.bearing)

    def turn_left(self):
        self.bearing = self.bearing.turn_left(self.bearing)

    def advance(self):
        self.coordinates = self.bearing.advance(self.bearing, self.coordinates[0], self.coordinates[1])

    def simulate(self, directions):
        for direction in directions:
            if direction == "L":
                self.turn_left()
            elif direction == "R":
                self.turn_right()
            elif direction == "A":
                self.advance()
