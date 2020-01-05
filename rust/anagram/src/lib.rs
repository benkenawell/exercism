// either the declarative or imperative solutions can be used below
// I'm keeping the declarative solutions because I like that better
// I suppose the imperative solutions are likely more memory performant

use std::collections::HashSet;
use std::iter::FromIterator;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[& 'a str]) -> HashSet<&'a str> {
    // ------ impertive solution ------
    // let mut anagrams: HashSet<& 'a str> = HashSet::new();

    // for &possible_anagram in possible_anagrams {
    //     if is_anagram(word, possible_anagram) {
    //         anagrams.insert(possible_anagram);
    //     }
    // }
    // anagrams

    // ------ declarative solution ------
    HashSet::<& 'a str>::from_iter(possible_anagrams.iter()
        .map(|&anagram| anagram ) // deal with some dereferencing
        .filter(|&possible_anagram| is_anagram(word, possible_anagram))
    )
}

pub fn is_anagram(word: &str, possible_anagram: &str) -> bool {
    if word.len() != possible_anagram.len() 
    || word.to_lowercase() == possible_anagram.to_lowercase() { 
        return false 
    }
    
    // ------ imperative solution ------
    // let mut possible_anagram = String::from(possible_anagram).to_lowercase();
    
    // for letter in word.to_lowercase().chars() {
    //     match possible_anagram.find(letter) {
    //         Some(idx) => {possible_anagram.remove(idx);},
    //         None => ()
    //     }
    // }
    // possible_anagram.is_empty()

    // ------ declarative solution ------
    word.to_lowercase().chars()
        .fold(String::from(possible_anagram.to_lowercase()), |mut acc, letter| match acc.find(letter) {
            Some(idx) => {acc.remove(idx); acc},
            None => acc 
        }).is_empty()
}