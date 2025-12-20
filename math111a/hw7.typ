#import "@preview/ergo:0.2.0": *

#show: ergo-init.with(
    colors:     ergo-colors.dracula,
    styles:     ergo-styles.sidebar1,
    breakable:  true,
    inline-qed: true,
    prob-nums:  true,
)

#set page(margin: 0.5in) 
#let title = "math111a hw6"
#let author = "jc"
#let inverse = (-1)
#let iff = $arrow.double.l.r$
#let normal = $lt.eq.tri$
#let implies = $arrow.double$

math111a jc hw7

#prob[Consider the Diehedral group $D_(2 n)$ and let $k $ be a positive integer dividing $n$

1. prove that $chevron.l r^k chevron.r  $ is a normal subgroup of $ D_(2 n)$  

2. Prove that $D_(2 n) slash chevron r^k chevron.r =^tilde D_( 2k)$ 
  ][

let $k a = n$ for some $a in ZZ^plus$  

from previous knowledge, we know that $chevron r^k chevron.r$ is a subgroup of $D_(2 n)$  

1. note that $chevron r^k chevron.r = {r^k, r^(2 k), dots, r^(a k) = r^n = 1} = {r^(m k): m in 1,dots, a}$

Then $chevron r^k chevron.r normal D_(2 n) iff d r^(m k) d^inverse in chevron r^k chevron.r$ for any $d in D_(2 n)$

Let $d = e in D_(2 n)$ then clearly this is true 

Let $d = r^j$ for some $j in 1,dots,n-1$ then $r^j r^(m k) r^(-j) = r^(j+m k -j) = r^(m k) in chevron r^k chevron.r$ 

Let $d = s r^j$ for some $j in 1,dots, n-1$ then $ s r^j r^(m k) (s r^j)^inverse = s r^j r^(m k) r^(- j) s = s s r^(-j) r^(-m k) r^j = r^(-m k) = (r^(m k))^inverse in chevron r^k chevron.r $   

Let $d = s$ then $s r^(m k) s^inverse = s r^(m k) s = s s r^(-m k) = r^(- m k)in chevron r^k chevron.r$ $qed$

2. 

Write $D_(2 n) = chevron r,s bar r^n=s^2=1, s r = r^inverse s chevron.r$ 

Write $D_(2 k) = chevron r',s' bar r'^k=s'^2=1, s' r' = r'^inverse s' chevron.r$ 

By the definition of $D_(2 n)$, let $x = r^a s^b$ and $y = r^c s^d$ where $0 lt.eq a,c < n$ and $0 lt.eq b,d lt 2$     

Define the homomorphism $phi: D_(2 n) arrow D_(2 k)$ by $r^a s^b arrow.bar r'^(a mod k) s'^b$

Then $ phi(x y) = phi(r^a s^b r^c s^d) = phi(r^a r^(-c) s^b s^d) = phi(r^(a-c) s^(b+d)) = r'^(a - c mod k) s'^(b + d) = r'^(a mod k) r'^(-c mod k) s'^b s'^d = \ r'^(a mod k) s'^b r'^(c mod k) s'^d = phi(x) phi(y) $ 

so that $phi$ is a homomorphism, and note that surjectivity follows immediately ($k lt.eq n$) 

We can find the kernel of $phi$ by the following: $phi(r^a s^b) = 1 iff b = 0 and a equiv 0 mod k implies ker phi = chevron r^k chevron.r$

Applying the first isomorphism theorem, we obtain $D_(2 n) slash chevron r^k chevron.r =^tilde D_(2 k)$ 

$qed$ 

  ]
#prob(breakable:false)[Prove that if $G slash Z(G)$ is cyclic then $G $ is abelian. (If $G slash Z(G)$ with generator $x Z(G)$, show that every element of $G $ can be written in the form $x^a z$ for some $a in ZZ$ and some element $z in Z(G)$     ) ][

For some $x in G$ let the generator of $G slash Z(G)$ be $x Z(G)$ then we have that for $g in G$ that $g Z(G) = (x Z(G))^a$ for some $a$ and using the binary operation of $G slash Z(G)$ we have that $(x Z(G))^a = x^a Z(G)$

Since we have that $g Z(G) = x^a Z(G)$ then by a proposition in class $(x^a)^inverse g in Z(G)$, so let $x^(-a) g = z$ for some $z in Z$ then we have $g = x^a z$   

Since $z$ is from $Z(G)$ and commutes with all elements of $G$, let $g_1 = x^(a_1) z_1$ and $g_2 = x^(a_2) z_2$  then $ g_1 g_2 = x^(a_1) z_1 x^(a_2) z_2 = x^(a_2) z_2 x^(a_1) z_1 = g_2 g_1 $

where $g_1, g_2 in G$ and so $G$ is abelian

$qed$

references:

https://math.stackexchange.com/questions/63087/

]
#prob(breakable:false)[Show that if $abs(G) = p q$ for some primes $p,q$ (not necessarily distinct), then either $G $ is abelian or $Z(G) = {1}$   ][

by lagrange's theorem, the possible orders of $Z(G)$ are $1,p,q,p q$

Suppose that $|Z(G)|=1$ then $Z(G) = {1}$ (trivial group is a group)

Suppose that $|Z(G)|=p q$ then $Z(G) = G$ so that $G$ is abelian

Suppose that $|Z(G)| = p$ then $|G slash Z(G)| = p q slash p = q$ (from class) since $q$ is prime  $G slash Z(G)$ is cyclic (from previous homework). This makes $G$ abelian (from problem 2) i.e. that $Z(G) = G$ leading to contradiction $p = p q$ so we conclude $|Z(G)| eq.not p$

Similarly, $|Z(G)| eq.not q$

$qed$  


]
#prob(breakable:false)[

Let $G$ be a group, let $N $ be a normal subgroup of $G$, and let $overline(G) = G slash N$. Prove that $overline(x)$ and $overline(y )$  commute in $overline(G )$ if and only if $x^inverse y^inverse x y in N$  (The element $x^inverse y^inverse x y $ is called the commutator of $x $ and $y $ and is denoted by $[x,y]$ )   

][

Note that $x N y N = y N x N iff x y N = y x N iff (y x)^inverse x y in N iff x^inverse y^inverse x y in N$

By the binary operation in $G slash N$ and a proposition in class which stated that $a H = b H iff a^inverse b in H$ or equivalently that $b H = a H iff b^inverse a in H$   

$qed$

Conversely, we can say that if $ x^inverse y^inverse x y in N implies x^inverse y^inverse x y N = N implies x^inverse N y^inverse N x N y N = 1 N implies x N y N = y N x N $ 

]
#prob[


Let $G$ be a group, prove that $N = chevron x^inverse y^inverse x y : x,y in G chevron.r$ is a normal subgroup of $G $ and $G slash N$ is Abelian (Here $N $ is called the commutator subgroup of $G$)    

][

1. $N normal G iff g (x^inverse y^inverse x y) g^inverse in N$ for all $g in G$ and $x^inverse y^inverse x y in N$

Note that $g x^inverse y^inverse x y g^inverse = (g x^inverse g^inverse) (g y^inverse g^inverse) (g x g^inverse) (g y g^inverse)( g g^inverse)in N$

since each of these terms are in $G$ and that $(g x g^inverse)^inverse = g x^inverse g^inverse$ and $(g y g^inverse)^inverse = g y^inverse g^inverse$     

2. let $g_1, g_2 in G$ then $g_1^inverse g_2^inverse g_1 g_2 in N implies (g_2 g_1)^inverse (g_1)(g_2) in N implies g_1 g_2 N = g_2 g_1 N implies g_1 N g_2 N = g_2 N g_1 N$  (the second implication comes from the same proposition used in problem 4 from class)

$qed$ 

]

#prob(breakable:false)[Prove that every subgroupo of $Q_8 $ is normal][ 

$Q_8$ and ${1}$ will be normal (from class) \

${1,-1}$ is normal since $x (-1) x^inverse = -x x^inverse = (-1) x x^inverse = -1$ for any $x in Q_8$ 

There are also 3 subgroups of order 4 of the form ${1,-1,x,-x}$ where $x in {i,j,k}$  

Note that $i,j,k$ each have order 4, and that the conjugation $g x g^inverse$ by some $g in Q_8$ must also have order 4

Due to the presentation of $Q_8$, we necessarily have that $(plus.minus i) (plus.minus j) = plus.minus k \ (plus.minus j) (plus.minus k) = plus.minus i \ (plus.minus i) (plus.minus k) = plus.minus j$ (although $Q_8$ is non abelian, these properties hold no matter the order of multiplication)

Note that if $g = 1 or g = -1 or g = plus.minus x$ then $g x g^inverse$ will still be in the subgroup (where $x$ is from) due to the presentation of $Q_8$. So we need to look at the other cases of $g$:   

So if we consider the subsets ${plus.minus i}, {plus.minus j}, {plus.minus k}$ and that $g eq.not plus.minus x$, then $g$ will be from one of these subsets, $x$ another, so that $g x$ will be in the third subset, and $g x g^inverse$ will be in the set that $x$ is from since $g^inverse$ is in the same subset $g$ is from \

(i.e. $i,j,k$ are "cyclically permuted" under the operation of $Q_8$)

$qed$ 

The definition of $Q_8 = {plus.minus 1, plus.minus i, plus.minus j, plus.minus k}$ has relations $i^2=j^2=k^2=-1, i j = -j i = k, j k = -k j = i, k i = -i k = j, 1 x = x 1 = x, 1^2 = (-1)^2 = 1, (-1) x = x (-1) = -x$  

]

#prob(breakable:false)[Let $G $ be the group $ZZ_8 times ZZ_4$ and let $H=chevron(2,2)chevron.r$ . You are given that $G slash H   "is isomorphic to one of" ZZ_8, ZZ_4 times ZZ_2,"or" $ $ZZ_2 times ZZ_2 times ZZ_2$. Determine which one by elimination.  ][

Note that $H = {(0,0),(2,2),(4,0),(6,2)}$ 

There are $|G| slash |H| = 32 slash 4 = 8$ cosets 

Note that all non-identity elements of $ZZ_2 times ZZ_2 times ZZ_2$ have order 2, while $ZZ_8$ has an element of order 8 \

The equivalent cosets of $G slash H$ are all represnetatives plus a multiple of the generator $(2,2)$  

$G slash H$ has cosets with representatives 

$(1,0) "with order" 4$ 

$(1,1) "with order" 2$ 

$(1,2) "with order" 4$ 

$(1,3) "with order" 2$ 

$(0,0) "with order" 1$ 

$(0,1) "with order" 4$ 

$(0,2) "with order" 2$ 

$(0,3) "with order" 4$ 

Therefore $ZZ_2 times ZZ_2 times ZZ_2$ cannot be the answer since it has no elements of order 4,

and since $ZZ_8$ has en element ($1 in ZZ_8$) which has order 8, then it cannot also be the answer \

The only answer left is $ZZ_4 times ZZ_2$ and based on the problem statement we can conclude that $G slash H =^tilde ZZ_4 times ZZ_2$  

]

#prob(breakable:false)[Let $G $ be a finite group and let $H $ be a normal subgroup of $G$. Prove that the order of the element $g H $ must divide the order of $g in G$  ][


Note that $(g H)^(abs(g)) = g^(abs(g)) H = 1 H = H$

Although we do not know the order of $g H$, by the divison algorithm we can write $abs(g) = abs(g H) q + r$ for some $q,r in ZZ$ where $0 lt.eq r < |g H|$

Then $(g H)^(abs(g)) = (g H)^(abs(g H) q + r) = (g H)^(abs(g H) q) (g H)^r = (g H)^r$ 

This means that $H = (g H)^r$ but the above, $r < abs(g H)$ so we must have $r = 0$

Then $abs(g) = abs(g H) q implies |g H| divides |g|$ 

$qed$ 

https://math.stackexchange.com/questions/1897118/



]
#prob(breakable:false)[Let $C $ be a normal subgroup of the group $A$ and $D$ be a normal subgroup of the group $B$. Prove that $C times D normal A times B "and" (A times B) slash (C times D) =^tilde (A slash C) times (B slash D)$    ][

1. take $(a,b) in A times B, (c,d) in C times D$ then $(a,b)(c,d)(a,b)^inverse = (a,b)(c,d)(a^inverse, b^inverse) = (a c a^inverse) (b d b^inverse) in C times D$ since $C normal A implies a c a^inverse in C$ and $D normal B implies b d b^inverse in D$

2. Define the homomorphism $phi: A times B arrow (A slash C) times (B slash D)$ by $phi((a,b)) = (a C, b D)$ 

($phi$ is clearly surjective since any $(a C, b D) in A slash C = phi(a,b), a in A, b in B$  )

$phi$ is a homormorphism since $phi((a,b)(c,d)) = phi((a c, b d)) = (a c C, b d D) = (a C, b D)(c C, d D) = phi((a,b)) phi((c,d))$ for some $(a,b) in A times B$ and $(c,d) in A times B$

the kernel of $phi $ is the $(a,b) in A times B$ such that $phi((a,b)) = (a C, b D) = (1 C, 1 D) = (C, D)$. \ Recall that $a C = C iff a in C, b D = D iff b in D$ from class, then the kenerl of $phi$ is exactly  $C times D$ 

By the first isomorphism theorem, we can conclude that $(A times B) slash ker phi =^tilde "Im" phi$ i.e. $(A times B) slash (C times D) =^tilde (A slash C) times (B slash D) = "Im" phi$ (whhere the last equality holds due to the surjectivity of $phi$) $qed$ 

]