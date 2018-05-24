// Cartesian Product of 2d array.  
// O(n^2) because we have to iterate over both arrays simultaneously

// input:  [[1,2,3],[2,4,6]]
// output: [[2,4,6],[4,8,12],[6,12,18]]
//
//    1, 2, 3
// 2 [2, 4, 6]
// 4 [4, 8, 12]
// 6 [6, 12, 18]

const cartesianProduct = (x, y) => {
    let result = [];
    let cartesian = [];
    for (let i = 0; i < x.length; i++) {
        for (let j = 0; j < y.length; j++) {
            cartesian.push(x[i] * y[j])
        }
        result.push(cartesian)
        cartesian = [];
    }
    return result;
}

console.log(cartesianProduct([1,2,3],[2,4,6]))
