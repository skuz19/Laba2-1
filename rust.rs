use std::io;

fn main() {
    println!("Введите количество чисел:");

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: i32 = input.trim().parse().unwrap();

    println!("Введите числа:");

    input.clear();
    io::stdin().read_line(&mut input).unwrap();

    let mut sum = 0;

    // разбиваем строку на числа
    for num in input.split_whitespace().take(n as usize) {
        let mut x: i32 = num.parse().unwrap();

        while x > 0 {
            let digit = x % 10;

            if digit % 3 == 0 {
                sum += digit;
            }

            x /= 10;
        }
    }

    println!("Сумма цифр: {}", sum);
}
