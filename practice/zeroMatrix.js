// write an algorithm such that if an element in an MxN matrix is zero, 
// the entire row and colunm are set to zero.

// brute force
// O(n)
// keep track of what rows and columns the zeros are in
// iterate over matrix again changing those rows and columns to zero
const zeroMatrixBrute = (matrix) => {
  let rows = []; 
  let columns = [];

  // get columns and rows where zeros exist
  matrix.forEach((row, idx1) => {
    row.forEach((val, idx2) => {
      if (val === 0) {
        if (!row.includes(idx1)) {
          rows.push(idx1);
        }
        if (!columns.includes(idx2)) {
          columns.push(idx2);
        }
      }
    });
  });

  // set columns and rows to zero
  matrix.forEach((row, idx1) => {
    row.forEach((val, idx2) => {
      if (rows.includes(idx1) || columns.includes(idx2)) {
        matrix[idx1][idx2] = 0;
      }
    });
  });

  return matrix;
};


let matrix = [[1,2,6],
              [3,0,7],
              [1,6,6]];

  console.log(zeroMatrixBrute(matrix));