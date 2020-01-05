pub fn square(s: u32) -> u64 {
    if s <= 0 || s > 64 { panic!("Square must be between 1 and 64"); }
    // if the quare is on a chess board
    if s == 1 { 1 }
    else { 2 * square(s-1) }
}

pub fn total() -> u64 {
    (1..=64).fold(0, |acc, x| acc + square(x))
}
