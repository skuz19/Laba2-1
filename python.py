N, M = map(int, input("Введите N и M: ").split())

total = N
empty = N
steps = 1

print("\nПошаговый процесс:")

# начальные банки
for i in range(N):
    print("1", end=" ")
    if (i + 1) % M == 0:
        print()
print("\n{} шаг".format(steps))

# обмены
while empty >= M:
    groups = empty // M
    used = groups * M

    for i in range(used):
        print("0", end=" ")
        if (i + 1) % M == 0:
            print()

    steps += 1
    print(f"{steps} шаг")

    print(" ".join(["1"] * groups))

    total += groups
    empty = empty - used + groups

    steps += 1
    print(f"{steps} шаг")

print("\nРезультат:")
print("Максимум выпито:", total)
print("Количество шагов:", steps)
