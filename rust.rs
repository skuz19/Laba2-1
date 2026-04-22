use std::io;

fn main() {
    println!("Введите N и M:");

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();

    let nums: Vec<i32> = input
        .split_whitespace()
        .map(|x| x.parse().unwrap())
        .collect();

    let mut N = nums[0];
    let M = nums[1];

    let mut total = N;
    let mut empty = N;
    let mut steps = 0;

    println!("\nПошаговый процесс:");

    while empty > 0 {
        if empty >= M {
            let groups = empty / M;
            let used = groups * M;

            // вывод групп
            for _ in 0..groups {
                print!("1 ");
            }
            steps += 1;
            println!("-> шаг {}", steps);

            // вывод пустых
            for _ in 0..used {
                print!("0 ");
            }
            println!();

            total += groups;
            empty = empty - used + groups;
        } else {
            // остатки
            steps += 1;
            println!("1 -> шаг {}", steps);
            empty -= 1;
        }
    }

    println!("\nРезультат:");
    println!("Максимум выпито: {}", total);
    println!("Количество шагов: {}", steps);
}
