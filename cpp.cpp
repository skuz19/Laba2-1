#include <iostream>
using namespace std;

int main() {
    int N;
    cout << "Введите количество чисел: ";
    cin >> N;

    int sum = 0;

    for (int i = 0; i < N; i++) {
        int x;
        cin >> x;

        // разбираем число на цифры
        while (x > 0) {
            int digit = x % 10;

            if (digit % 3 == 0) {
                sum += digit;
            }

            x /= 10;
        }
    }

    cout << "Сумма цифр: " << sum << endl;

    return 0;
}
