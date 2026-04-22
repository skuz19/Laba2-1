#include <iostream>
using namespace std;

int main() {
    int N, M;
    cout << "Введите N и M: ";
    cin >> N >> M;

    int total = N;   // всего выпито
    int empty = N;   // пустые банки
    int steps = 0;   // шаги

    cout << "\nПошаговый процесс:\n";

    while (empty > 0) {
        // если можем обменять
        if (empty >= M) {
            int groups = empty / M;  // сколько групп
            int used = groups * M;

            // вывод групп
            for (int i = 0; i < groups; i++)
                cout << "1 ";
            cout << "-> шаг " << ++steps << endl;

            // вывод использованных пустых
            for (int i = 0; i < used; i++)
                cout << "0 ";
            cout << endl;

            total += groups;
            empty = empty - used + groups;
        } else {
            // остатки (финальные шаги)
            cout << "1 -> шаг " << ++steps << endl;
            empty--;
        }
    }

    cout << "\nРезультат:\n";
    cout << "Максимум выпито: " << total << endl;
    cout << "Количество шагов: " << steps << endl;

    return 0;
}
