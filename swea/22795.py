T = int(input())
for _ in range(T):
    arr = list(map(int, input().split()))
    s = sum(arr)
    ans = max(arr) + 1
    while True:
        if (s + ans) % 7 == 0:
            print(ans)
            break
        ans += 1
