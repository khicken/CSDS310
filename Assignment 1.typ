#import "@preview/lovelace:0.3.0": pseudocode-list

#set align(right)
Kaleb Kim

#set align(center)
= CSDS 310 Assignment 1
#set align(left)
== Problem 1
a) *Loop Invariant*: At the start of each iteration, the greatest common divisor (GCD) of $x$ and $y$ is the same as the GCD of the original input integers $a$ and $b$. In other words, $gcd(x, y) = gcd(a, b)$

b)
- *Initialization:* Before the first iteration, $x = a$ and $y = b$. Since these values are the same, $gcd(x, y) = gcd(a, b)$.
- *Maintenance*: Assume that at the start of the first iteration, the statement $gcd(x, y) = gcd(a, b)$ holds. In the loop, there are two cases:

  Case 1: $x > y$. In this case, $x = x - y$. Subtracting the smaller number, $y$, does not change the GCD. For proof, let $c = gcd(x - y, y)$, in which $c in bb(Z)$ and $x > y$. By definition, $c (x-y) = c y$. Distributing, $c x - c y = c y$. Solving, $c x = 2c y = c (2y)$. As both sides of the equation remain integers, $c = gcd(x, 2y) = gcd(x - y, y) = gcd(x, y)$.

  Case 2: $x ≤ y$. In this case, $y = y - x$. This uses the same proof as Case 1, in which $gcd(x, y) = gcd(x, y - x)$.

- *Termination*: The loop terminates when $x = y$. By the loop invariant, $gcd(a, b) = gcd(x, y)$.

c) Inputs $a$ and $b$ are positive integers and $x = a$ and $y = b$, so $x$ and $y$ must be positive. In the loop, $x$ and $y$ decrease by the smaller counterpart. Given that $x$ and $y$ are positive, in both cases of subtraction, it is not possible for one number to subtract the other and be negative. The integers may not decrease below 1 either, since that case implies that the integers are equal, which is the termination condition.

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
- *Termination*: The loop terminates when $i >= n$ or $j < 0$ or if a valid pair in which $A[i] + B[j] = x$ exists. If the loop terminates by the condition $i >= n$ or $j < 0$, then no valid pair is found.

== Problem 3
a) 