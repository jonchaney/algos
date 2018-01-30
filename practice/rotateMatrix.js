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

// in place rotation 
// O(n^2)
// swap each edge and decrement along the way
const rotateMatrix = (matrix) => {
  if (matrix.length === 0 || matrix.length !== matrix[0].length) return false;
  let length = matrix.length;
  for (let layer = 0; layer < length / 2; layer++) {
    let first = layer; 
    let last = length - 1 - layer;
    for (let i = first; i < last; i++) {
      let offset = i - first; 
      let top = matrix[first][i]; // save top 
      // left -> top
      matrix[first][i] = matrix[last-offset][first]; 
      
      // bottom -> left
      matrix[last-offset][first] = matrix[last][last-offset];
      
      // right -> bottom 
      matrix[last][last-offset] = matrix[i][last];
      
      // top -> right
      matrix[i][last] = top; // right <- saved top
      printMatrix(matrix);
    }
  }
  return matrix;
};

const printMatrix = (matrix) => {
  console.log("------");
  for (let i = 0; i < matrix.length; i++) {
    console.log(matrix[i]);
  }
};

// [ [ 5, 2 ], 
//   [ 6, 4 ] ]
// console.log(rotateMatrix([[2, 4],
//                           [5, 6]]
//                           ));


// [ [ 7, 4, 1 ], 
//   [ 8, 5, 2 ], 
  // [ 9, 6, 3 ] ]
printMatrix([[1, 2, 3],
[4, 5, 6],
[7, 8, 9]]);
printMatrix(rotateMatrix([[1, 2, 3],
                          [4, 5, 6],
                          [7, 8, 9]]
                          ));

// [7, 4, 1],
// [8, 5, 2],
// [9, 6, 3]]

// [ [ 7, 7, 4, 1 ], 
//   [ 8, 8, 5, 2 ], 
//   [ 9, 9, 6, 3 ],
//   [ 9, 9, 9, 9 ] ]
printMatrix([[1, 2, 3, 4],
[5, 6, 7, 8],
[9, 10, 11, 12],
[13, 14, 15, 16]]);
printMatrix(rotateMatrix([[1, 2, 3, 4],
                          [5, 6, 7, 8],
                          [9, 10, 11, 12],
                          [13, 14, 15, 16]]
                          ));

// [[1, 2, 3, 9],
// [4, 5, 6, 9],
// [7, 8, 9, 9],
// [7, 8, 9, 9]]
                     