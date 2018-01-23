// There are three types of edits that can be performed on strings:
// insert a character, remove a character, or replace a character.
// Given two strings, write a function to check if they are one edit
// (or zero edits) away

const oneEditAway = (first, second)  => {
  if (first.length === second.length) {
    return oneEditReplace(first, second);
  } else if (first.length + 1 === second.length) {
    return oneEditInsert(first, second);
  } else if (first.length - 1 === second.length) {
    return oneEditInsert(second, first);
  }
  return false;
};

const oneEditReplace = (str1, str2) => {
  let foundDifference = false;
  for (let i = 0; i < str1.length; i++) {
    if (str1.charAt(i) !== str2.charAt(i)) {
      if (foundDifference) {
        return false;
      }
      // found one difference
      foundDifference = true;
    }
  }
  return true;
};

// check if you can insert a character into str1 to make str2
const oneEditInsert = (str1, str2) => {
  let idx1 = 0;
  let idx2 = 0;
  while (idx2 < str2.length && idx1 < str1.length) {
    if (str1.charAt(idx1) !== str2.charAt(idx2)) {
      if (idx1 !== idx2) {
        return false;
      }
      idx2+=1;
    } else {
      idx1+=1;
      idx2+=1;
    }
  }
  return true;
};



console.log(oneEditAway("pale","pala"));