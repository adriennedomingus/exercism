class SpaceAge(object):

    def __init__(self, seconds):
        self.seconds = seconds

    def on_earth(self):
        return round(self.seconds / 31557600.0, 2)

    def on_mercury(self):
        return self.calculate(0.2408467)

    def on_venus(self):
        return self.calculate(0.61519726)

    def on_mars(self):
        return self.calculate(1.8808158)

    def on_jupiter(self):
        return self.calculate(11.862615)

    def on_saturn(self):
        return self.calculate(29.447498)

    def on_uranus(self):
        return self.calculate(84.016846)

    def on_neptune(self):
        return self.calculate(164.79132)

    def calculate(self, years_per_earth):
        return round(self.on_earth() * ( 1 / years_per_earth), 2)
