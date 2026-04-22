use std::io;

// функция вычисляет минимальное число операций
fn min_count(s: &String) -> i32 {
    let n = s.len() as i32;
    let mut ans = n;

    let chars: Vec<char> = s.chars().collect();

    for k in 1..=(n / 2) {
        let mut ok = true;

        for i in 0..k {
            if chars[i as usize] != chars[(i + k) as usize] {
                ok = false;
                break;
            }
        }

        if ok {
            let ops = n - k + 1;
            if ops < ans {
                ans = ops;
            }
        }
    }

    ans
}

fn main() {
    let mut s = String::new();

    println!("Введите строку:");
    io::stdin().read_line(&mut s).unwrap();

    let s = s.trim().to_string();

    println!("Минимальное число операций: {}", min_count(&s));
}
