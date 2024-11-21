#import "@preview/lovelace:0.3.0": pseudocode-list
#set enum(numbering: "ai)")

#set align(right)
Kaleb Kim \
11/20/24

#set align(center)
= CSDS 310 Assignment 4
#set align(left)

_Note: Arrays are zero-indexed._

== Problem 1
+ Counterexample: Consider activities $a_1 = [1, 10], a_2 = [11, 12]$, and $a_3 = [13, 14]$ Selecting $a_1 $because it starts earliest excludes $a_2 $and $a_3$, which would form the optimal solution ($a_2 $and $a_3 $) with a larger subset size.
   - **Explanation**: Earliest start time does not guarantee room for other compatible activities, leading to suboptimal solutions.

2. **Shortest Duration**:
   - **Counterexample**: Consider $a_1 = [1, 3], a_2 = [3, 5], a_3 = [2, 6]$ Selecting $a_1 $(shortest duration) excludes $a_2$, and $a_3$ The optimal solution is $\{a_1, a_2\}$
   - **Explanation**: Activities with shorter durations may block larger mutually compatible subsets.

3. **Fewest Overlaps**:
   - **Counterexample**: Consider $a_1 = [1, 4], a_2 = [3, 5], a_3 = [4, 6]$ Selecting $a_3 $(fewest overlaps) excludes $a_1 $and $a_2$, while the optimal solution is $\{a_1, a_3\}$
   - **Explanation**: Minimizing overlaps at each step doesn't account for future compatibility.

---
== Problem 2
=== Algorithm
- Sort $A $and $B $in descending order.
- Pair the largest $a_i $with the largest $b_i$, and so on.

=== Explanation
- Pairing larger values amplifies the exponentiation result.
- Example: $A = [3, 1], B = [2, 4]$ Reordering $A = [3, 1], B = [4, 2] $maximizes the result: $3^4 \cdot 1^2 = 81 $versus other arrangements.

== Problem 3
// Schedule $n $activities, each requiring $t_i $time and with a deadline $d_i$, to minimize the maximum delay $\max(\Delta_i)$

=== Algorithm
   - Sort activities by their deadlines $d_i $in ascending order.
   - Start scheduling from $t=0$, assigning $s_i = max(t, 0) $and updating $t = s_i + t_i$

=== Example
   - Input: $t = [10, 5, 6, 2], d = [11, 6, 12, 20]$
   - Sorted by deadlines: $\{(5, 6), (10, 11), (6, 12), (2, 20)\}$
   - Scheduled order: $[2, 1, 3, 4]$
   - Starting/Finishing times: $[0/5, 5/15, 15/21, 21/23]$
   - Maximum delay: $Delta = max(-1, 4, 9, -3) = 9$

=== Explanation
   - Sorting by deadlines minimizes delays, ensuring earlier deadlines are prioritized.

== Problem 4
+ Counterexample: $c = [1, 3, 4], n = 6$ 
  - Greedy choice: $4, 1, 1 $($3 $coins).
  - Optimal: $3, 3 $($2 $coins).
- Explanation: Arbitrary denominations can create non-optimal substructure, making greedy choices fail.
+ Proof:
  - Coins: $c = [1, 2, 4, ...]$
  - Greedy choice always selects the largest coin less than or equal to $n$
  - Each step solves a subproblem optimally, ensuring an overall optimal solution (proof by induction).


#pseudocode-list[
+ *procedure* EDIT_DISTANCE(s1, s2):
  + m $<-$length of s1
  + n $<-$length of s2
  + dp $<-$0 array of length $(m+1)(n+1)$

  + *for* $0 <= i <= m$:
    + dp[i][0] $<-$i
  + *for* $0 <= j <= n$:
    + dp[0][j] $<-$j
    
  + *for* $1 <= i <= m$:
    + *for* $1 <= j <= n$:
      + *if* s1[i-1] = s2[j-1]:
        + dp[i][j] $<-$dp[i-1][j-1]
      + *else*:
        + dp[i][j] $<-$1 + min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1])
  
  + *return* dp[m][n]
]