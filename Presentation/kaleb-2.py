import copy
from bisect import bisect as upper_bound

# My original O(N) solution
def starmaxxing(S) -> int:
    n = len(S)
   
    cur_sum = 0    # cs, current (weighted) sum
    pc_e0 = 0      # number of subarrays w/ sums = 0, for prev (p) iteration
    pc_g0 = 0      # number of subarrays w/ sums > 0, for prev (p) iteration
    c = 0          # total subarrays w/ sums > 0
    
    sum_freq = [0] * (2*n + 1)    # sf, frequency array of weighted sums (-n <= weighted sum <= n)
    sum_freq[n] += 1              # we have a sum of 0 already

    for s in S:
        # if s is a star
        if s:
            cur_sum += 1
            # number of subarrays w/ sums > 0, for current iteration
            cc_g0 =       1  + pc_e0                             + pc_g0
            #            [1] + subarrays w/ sum=0 now have sum=1 + all subarrays w/ sum>0 are still sum>0
        
        # if s isn't a star
        else:
            cur_sum -= 1
            # number of subarrays w/ sums > 0, for current iteration
            cc_g0 =      pc_g0                              - sum_freq[cur_sum + n]
            #            keep subarrays w/ sum>0 -> sum>=0  - # of subarrays w/ sum now drops to 0

        # update variables for next iteration
        pc_e0 = sum_freq[cur_sum + n]   # CRITICAL SECTION:
                                           # of weighted sums encountered so far = # of subarrays that will drop to 0 at the given weighted sum
        pc_g0 = cc_g0                   # trivial
        sum_freq[cur_sum + n] += 1      # update # of sums encountered, tells us 

        # add the number of subarrays w/ sum>0 at this iteration, for subarray A[0...i]
        c += cc_g0
    return c

# My "brute force" O(N^2) solution
def starmaxxing_checker(S) -> int:
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

tests = [
    [0,1,1,0,1],
    [1,0,1,0,1],
    [1,0,1,1,0,1],
    [1,1,1,0,1],
    [1,0,1,1],
    [1,1],
    [0,1],
    [1,0],
    [1,1,0],
    [0,1,1],
    [],
    [0],
    [1],
    [1,1,0,0,0,0,0,0,1,1,1,1,0,0,0],
]
passed = 0
for t in tests:
    print(f'{t}\n  O(N):    {starmaxxing(t)}\n  O(N^2):  {starmaxxing_checker(t)}\n')
    passed += int(starmaxxing(t) == starmaxxing_checker(t))
print(f'Tests passed: {passed}/{len(tests)}')