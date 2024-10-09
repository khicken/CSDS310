#import "@preview/lovelace:0.3.0": pseudocode-list
#set enum(numbering: "ai)")

#set align(right)
Kaleb Kim \
9/21/24

#set align(center)
= CSDS 310 Assignment 2 (rev)
#set align(left)

_Note: Arrays are zero-indexed._

== Problem 3
+ Using $T(n)$ in Master Theorem form, $T(n) = a T(n/b) + f(n)$. Here, $a = b$ and $b = a$, meaning that $a > b$. With this expression, we have $log_b a > 1$. Raising both sides to the $n$, we have $n^(log_b a) > n^1$. Since $f(n)=Theta(n)$, $f(n)=$
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

Runtime analysis: