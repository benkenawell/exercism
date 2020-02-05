/// Return the Hamming distance between the strings,
/// or None if the lengths are mismatched.
pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {
    if s1.len() != s2.len() { return None; }
    // from here, we assume the strings are equal length
    
    let iter = s1.chars().zip(s2.chars());
    let dist = iter.fold(0, |acc, (x, y)| if x != y { acc + 1 } else { acc });
    Some(dist)
}
