use std::fmt;

pub struct Clock {
    hour: i32,
    minute: i32
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let (hour, minute) = &Clock::roll_over_minute(minutes);
        Clock {
            hour: Clock::roll_over_hour(hours + hour),
            minute: *minute
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(self.hour, self.minute + minutes)
    }

    fn roll_over_hour(hour: i32) -> i32 {
        (((hour % 24) + 24) % 24) // find the modulus of the hour, make sure it's positive.
    }

    fn roll_over_minute (minute: i32) -> (i32, i32) {
        let new_minute = minute % 60; // calculate modulus for minute, this can be negative -60 < new_minute < 60
        // need the test because integer division with negative numbers will be one short
        let hour = if new_minute < 0 {minute / 60 - 1} else { minute / 60};
        // send back hour and make sure new_minute is a positive modulus
        (hour, ((new_minute + 60) % 60))
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hour, self.minute)
    }
}

impl fmt::Debug for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hour, self.minute)
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        self.hour == other.hour && self.minute == other.minute
    }
}
