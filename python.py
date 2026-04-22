N, M = map(int, input("Введите N и M: ").split())

total = N
empty = N
steps = 0

print("\nПошаговый процесс:")

while empty > 0:
    if empty >= M:
        groups = empty // M
        used = groups * M

        print(" ".join(["1"] * groups), "-> шаг", steps + 1)
        steps += 1

        print(" ".join(["0"] * used))

        total += groups
        empty = empty - used + groups
    else:
        steps += 1
        print("1 -> шаг", steps)
        empty -= 1

print("\nРезультат:")
print("Максимум выпито:", total)
print("Количество шагов:", steps)
