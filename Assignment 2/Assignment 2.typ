#import "@preview/lovelace:0.3.0": pseudocode-list
#set enum(numbering: "ai)")

#set align(right)
Kaleb Kim \
9/21/24

#set align(center)
= CSDS 310 Assignment 2
#set align(left)

_Note: Arrays are zero-indexed._

== Problem 1
+ $log^k n = o(n^epsilon)$, proven by the Limit Asymptotic Theorem:
    $
    lim_(n->oo) f(n)/g(n) &= lim_(n->oo) (log^k n)/(n^epsilon)
    = lim_(n->oo) ((log n)/(n^(epsilon slash k)))^k #text()[, applying L'Hopital's:] \
    &eq.star lim_(n->oo) ((1 slash n)/(epsilon n^(epsilon slash k - 1)))^k \
    &= ((0)/(epsilon (oo)^(epsilon slash k - 1)))^k \
    &= 0
    $
    This means that $g(n)$ is the asymptotic upper bound of $f(n)$. As this result does not depend on constants $k, epsilon$, this is a strict bound$-$which is also part of the Limit Asymptotic Theorem. \ \
+ $n^k = o(c^n)$, proven by the Limit Asymptotic Theorem again:
    $
    lim_(n->oo) f(n)/g(n) &= lim_(n->oo) (n^k)/(c^n) \
    &eq.star lim_(n->oo) (k n^(k-1))/(c^n) \
    &eq.star lim_(n->oo) (k(k-1) n^(k-2))/(c^n)
    $
    As the denominator remains fixed, this pattern will continue until:
    $
    lim_(n->oo) (k(k-1)(...)(2)(1) n^(1))/(c^n) &eq.star lim_(n->oo) (k(k-1)(...)(2))/(c^n) \
    &= 0
    $
    By the same reason as part a), this result proves that $g(n)$ is the asymptotic strict upper bound of $f(n)$. \ \
+ There is no asymptotic relation between the two. If we were to prove this through the closest definition of Big-O notation, stating there exists some constant $a > 0$ that satisfies the following:
    $
    0 <= f(n) <= a g(n) \ 0 <= (sqrt(n)) <= a (n^sin(n)) \ 0 <= n^(1/2) <= a n^sin(n) \ 0 <= ln(n^(1/2)) <= ln(a n^sin(n)) \
    0 <= 1/2 <= a sin(n)
    $
    Regardless of what we choose for $a$, $sin(n)$ can be $0$ for sufficiently large inputs for $n$, making the inequality false. If we were to try other notation definitions, there will still be no bound. \ \

== Problem 2
+ True. By the definition of Big O, with $a in bb(R)$ such that $a > 0$:
  $
  0 <= f(n) <= a g(n) \
  0 <= f(n) + c <= a f(n) \
  0 <= 1 <= (a f(n))/(f(n) + c)
  $
  Using a limit to evaluate a sufficiently large $n$:
  $
  lim_(n->oo) (a f(n))/(f(n)+c)
  &eq.star lim_(n->oo) (a f'(n))/(f'(n)) \
  &= lim_(n->oo) a \ &= a
  $
  Since there exists $a$ such that $a >= 1$ to make the inequality will hold true, this proves the original statement.
+ False. For $f(n) = 2^n$, by the definition of Theta Notation
  $0 <= c_1 g(n) <= f(n) <= c_2 g(n)$, with $c_1, c_2$ are positive and $n$ is sufficiently large. We have $g(n) = f(2n) = 2^((2n)) = (2^n)^2$. Substituting:
  $
  0 <= c_1 (2^n)^2 &<= 2^n <= c_2 (2^n)^2 \
  0 <= c_1 2^n &<= 1 <= c_2 2^n
  $
  No value of $c_1, c_2$ can fix this inequality the way I can fix her for any sufficiently large $n$. Thus, the statement is false.
+ True. Let $g(n)=f(2n)=(2n)^c=2^c n^c$. By the definition of Big O, with $a in bb(R)$ such that $a > 0$:
  $
  0 <= f(n) <= a g(n) \
  0 <= n^c <= a (2^c n^c) \
  0 <= 1 <= a dot 2^c
  $
  Suppose $a=1$ and given that $c>0$, for any sufficiently large value of $n$ the inequality holds true. Thus, there exists a constant which holds the statement true.

== Problem 3
+ Converting $T(n)$ to Master Theorem form, $T(n) = a T(n/b) + Theta(n^d)$. This falls under Case 2, thus $T(n)=Theta(n log n)$
+ yeah
== Problem 4
Pseudocode:
#pseudocode-list[
+ *procedure* MERGE(A, n):
  + *if* $n_A$ == 1:
    + *return* A
  + A' ← Array of $ceil(n/2)$ elements
  + *for* $0 <= i < floor(n slash 2)$:
    + A'[i] ← SUBMERGE(A[2i], A[2i+1])
  + *if* $n$ is odd:
    + A'[$n slash 2$] ← A[$n-1$] \/\/ Put last element in A'
  + *return* MERGE(A')
]
The merging of two subarrays, cleverly named:
#pseudocode-list[
+ *procedure* SUBMERGE(A, B):
  + i ← 0
  + j ← 0
  + C ← Array of $n_A + n_B$ elements
  + *while* i + j < len(A) + len(B):
    + *if* i == len(A):
      + C[i+j] ← B[j]
      + j ← j + 1
    + *else if* j == len(B) or A[i] < B[j]:
      + C[i+j] ← A[i]
      + i ← i + 1
    + *else*:
      + C[i+j] ← B[j]
      + j ← j + 1
  + *endwhile*
  + *return* C
]

Proof:
We'll break up this proof in two: One for `SUBMERGE` and one for `MEGE`

Runtime analysis:
We can apply the Master Theorem since we have a recursive case in which the merging is linear, 