A = [1, 3, 5, 6, 7, 8, 9, 11, 19, 23, 39, 60, 70, 80, 99]

def linearSearch(A, n):
    for i in range(len(A)):
        if A[i] == n:
            return i
    

def binarySearch(A, n):
    l, r = 0, len(A)
    while r-l > 1:
        mid = (l+r) // 2
        if n == A[mid]:
            return mid
        elif n > A[mid]:
            l = mid
        else:
            r = mid
    return mid

def insertBinarySearch(A, n):
    l, r = 0, len(A)
    while l <= r:
        mid = (l+r) // 2
        print(A[mid])
        if n == A[mid]:
            return mid
        elif n > A[mid]:
            l = mid+1
        else:
            r = mid-1
    A.insert(mid, n)
    print(A)
    return mid


# tester
print(A)
print(linearSearch(A, 81))
print(insertBinarySearch(A, 81))
print(insertBinarySearch(A, 82))
print(insertBinarySearch(A, 83))
print(insertBinarySearch(A, 81))
print(insertBinarySearch(A, 75))
print(insertBinarySearch(A, 2))
print(insertBinarySearch(A, 0))
print(A)