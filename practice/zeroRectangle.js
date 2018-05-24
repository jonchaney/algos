
// Imagine we have an image. We’ll represent this image as a simple 2D array where every pixel is a 1 or a 0. The image you get is known to have a single rectangle of 0s on a background of 1s. 
// Write a function that takes in the image and returns the coordinates of the rectangle of 0’s -- either top-left and bottom-right; or top-left, width, and height.
let image = [
[1, 1, 1, 1, 1, 1, 1],
[1, 1, 1, 1, 1, 1, 1],
[1, 1, 1, 0, 0, 0, 1],
[1, 1, 1, 0, 0, 0, 1],
[1, 1, 1, 1, 1, 1, 1],
];
// Sample output:
// {x: 3, y: 2, width: 3, height: 2}



const zeroRectangle = (image) => {
    let result = {
        x: null,
        y: null,
        height: 0,
        width: 0
    }
    let found = false;
    for (let i = 0; i < image.length; i++ ) {
        for (let j = 0; j < image[i].length; j++) {
            if(image[i][j] === 0) {
                if (!found) {
                    result.x = j;
                    result.y = i;
                    result.height += 1;
                    result.width += 1;
                    found = true;
                } else {
                    if (result.x === j) {
                        result.width += 1;
                    } 
                    if (result.y === i) {
                        result.height += 1
                    }
                }
            }
        }
    }
    return result;
}

console.log(zeroRectangle(image));