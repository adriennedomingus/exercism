NORTH, EAST, SOUTH, WEST = (0, 1), (1, 0), (0, -1), (-1, 0)

RIGHT = { NORTH: EAST,
          EAST: SOUTH,
          SOUTH: WEST,
          WEST: NORTH }

LEFT = { NORTH: WEST,
         EAST: NORTH,
         SOUTH: EAST,
         WEST: SOUTH }

class Robot:

    def __init__(self, bearing = NORTH, x = 0, y = 0):
        self.coordinates = (x, y)
        self.bearing = bearing

    def turn_right(self):
        self.bearing = RIGHT[self.bearing]

    def turn_left(self):
        self.bearing = LEFT[self.bearing]

    def advance_x(self):
        starting_x = self.coordinates[0]
        change_in_x = self.bearing[0]
        return starting_x + change_in_x

    def advance_y(self):
        starting_y = self.coordinates[1]
        change_in_y = self.bearing[1]
        return starting_y + change_in_y

    def advance(self):
        new_x = self.advance_x()
        new_y = self.advance_y()
        self.coordinates = (new_x, new_y)

    def simulate(self, directions):
        for direction in directions:
            if direction == "L":
                self.turn_left()
            elif direction == "R":
                self.turn_right()
            elif direction == "A":
                self.advance()
