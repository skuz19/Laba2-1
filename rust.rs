#![allow(non_snake_case)]
#![allow(unused_mut)]

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
    let mut steps = 1;

    println!("\nПошаговый процесс:");

    // начальные банки
    for i in 0..N {
        print!("1 ");
        if (i + 1) % M == 0 {
            println!();
        }
    }
    println!("\n{} шаг", steps);

    // обмены
    while empty >= M {
        let groups = empty / M;
        let used = groups * M;

        // пустые
        for i in 0..used {
            print!("0 ");
            if (i + 1) % M == 0 {
                println!();
            }
        }

        steps += 1;
        println!("{} шаг", steps);

        // новые полные
        for _ in 0..groups {
            print!("1 ");
        }
        println!();

        total += groups;
        empty = empty - used + groups;

        steps += 1;
        println!("{} шаг", steps);
    }

    println!("\nРезультат:");
    println!("Максимум выпито: {}", total);
    println!("Количество шагов: {}", steps);
}
