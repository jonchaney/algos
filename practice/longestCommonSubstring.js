// given an array of strings, write a function that finds the longest common prefix.

const longestCommonPrefix = (words) => {
    if (words.length === 0) { return ""; }
    let prefix = words[0];
    for (let i = 1; i < words.length; i++) {
        while(words[i].indexOf(prefix) !== 0) {
            prefix = prefix.substring(0, prefix.length -1);
            if (prefix.length === 0) { return ""; }
        }
    }
    return prefix;
}

// output: "ca"
// O(S) time complexity where S is the sum of all strings
console.log(longestCommonSubstring(["cat", "category", "catcafe","cafe"]));

