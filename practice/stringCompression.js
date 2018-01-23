// method that preforms basic string compression
// input: aabcccccaaa
// output: a2b1c5a3

// O(p + k^2)
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

const stringCompressionOptimized = (str) => {
  let compressed = [];
  let countConsecutive = 0;
  for (let i = 0; i < str.length; i++) {
    countConsecutive++;

    // if next character is different than current, append this char to result.
    if (i + 1 >= str.length || str.charAt(i) != str.charAt(i + 1)) {
      compressed.append(str.charAt(i));
      compressed.append(countConsecutive);
      countConsecutive = 0;
    }
  }
  return compressed.length < str.length ? compressed.join("") : str;
};

console.log(stringCompressionOptimized("aabbccc"));
