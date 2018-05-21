// FizzBuzz but with Fibonacci numbers
// n = 4  => "buzz", "buzz", "buzz", "fizz"
// 1, 1, 2, 3, 5, 8

  const fibonacci = (n) => {
    let prev = 1;
    let current = 1;
    let result = [1, 1];
    while (result.length-1 < n) {
        fibs = prev + current;
        // check if fibs === n, return true
        result.push(fibs)
        // if not reassign prev, current
        prev = current;
        current = fibs;
    }
    return result;
  }
  
  const fibsBuzz = (n) => {
    fibs = fibonacci(n);
    for (let i = 1; i <= n; i++) {
      if (fibs.includes(i)) {
        console.log("buzz");
      } else {
        console.log("fizz");
      }
    }
  }
  
  fibsBuzz(4);