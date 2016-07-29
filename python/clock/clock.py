class Clock():
    def __init__(self, hour, minutes):
        self.hour = self.set_hour(hour)
        self.minutes = self.set_minutes(minutes)

    def set_hour(self, hour):
        return (hour - 24) % 24

    def set_minutes(self, minutes):
        self.hour += minutes / 60
        self.hour = self.set_hour(self.hour)
        return (60 + minutes) % 60

    def __str__(self):
        return "{:02d}:{:02d}".format(self.hour, self.minutes)

    def add(self, minutes):
        self.minutes += minutes
        self.minutes = self.set_minutes(self.minutes)
        return self

    def __eq__(clock1, clock2):
        if clock1.minutes == clock2.minutes and clock1.hour == clock2.hour:
            return True
        return False
