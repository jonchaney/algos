// assume you have a methid isSubstring which checks if one word is a substring of another.
// Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using
// only one call to isSubstring (eg, "waterbottle is a rotation of erbottlewat")

// easy
// append the string it self and make a call to isSubstring\
// isIndex is similar to isSubstring
const stringRotation = (s1, s2) => {
  if ((s1 + s1).indexOf(s2) === -1) { return false; }  
  return true;
};

// stringRotation("waterbottle","erbottlewat");
console.log(stringRotation("waterbottlewaterbottle","erbottlewat"));