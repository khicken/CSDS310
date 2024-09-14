#import "@preview/lovelace:0.3.0": pseudocode-list

#set align(right)
Kaleb Kim

#set align(center)
= CSDS 310 Assignment 1
#set align(left)
== Problem 1
a) *Loop Invariant*: At the start of each iteration, the greatest common divisor (GCD) of $x$ and $y$ is the same as the GCD of the original input integers $a$ and $b$.

b)
- *Initialization:* Before the first iteration, $x = a$ and $y = b$. As these values are the same, $gcd(x, y) = gcd(a, b)$.
- *Maintenance*: Assume that at the start of the first iteration, the statement $gcd(x, y) = gcd(a, b)$ holds. In the loop, there are two cases:

  Case 1: $x > y$. Here, $x = x - y$. Subtracting the smaller number, $y$, does not change the GCD by a property of the GCD. In other words, $gcd(x, y) = gcd(x - y, y)$.

  Case 2: $x ≤ y$. Here, $y = y - x$. This uses the same property as Case 1, in which $gcd(x, y) = gcd(x, y - x)$.

- *Termination*: The loop terminates when $x = y$. Since the loop invariant has held throughout all iterations of the loop, at the point of termination, we know that: GCD(x, y) = GCD(a, 

c) As inputs $a$ and $b$ are positive integers, $x$ and $y$ must be positive since $x = a$ and $y = b$. In the loop, $x$ and $y$ decrease by the smaller counterpart. Given that $x$ and $y$ are positive, in both cases of subtraction, it is not possible for one number to subtract the other and be negative. The integers may not decrease below 1 either, since that case implies that the integers are equal, which is the termination condition.

d) Our loop invariant terminates when $x = y$, thus $x = x$. At this point in the algorithm, we have $gcd(x, y) = gcd(x, x)$. $x = x$, thus $x | x$, so we can conclude that $x = gcd(x, x) = gcd(x, y) = gcd(a, b)$.

== Problem 2
a) #pseudocode-list[
+ *procedure* FINDPAIR(A, B, x):
  + i ← 0
  + j ← n - 1
  + *while* i < n and j >= 0:
    + *if* A[i] + B[j] == x *then*
      + return i, j
    + *else if* A[i] + B[j] < x *then*
      + i ← i + 1
    + *else*:
      + j ← j - 1
  + return FALSE
]

b) - *Loop Invariant:* If there exists a pair of indices $i'$ and $j'$ such that $A[i'] + B[j'] = x$, then the pair must be found at $i, j$ or in the subarrays $A[i+1 ... n-1]$ and $B[0 ... j-1]$. If there does not exist such a pair, the procedure returns FALSE.
- *Initialization:* Before the loop, $i = 0$ and j$ = n - 1$,  we need to check if $A[i] + B[j] = A[0] + B[n - 1] = x$ is true. If $A[0] + B[n - 1] = x$, the algorithm immediately returns the correct answer. Else, we haven't traversed the subarrays $A[0 ... i+1]$ and $[0 ... j-1]$. Thus, the loop invariant holds.
- *Maintenance*: At each step, we either increment $i$ or decrement $j$ based on the value of $A[i] + B[j]$. We have two other cases in this loop. If $A[i] + B[j] < x$, we need a larger value that we will pull from $A$, so we increment $i$. In the other case, if $A[i] + B[j] > x$, we need a smalelr value that we will pull from $B$, so we decrement $j$.
- *Termination*: The loop terminates when i >= n or j < 0, meaning all pairs have been checked without finding a valid pair (return FALSE) or if a valid pair in which $A[i] + B[j] = x$ exists.

== Problem 3
a) 