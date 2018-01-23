// method that preforms basic string compression
// input: aabcccccaaa
// output: a2b1c5a3

// O(n)
// create hash map to store the letters that appear as keys
// and the number of times they appear as values
// then iterate over hash table and create string.
const stringCompression = (str) => {
  let counter = {};
  let result = "";
  // O(n)
  for (let i = 0; i < str.length; i++) {
    // console.log(counter[str[i]])
    if (isNaN(counter[str[i]])) {
      counter[str[i]] = 1;
    } else {
      counter[str[i]] += 1;
    }
  }

  // O(n)
  let keys = Object.keys(counter);

  // O(m)
  for (let i = 0; i < keys.length; i++) {
    result = result.concat(keys[i], counter[keys[i]]);
  }

  return result;
};


console.log(stringCompression("aabbccc"));