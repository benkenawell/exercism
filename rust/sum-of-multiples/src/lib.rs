pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    // unimplemented!(
    //     "Sum the multiples of all of {:?} which are less than {}",
    //     factors,
    //     limit
    // )
    let mut sum = 0;
    for i in 0..limit {
        for factor in factors {
            let multiple = factor * i;
            if multiple < limit {
                // println!("adding multiple: {}", multiple);
                sum = sum + multiple;
            }
        }
    }
    println!("intermediate sum: {}", sum);
    // remove any multiples that are combinations of the factors array (and therefore were added twice)
    for a in 0..factors.len() {
        for b in a+1..factors.len() {
            println!("a: {}|{}, b: {}|{}", a, factors[a], b, factors[b]);
            if factors[a] * factors[b] < limit {
                sum -= factors[a] * factors[b]
            }
        }
    }
    // for factor_idx in 0..factors.len() {
    //     for i in 0..limit {
    //         let multiple = factors[factor_idx] * i;
    //         if multiple < limit {
    //             sum += multiple;
    //         }
    //     }
    // }
    sum
}

// checks if the given number has 
pub fn check_factors(num: u32, factors: &[u32]) {

}
