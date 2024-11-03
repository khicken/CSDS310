import copy
from bisect import bisect as upper_bound
def starmaxxing(S) -> int:
    n = len(S)
    c = 0
    A = copy.deepcopy(S)
    for i in range(n):
        for j in range(n-i):
            if A[j]/(i+1) > 0.5:
                c += 1
            if j != n-i-1: # don't hit last element
                A[j] += S[j+i+1]
    return c

def starmaxxing2_(S) -> int:
    n = len(S)
    cur_sum = 0
    pc_e0 = 0
    pc_g0 = 0
    
    # exploits that whatever subarrays sum>0, add that to total

    sum_freq = [0] * (2 * n + 1) # freq array of weighted sums
    sum_freq[n] += 1 # we have a zero sum alr

    c = 0
    for s in S:
        if s: # star exists
            cur_sum = cur_sum + 1
            cc_g0 = 1 + pc_e0 + pc_g0
            # above: +1 for subarray [1] + all subarrays w/ sum=0 now have sum=1 + all subarrays w/ sum>0 are still sum>0
        else: # star don't exist
            cur_sum = cur_sum - 1
            cc_g0 = pc_g0 - sum_freq[cur_sum + n]
            # above: + all subarrays w/ sum>0 now hvae sum>-1 (aka sum>=0). so, remove those with sum=0 since we know how many zero sums there have been

        pc_e0 = sum_freq[cur_sum + n]
        # straightforward; get count of all subarrays whose sum is 0
        pc_g0 = cc_g0
        # trivial
        sum_freq[cur_sum + n] += 1
        c += cc_g0 # update total count for all subarrays w/ sum>0
    return c


def starmaxxing2(S) -> int:
    n = len(S)
    cs = 0
    pc_e0 = 0
    pc_g0 = 0

    sf = [0] * (2 * n + 1)
    sf[n] += 1

    c = 0
    for i in range(0, n):
        if S[i] == 1:
            cs = cs + 1
            cc_g0 = 1 + pc_e0 + pc_g0
        else:
            cs = cs - 1
            cc_g0 = pc_g0 - sf[cs + n]
        
        pc_e0 = sf[cs + n]
        pc_g0 = cc_g0
        sf[cs + n] = sf[cs+n] + 1
        c += cc_g0
    return c

def starmaxxing3(S) -> int: # solution pulled
    MOD = 1000000007
    from collections import defaultdict
    cur_sum = 0
    prev_count_0 = prev_count_1 = 0
    sum_to_count = defaultdict(int)
    sum_to_count[0] = 1 # empty array has sum 0
    ans = 0
    for num in S:
        if num == 1:
            cur_sum += 1
        else:
            cur_sum -= 1            
        if num == 1:
            cur_count_1 = (prev_count_1 + prev_count_0 + 1) % MOD
        elif num == 0:
            cur_count_1 = (prev_count_1 - sum_to_count[cur_sum] + MOD) % MOD
        
        prev_count_0, prev_count_1 = sum_to_count[cur_sum], cur_count_1
        sum_to_count[cur_sum] = sum_to_count[cur_sum] + 1
        ans = (ans + cur_count_1) % MOD
    return ans

tests = [[0,1,1,0,1],[1,0,1,1,0,1],[1,1,1,0,1],[1,0,1,1],[1,1],[1,1,0,0,0,0,0,0,1,1,1,1,0,0,0]]
for t in tests:
    print(f'testing {t}')
    print(f'{starmaxxing(t)} {starmaxxing3(t)}')
