pub fn build_proverb(list: &[&str]) -> String {
    if list.len() < 1 {return String::new();} // double check there are elements in the list
    
    // generate the main lines of the proverb
    let mut proverb: String = String::new();
    for i in 1..list.len() {
        proverb.push_str(&build_line(list[i-1], list[i]));
        proverb.push('\n'); // every line needs to be on a new line
    }
    // add the last line of the proverb
    proverb.push_str(&format!("And all for the want of a {}.", list[0]));

    proverb // return the whole proverb
}

// given two words in the order, generate a single line in the proverb
fn build_line(s1: &str, s2: &str) -> String {
    format!("For want of a {} the {} was lost.", s1, s2)
}
