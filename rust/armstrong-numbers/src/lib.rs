pub fn is_armstrong_number(num: u32) -> bool {
    let numstr = num.to_string();
    let sum_of_digits = numstr
        .split("")
        .filter(|x| x.len() > 0)
        .fold(0, |acc, digit| {
            let base: u32 = digit.parse().expect("A number!");
            let power: u32 = numstr.len() as u32;
            acc + base.pow(power)
        });
    num == sum_of_digits
}
