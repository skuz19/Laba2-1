#include <iostream>
using namespace std;

int main() {
    int N, M;
    cout << "Введите N и M: ";
    cin >> N >> M;

    int total = N;
    int empty = N;
    int steps = 1; // начальный шаг

    cout << "\nПошаговый процесс:\n";

    // начальные банки
    for (int i = 0; i < N; i++) {
        cout << "1 ";
        if ((i + 1) % M == 0) cout << endl;
    }
    cout << endl << "1 шаг\n";

    // обмены
    while (empty >= M) {
        int groups = empty / M;
        int used = groups * M;

        // показываем пустые
        for (int i = 0; i < used; i++) {
            cout << "0 ";
            if ((i + 1) % M == 0) cout << endl;
        }

        steps++;
        cout << steps << " шаг\n";

        // показываем новые полные
        for (int i = 0; i < groups; i++)
            cout << "1 ";
        cout << endl;

        total += groups;
        empty = empty - used + groups;

        steps++;
        cout << steps << " шаг\n";
    }

    cout << "\nРезультат:\n";
    cout << "Максимум выпито: " << total << endl;
    cout << "Количество шагов: " << steps << endl;

    return 0;
}
