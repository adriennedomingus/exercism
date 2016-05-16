YEARS_PER_EARTH_YEAR = {
                            "mercury": 0.2408467,
                            "venus"  : 0.61519726,
                            "mars"   : 1.8808158,
                            "jupiter": 11.862615,
                            "saturn" : 29.447498,
                            "uranus" : 84.016846,
                            "neptune": 164.79132
                        }

SECONDS_PER_EARTH_YEAR = 31557600.0

class SpaceAge(object):

    def __init__(self, seconds):
        self.seconds = seconds

    def __getattr__(self, planet):
        def _missing():
            return self.calculate(YEARS_PER_EARTH_YEAR[planet.split('_')[1]])
        return _missing

    def on_earth(self):
        return round(self.seconds / SECONDS_PER_EARTH_YEAR, 2)

    def calculate(self, years_per_earth):
        return round(self.on_earth() * ( 1 / years_per_earth), 2)
