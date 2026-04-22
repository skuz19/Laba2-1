# функция вычисляет минимальное число операций
def MinCount(S):
    n = len(S)      # длина строки
    ans = n         # вариант без удвоения

    # перебираем длину префикса T
    for k in range(1, n // 2 + 1):
        ok = True

        # проверяем, можно ли сделать удвоение (T + T)
        for i in range(k):
            if S[i] != S[i + k]:
                ok = False
                break

        # если нашли подходящий вариант
        if ok:
            ops = n - k + 1  # считаем операции
            if ops < ans:
                ans = ops

    return ans


# main часть программы
S = input("Введите строку: ")

print("Минимальное число операций:", MinCount(S))
