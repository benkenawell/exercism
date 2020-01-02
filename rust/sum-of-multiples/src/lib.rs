pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut sum = Vec::new();
    for i in 0..limit {
        for factor in factors {
            let multiple = factor * i;
            if multiple < limit && !sum.contains(&multiple) {
                sum.push(multiple)
            }
        }
    }
    sum.iter().fold(0, |sum, x| sum + x)
}
