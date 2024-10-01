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
+ $f(n) = o(g(n))$, because:
  - $op("lim", limits: #true)_(n->infinity) n$
+ $f(n) = o(g(n))$, because:
+ $f(n) = O(g(n))$, because:

== Problem 2
+ 

== Problem 4
My strategy is to 
#pseudocode-list[
+ *procedure* MERGE(A, B, x):
  + i ← 0
  + j ← n - 1
  + *while* i < n and j >= 0:
    + *if* A[i] + B[j] == x *then*
      + return i, j
    + *else if* A[i] + B[j] < x *then*
      + i ← i + 1
    + *else*:
      + j ← j - 1
  + *return* FALSE
]