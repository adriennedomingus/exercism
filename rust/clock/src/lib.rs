use std::fmt;

const MINUTES_PER_HOUR: i32 = 60;
const MINUTES_PER_DAY: i32 = 1440;

#[derive(PartialEq, Eq, Debug)]
pub struct Clock {
    minutes: i32
}

fn rollover_minutes(minutes: i32) -> i32 {
    (minutes.rem_euclid(MINUTES_PER_DAY))
}

impl Clock {

    pub fn new(hours: i32, minutes: i32) -> Self {
        let minutes = rollover_minutes(minutes + (hours * MINUTES_PER_HOUR));
        Clock { minutes }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(0, self.minutes + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let hours = self.minutes / MINUTES_PER_HOUR;
        let minutes = self.minutes % MINUTES_PER_HOUR;
        write!(f, "{:02}:{:02}", hours, minutes)
    }
}
