// in a matrix of one' and zero's return all unique groups of zeros and there sizes

// input :
// [[0,1,1],
//  [1,0,0],
//  [1,0,0]]

// output: 
// [[2,1], [1,2]]

// iterate over grid, when at a zero, find its size and store in an array
// while coming to each zero, store that [x,y] location in an array so when checking 
// other zeros you can see if you have already checked it.

const island = (grid) => {
    let location = {}

    for (let i = 0; i < grid.lengthp; i++) {
        for (let j = 0; j < grid[i].length; j++) {
            if (grid[i][j] === 1) {
                
            }
        }
    }
}



















// in a matrix of one' and zero's return all unique groups of zeros and there sizes