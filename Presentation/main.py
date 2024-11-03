import copy

def starmaxxing(S) -> int:
    n = len(S)
    c = 0
    A = copy.deepcopy(S)
    for i in range(n):
        lvl = i+1
        for j in range(n-i):
            if A[j]/lvl > 0.5:
                c += 1
            if j != n-lvl: # don't hit last element
                A[j] += S[j+i+1]
        print(f'lvl: {lvl} | c: {c} | A: {str(A)}')
    return c

def starmaxxing2(S):
    n = len(S)
    cs = 0
    pc_e0 = 0
    pc_g0 = 0
    sf = [0] * (2*n+1)
    sf[n] = 1
    c = 0
    for s in S:
        if s:
            cs += 1
            cc_g0 = 1 + pc_e0 + pc_g0
        else:
            cs -= 1
            cc_g0 = pc_g0 - sf[n+cs]
        pc_g0 = cc_g0
        pc_e0 = sf[n+cs]
        sf[n+cs] += 1
        c += cc_g0
    return c
    
tests = [[0,1,1,0,1,1], [0,1,1,0,1], [1,1,1,1,0]]
for t in tests:
    print(f'for {t}:')
    print(starmaxxing(t))
    print(starmaxxing2(t))