T = int(input())
arr = []
ans = 0
sum = 0
    # 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.
for test_case in range(0, T):
    arr.append(list(map(int, input().split())))
    ans = max(arr[test_case])+1
    for i in range(0, len(arr[test_case])):    
        sum = sum + int(arr[test_case][i])
    while True:
        if (sum + ans)%7 ==0:
            print(ans)
            break
        else:
            ans = ans + 1