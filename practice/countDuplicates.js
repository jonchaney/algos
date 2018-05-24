function countDuplicates(numbers) {
    // hash counter
    let counter = {}
    let result = 0;
    
    for(let i = 0; i < numbers.length; i++ ) {
        if (!counter[numbers[i]]) {
            counter[numbers[i]] = 1
        } else {
            counter[numbers[i]] += 1
        }
    }
    // count any number that has more than 1 count
    for (let key in counter) {
        if (counter.hasOwnProperty(key)) {
            if (counter[key] > 1) {
                result += 1;
            }
        }
    }

    return result
}

console.log(countDuplicates([1,1,2,3,4,4])) // expected output 2