const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Введите N и M: ", function(input) {
    let [N, M] = input.split(" ").map(Number);

    let total = N;
    let empty = N;
    let steps = 1;

    console.log("\nПошаговый процесс:");

    // начальные банки
    for (let i = 0; i < N; i++) {
        process.stdout.write("1 ");
        if ((i + 1) % M === 0) {
            console.log();
        }
    }
    console.log("\n" + steps + " шаг");

    // обмены
    while (empty >= M) {
        let groups = Math.floor(empty / M);
        let used = groups * M;

        for (let i = 0; i < used; i++) {
            process.stdout.write("0 ");
            if ((i + 1) % M === 0) {
                console.log();
            }
        }

        steps++;
        console.log(steps + " шаг");

        console.log("1 ".repeat(groups));

        total += groups;
        empty = empty - used + groups;

        steps++;
        console.log(steps + " шаг");
    }

    console.log("\nРезультат:");
    console.log("Максимум выпито:", total);
    console.log("Количество шагов:", steps);

    rl.close();
});
