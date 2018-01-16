// There are three types of edits that can be performed on strings:
// insert a character, remove a character, or replace a character.
// Given two strings, write a function to check if they are one edit
// (or zero edits) away

function oneAway(str1, str2) {
  let counter = new Object();
  counter = countLetters(str1, counter);
  counter = countLetters(str2, counter);
  
  let numOnes = 0;
  for (let i = 0; i < Object.keys(counter).length; i++) {
    if (counter[i] === 1) {
      numOnes+=1;
    }
  }
  return numOnes <= 2;

}



const countLetters = (str, counter) => {
  str.split("").forEach((letter) => {
    if (isNaN(counter[letter])) {
      counter[letter] = 1;
    } else {
      counter[letter] += 1;
    }
  });
  return counter;
};

console.log(oneAway("pale","ple"));