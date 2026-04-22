const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Введите N и M: ", function(input) {
    let [N, M] = input.split(" ").map(Number);

    let total = N;
    let empty = N;
    let steps = 0;

    console.log("\nПошаговый процесс:");

    while (empty > 0) {
        if (empty >= M) {
            let groups = Math.floor(empty / M);
            let used = groups * M;

            console.log("1 ".repeat(groups) + "-> шаг " + (steps + 1));
            steps++;

            console.log("0 ".repeat(used));

            total += groups;
            empty = empty - used + groups;
        } else {
            steps++;
            console.log("1 -> шаг " + steps);
            empty--;
        }
    }

    console.log("\nРезультат:");
    console.log("Максимум выпито:", total);
    console.log("Количество шагов:", steps);

    rl.close();
});
