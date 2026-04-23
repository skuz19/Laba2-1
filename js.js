const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Введите количество чисел: ", function(nStr) {
    let N = parseInt(nStr);

    rl.question("Введите числа: ", function(line) {
        let nums = line.split(" ");

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
        rl.close();
    });
});
