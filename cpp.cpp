#include <iostream>
#include <string>
using namespace std;

// функция вычисляет минимальное число операций
int MinCount(const string& S) {
    int n = S.size();   // длина строки
    int ans = n;        // без удвоения

    // перебираем длину префикса T
    for (int k = 1; k <= n / 2; k++) {
        bool ok = true;

        // проверяем, можно ли сделать удвоение
        for (int i = 0; i < k; i++) {
            if (S[i] != S[i + k]) {
                ok = false; // если не совпали, удвоение не подходит
                break;
            }
        }

        // если нашли подходящий вариант
        if (ok) {
            int ops = n - k + 1; // считаем операции: k + 1 + (n - 2k)
            if (ops < ans)
                ans = ops;       // выбираем минимум
        }
    }

    return ans; // возвращаем результат
}

int main() {
    string S;

    // ввод строки
    cout << "Введите строку: ";
    cin >> S;

    // вывод результата
    cout << "Минимальное число операций: " 
         << MinCount(S) << endl;

    return 0;
}
