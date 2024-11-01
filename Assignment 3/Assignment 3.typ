#import "@preview/lovelace:0.3.0": pseudocode-list
#set enum(numbering: "ai)")

#set align(right)
Kaleb Kim \
10/29/24

#set align(center)
= CSDS 310 Assignment 3
#set align(left)

_Note: Arrays are zero-indexed._

== Problem 1
=== Optimal substructure:
The 
$
f[t] = cases(
  0 &"if" t = 0 ,
  "min"() &"if" t > 0
)
$

=== Pseudocode:
#pseudocode-list[
+ *procedure* COIN_CHANGE(coins, t):
  + r $<-$ $oo$ array of $t+1$ elements
  + r[0] $<-$ 0
  + *for* $1 <= i < t+1$:
    + *for* c in coins:
      + *if* $i-c >= 0$:
        + r[i] $<-$ min($r[i]$, $r[i-c] + 1$)
  + *return* dp[t]
]

=== Proof:
Suppose $S'$ for the sake of contradiction