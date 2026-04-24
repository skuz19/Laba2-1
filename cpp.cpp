#include <iostream>
using namespace std;

int main() {
    int N;
    cout << "Введите количество чисел: ";

    if (!(cin >> N) || N < 1) {
        cout << "есть ненатуральное число" << endl;
        return 1;
    }

    int sum = 0;

    cout << "Введите числа:\n";

    for (int i = 0; i < N; i++) {
        int x;

        if (!(cin >> x)) {
            cout << "есть ненатуральное число" << endl;
            return 1;
        }

        // пропуск ненатуральных
        if (x < 1) continue;

        while (x > 0) {
            int digit = x % 10;
            sum += digit;
            x /= 10;
        }
    }

    cout << "Сумма цифр: " << sum << endl;

    return 0;
}
