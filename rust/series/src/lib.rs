pub fn series(digits: &str, len: usize) -> Vec<String> {
    // If the user wants a string longer than the string they gave us,
    // return an empty Vec
    if len > digits.len() { return Vec::<String>::new(); }
    // otherwise, calculate all the strings for them
    (0..(digits.len()-len+1))
        .filter_map(|idx| digits.get(idx..idx+len))
        .map(|string| String::from(string)) // map &str to String
        .collect()
}
