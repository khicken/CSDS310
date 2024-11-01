#import "@preview/lovelace:0.3.0": pseudocode-list
#set enum(numbering: "ai)")

#set align(right)
Kaleb Kim \
10/11/24

#set align(center)
= CSDS 310 SI Midterm Session
#set align(left)

_Note: Arrays are zero-indexed._

== Problem 6
_Pseudocode:_
#pseudocode-list[
+ *procedure* MATCH(nuts, bolts, low, high):
  + *if* low < high *then*
    + pivotBoltIndex $<-$ PARTITION(bolts, low, high)
    + SWAP(pivotBoltIndex, high)
    + PARTITION(nuts, low, high)
    + MATCH(nuts, bolts, low, pivotBoltIndex - 1)
    + MATCH(nuts, bolts, pivotBoltIndex + 1, high)
  + *endif*
]

_Runtime:_ \
The runtime of this algorithm can be analyzed using the Master Theorem. The `PARTITION` method takes $O(n)$ time, and the problem is divided in half for the two subproblems. This means
$
T(n) = 2T(n/2) + O(n)
$
and $n^(log_2 2) = n$, which falls into case 2 of the Master Theorem. Thus, the runtime is $O(n log n)$.
\ \
_Proof by induction:_ \
*Base case:* When the size of the nuts and bolts subsets is 1, the single nut will match the single bolt. \
*Inductive step*: Assume the algorithm correctly matches all nuts and bolts for any set of size $k$. When the size is $k+1$ the algortihm chooses a pivot nut, partitions the bolts (which works as partition is defined in the textbook), finds the matching bolt, and then usees it to partition the nuts. The pivot nut and bolt are correctly matched. By the inductive hypothesis, since the subsets of nuts and bolts less than and greater than the pivot are of size less than or equal to $k$, they will also be correctly matched.

== Problem 5
#pseudocode-list[
+ *procedure* MISSING(D, C, low, high):
  + 
]