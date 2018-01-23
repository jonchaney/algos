// given an image represented by an NxN matrix, where each pixel
// in the image is 4 bytes, write a method to rotate the image
// by 90 degrees. Can you do this in place?

// brute force with O(n*m) and N space complexity
// create a new array and return it
const rotateMatrixBrute = (matrix) => {
  let result = [];
  // O(m*n)
  for(let i = 0; i < matrix[0].length; i++) {
    result.push([]);
    for (let j = matrix.length - 1; j >= 0; j--) {
      result[i].push(matrix[j][i]);
    }
  }
  return result;
};

console.log(rotateMatrixBrute([[1, 2, 3],
                               [4, 5, 6],
                               [7, 8, 9]]
                              ));

console.log(rotateMatrixBrute([[2, 4],
                               [5, 6]]
                              ));

// in place rotation
const rotateMatrix = (matrix) => {
  let result = [];
  // O(m*n)
  for (let i = 0; i < matrix[0].length; i++) {
    result.push([]);
    for (let j = matrix.length - 1; j >= 0; j--) {
      result[i].push(matrix[j][i]);
    }
  }
  return result;
};

console.log(rotateMatrix([[1, 2, 3],
                          [4, 5, 6],
                          [7, 8, 9]]
                          ));

console.log(rotateMatrix([[2, 4],
                          [5, 6]]
                          ));