pub fn is_armstrong_number(num: u32) -> bool {
    let numstr = num.to_string();
    let digits: Vec<&str> = numstr.split("").filter(|x| x.len() > 0).collect();
    let sum_of_digits = (0..digits.len()).fold(0, |acc, idx| {
        let base: u32 = digits[idx].parse().expect("A number!");
        let power: u32 = digits.len() as u32;
        acc + base.pow(power)
    });
    num == sum_of_digits
}
