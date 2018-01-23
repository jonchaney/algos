// method that preforms basic string compression
// input: aabcccccaaa
// output: a2b1c5a3

// O(n)
// create hash map to store the letters that appear as keys
// and the number of times they appear as values
// then iterate over hash table and create string.
const stringCompression = (str) => {
  let compressedString = "";
  let countConsecutive = 0;
  for (let i = 0; i < str.length; i++) {
    countConsecutive++;

    // if next character is different than current, append this char to result.
    if (i + 1 >= str.length || str.charAt(i) != str.charAt(i+1)) {
      compressedString += "" + str.charAt(i) + countConsecutive;
      countConsecutive = 0;
    }
  }
  return compressedString.length < str.length ? compressedString : str;
};

console.log(stringCompression("aabbccc"));
