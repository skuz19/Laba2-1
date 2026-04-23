N = int(input("Введите количество чисел: "))

print("Введите числа:")

nums = input().split()   # <-- ВАЖНО

sum = 0

for i in range(N):
    x = int(nums[i])

    while x > 0:
        digit = x % 10

        if digit % 3 == 0:
            sum += digit

        x //= 10

print("Сумма цифр:", sum)
