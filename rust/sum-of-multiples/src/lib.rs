pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (0..limit).fold(Vec::new(), |mut list_of_multiples, i| {
        for factor in factors {
            let multiple = factor * i;
            if multiple < limit && !list_of_multiples.contains(&multiple) {
                list_of_multiples.push(multiple)
            }
        }
        list_of_multiples
    }).iter().fold(0, |sum, x| sum + x)
}
