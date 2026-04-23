const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let lines = [];

rl.on("line", (line) => {
    lines.push(line);
});

rl.on("close", () => {
    let N = parseInt(lines[0]);          // количество чисел
    let nums = lines[1].split(" ");      // <-- ВАЖНО

    let sum = 0;

    for (let i = 0; i < N; i++) {
        let x = parseInt(nums[i]);

        while (x > 0) {
            let digit = x % 10;

            if (digit % 3 === 0) {
                sum += digit;
            }

            x = Math.floor(x / 10);
        }
    }

    console.log("Сумма цифр:", sum);
});
