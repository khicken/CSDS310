#import "@preview/lovelace:0.3.0": pseudocode-list
#set enum(numbering: "ai)")

#set align(right)
Kaleb Kim \
12/2/24

#set align(center)
= CSDS 310 Assignment 5
#set align(left)

_Note: Arrays are zero-indexed._

== Problem 1
=== Pseudocode
#pseudocode-list[
+ *procedure* MAX_PROFIT(A, B, n):
  + r-quicksort A
  + r-quicksort B
  + profit $<-$ 1
  + *for* $0 <= i < n$:
    + profit $<-$ profit $times$ $A[i]^B[i]$
  + *return* profit
]

=== Proof


=== Runtime
Randomized quick sort takes $O(n log n)$ time in the worst case. It also sorts in place, using $O(1)$ extra space. The for loop runs for $Theta(n)$ time. Thus, we have:
$
&"Time complexity: " O(n log n) \
&"Space complexity: " O(1)
$


== Problem 2
+

== Problem 3

== Problem 4
#image("image.png")