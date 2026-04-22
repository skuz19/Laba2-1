// функция вычисляет минимальное число операций
function MinCount(S) {
    let n = S.length;   // длина строки
    let ans = n;        // вариант без удвоения

    // перебираем длину префикса T
    for (let k = 1; k <= Math.floor(n / 2); k++) {
        let ok = true;

        // проверяем, можно ли сделать удвоение (T + T)
        for (let i = 0; i < k; i++) {
            if (S[i] !== S[i + k]) {
                ok = false;
                break;
            }
        }

        // если нашли подходящий вариант
        if (ok) {
            let ops = n - k + 1; // считаем операции
            if (ops < ans) {
                ans = ops;
            }
        }
    }

    return ans;
}

// ввод строки (Node.js)
const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Введите строку: ", function(S) {
    console.log("Минимальное число операций:", MinCount(S));
    rl.close();
});
