extern crate rand;

use std::convert::TryInto;
use rand::{thread_rng, Rng};

pub fn private_key(p: u64) -> u64 {
    // unimplemented!("Pick a private key greater than 1 and less than {}", p)
    let mut rng = rand::thread_rng();
    rng.gen_range(1, p)

}

pub fn public_key(p: u64, g: u64, a: u64) -> u64 {
    // unimplemented!(
    //     "Calculate public key using prime numbers {} and {}, and private key {}",
    //     p,
    //     g,
    //     a
    // )
    g.pow(a.try_into().unwrap()) % p
}

pub fn secret(p: u64, b_pub: u64, a: u64) -> u64 {
    // unimplemented!(
    //     "Calculate secret key using prime number {}, public key {}, and private key {}",
    //     p,
    //     b_pub,
    //     a
    // )
    b_pub.pow(a.try_into().unwrap()) % p
}
