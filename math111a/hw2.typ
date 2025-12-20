#import "@preview/ergo:0.1.1": *

#import "@local/superTemplate:0.3.0": *
#import math_mod:*
#import pstat_mod:*
#import cs_mod: *

#show: ergo-init.with(colors: "gruvbox-dark", headers: "classic")
#let title = "math111a hw2"
#let author = "jc"
#let date = datetime.today()
#show: assignment.with(title, author, date)

#problem[

Let $a $ and $b $ be commuting elements of a group $G $ Prove that $(a b)^n = a^n b^n forall n in ZZ$ 

][

We can recall the multiplicative $(a b)^n$ notation from class where $n in ZZ$    

Case 1: $n > 0$ \

Consider that for $n=1$ we have that $(a b)^1 = a b$ and that $a^1 b^1 = a b$ 

Assume that $(a b)^n = a^n b^n$ holds for some $n > 0$ then we would like to show that $(a b)^(n+1) = a^(n+1) b^(n+1)$ \

Note that this is equivalent to showing that $(a b)^n a b = a^n a b^n b$ and by assumption, $(a b)^n a b = a^n b^n a b$ \

Since $a$ and $b$ commute, we have that $a b^n = b^n a$ and the claim holds by induction

Case 2: $n = 0$ then we have $(a b)^0 = 1$ and $a^0 b^0 = (1)(1) = 1$ by identity property for groups 

Case 3: $n < 0$ 

First recall that $(a b)^(-1) = b^(-1) a^(-1)$ and that $a^(n) a^(-1) = underbrace(a dot dots dot a, "n times") a^(-1) = underbrace(a dot dots a, "n-1 times") dot e = a^(n-1)$ \

Next note that $a b = b a arrow.double (a b)^(-1) = (b a)^(-1) arrow.double b^(-1) a^(-1) = a^(-1) b^(-1)$  (i)

Therefore for  $n = -1$ we have $(a b)^(-1) = b^(-1) a^(-1) = a^(-1) b^(-1)$ 

Assume that $(a b)^n = a^n b^n$ holds for some $n < 0$ then we would like to show that $(a b)^(n-1) = a^(n-1) b^(n-1)$   

Note that $(a b)^(n-1) = (a b)^n (a b)^(-1) = a^n b^n (a b)^(-1) = a^n b^n b^(-1) a^(-1) = a^n b^n a^(-1) b^(-1)$

and that $a^(n-1) b^(n-1) = a^n a^(-1) b^n b^(-1)$

To show that $b^n a^(-1) = a^(-1) b^n$ consider that $a b = b a arrow.double a b a^(-1) = b arrow.double b a^(-1) = a^(-1) b$

Combining these facts, the claim holds by induction

$qed$ 

(i) Since the inverse if unique, we can be sure that if $a = b$ then $a^(-1) = b^(-1)$  

]
#pagebreak()
#problem[

Let $G$ be a group. Prove that if $a^2 = 1$ for all $x in G$, then $G$ is Abelian    

Corrected version: Let $G$ be a group. Prove that if $x^2 = 1$ for all $x in G$, then $G$ is Abelian    

][

Let $a,b in G$ \

Note that $a^2 = a a = 1 arrow.double a = a^(-1)$ (every element is its own inverse) \

Then we have: $ a b = a^(-1) b^(-1) = (b a)^(-1) = b a $

where the second equality was proven in class. $qed$ 

]
#pagebreak()
#problem[

Prove that in any group, an element and its inverse have the same order

][

Let $|a|$ denote the order of $a$ and note that $(a^(-1))^n = (a^n)^(-1)$ and note that the inverse of identity is itself    

Let $a in G$ with order $n$ then $a^n = 1 arrow.double (a^n)^(-1) = (1)^(-1) arrow.double (a^(-1))^n = 1 arrow.double |a^(-1)| lt.eq |a|$

Similarly if $n$ is now the inverse of $a^(-1)$ then $(a^(-1))^n = 1 arrow.double (a^(-1)^n)^(-1) = (1)^(-1) arrow.double a^n = 1 arrow.double |a| lt.eq |a^(-1)|$

This means that if $a $ has finite order, then $|a| = |a^(-1)|$  

If $a $ has infinite order then $exists.not k in ZZ, k > 0$ such that $a^k = 1$  then from the above we know that some $k > 0$ does not exist for $(a^(-1))^k = 1$ either.

Another way to say this is that if $a$ has infinite order and assume that $a^(-1)$ has finite order. In the finite case we showed that if $a^(-1)$ has finite order then $a$ has the same (finite) order, which is a contradiction and therefore $a^(-1)$ must also have infinite order.   

$qed$ 

references: https://proofwiki.org/wiki/Powers_of_Group_Elements/Negative_Index

]
#pagebreak()
#problem[

In class we studied that $D_(2 n) = angle.l r,s | r^n =1, s^2 =1, s r = r^(-1) s angle.r$. Prove that for all $k in ZZ, s r^k = r^(-k) s$ 

][

Case 1: $k=0$ then $s r^0 = r^(-0) s arrow.double s = s$ 

Case 2: $k gt.eq 1$

For $k=1$ we have that $s r = r^(-1) s$ which holds by the presentation of $D_(2 n)$

Assuming that $s r^k = r^(-k) s$ holds for some $k gt.eq 1$ then $ s r^(k+1) = r^(-(k+1)) s \ s r^k r = r^(-k) r^(-1) s \ r^(-k) s r = r^(-k) r^(-1) s &wide "by assumption" \ s r = r^(-1) s &wide "by definition" $    

Case 3: $k lt.eq -1$

For $k=-1$ we have $s r^(-1) = r s$ which holds since $s r = r^(-1) s arrow.double r s r = s arrow.double r s = s r^(-1)$

Assuming that $s r^k = r^(-k) s$ holds for some $k lt.eq 1$ then $ 
                                                          s r^(k-1) = r^(-(k-1)) = r^(-k+1) s \ s r^k r^(-1) = r^(-k) r s  \ r^(-k) s r^(-1) = r^(-k) r s &wide "by assumption" \ s r^(-1) = r s &wide "as proved earlier"         
$

Then through induction on all possible $k$ the claim follows

$qed$ 
]
#pagebreak()
#problem[

In the group $D_(2 n )$ explain why

1. a reflection followed by another reflection must be a rotation

2. a reflection and a rotation taken together in either order must be a reflection

][

Note that a reflection in the group $D_(2 n)$ is of the form $s r^a $ where $a in {0,dots,n-1}$ and a rotation is of the form $r^b$ where $b in {0,dots,n-1}$

Let $k_1, k_2 in {0,dots,n-1}$ then:

1. $s r^(k_1) s r^(k_2) = r^(-k_1) s s r^(k_2) = r^(k_2-k_1) in D_(2 n)$ and 

2. $r^(k_1) s r^(k_2) = r^(k_1) r^(-k_2) s = r^(k_1 - k_2) s = s r^(k_2 - k_1) in D_(2 n)$ and 

$s r^(k_2) r^(k_1) = s r^(k_2+k_1) in D_(2 n)$ 

We can justify the three inclusions since we can reduce the powers of $r$ $mod n$  

$qed$

https://math.stackexchange.com/questions/4837202/arithmetic-on-elements-of-d-2n#:~:text=You%20have%20the%20right%20idea,Add%20a%20comment

]
#pagebreak()
#problem[
Write out Cayley tables for the groups $S_3$ and $D_8$  

][

$S_3:$ 

#table(
  columns: 7,
  align: center,
  
    [ *∘* ],        [ *()* ],     [ *(1 2)* ],   [ *(1 3)* ],   [ *(2 3)* ],   [ *(1 2 3)* ], [ *(1 3 2)* ],
    [ *()* ],       [ () ],     [ (1 2) ],   [ (1 3) ],   [ (2 3) ],   [ (1 2 3) ], [ (1 3 2) ],
    [ *(1 2)* ],    [ (1 2) ],  [ () ],      [ (1 2 3) ], [ (1 3 2) ], [ (1 3) ],   [ (2 3) ],
    [ *(1 3)* ],    [ (1 3) ],  [ (1 3 2) ], [ () ],      [ (1 2 3) ], [ (2 3) ],   [ (1 2) ],
    [ *(2 3)* ],    [ (2 3) ],  [ (1 2 3) ], [ (1 3 2) ], [ () ],      [ (1 2) ],   [ (1 3) ],
    [ *(1 2 3)* ],  [ (1 2 3) ],[ (2 3) ],   [ (1 2) ],   [ (1 3) ],   [ (1 3 2) ], [ () ],
    [ *(1 3 2)* ],  [ (1 3 2) ],[ (1 3) ],   [ (2 3) ],   [ (1 2) ],   [ () ],      [ (1 2 3) ],
  
)

$cyc(1, 2)$

$D_8:$ 

handwritten

  
]
#pagebreak()
#problem[
Prove that for all $n gt.eq 3$, the group $S_n $ is not Abelian 

][

Let $sigma, tau in S_3$ and let $sigma=(1 2), tau = (2 3)$

Computing their compositions we obtain $sigma tau = (1 2 3)$ and $tau sigma = (1 3 2)$  so that $S_3$ is not abelian 

Next consider the groups $S_n$ where $n gt.eq 4$ \

We can construct $sigma^tilde, tau^tilde in S_(n gt.eq 4)$ such that they act exactly like $sigma, tau$ on the elements ${1,2,3}$ and add additional mappings such that $sigma^tilde (i)=i, tau^tilde (i)=i$ for $i in {4,dots,n_(gt.eq 4)}$    

Therefore $sigma^tilde tau^tilde$ and $tau^tilde sigma^tilde$ will act the same as in $S_3$  on elements ${1,2,3}$ and not commute under $circle.small$  either.

$qed$ 

]
#pagebreak()
#problem[

Let $sigma $ be the permutation $ 1 arrow.r.bar 3 \ 2 arrow.r.bar 4 \ 3 arrow.bar.r 5 \ 4 arrow.bar 2 \ 5 arrow.bar 1 $

and let $tau $ be the permutation $ 1 arrow.bar 5 \ 2 arrow.bar 3 \ 3 arrow.bar 2 \ 4 arrow.bar 4 \ 5 arrow.bar 1 $

Find the cycle decompositions of each of the following permutations: $sigma, tau, sigma^2, sigma tau, tau sigma, tau^2 sigma$ 

][

$sigma$: $(1 3 5) (2 4)$

$tau$: $(1 5) (2 3) (4)$  

$sigma^2: (1 5 3) (2) (4)$

$tau sigma: (1 2 4 3) (5)$

$sigma tau: (1) (2 5 3 4)$ 

$tau^2 sigma: (1 3 5 ) (2 4) = sigma$ 

]