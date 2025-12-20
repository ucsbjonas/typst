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

math111a jc hw8

#prob(breakable:false)[Let $M$ and $N $ be normal subgroups of a group $G$. prove that $M N $ is a normal subgroup of $G$   ][

First we should show that $M N lt.eq G$

Note that $M N eq.not emptyset because 1  dot 1  = 1 in M N$ 

Additionally for $m_1, m_2 in M$ and $n_1, n_2 in N$  we can show that closure and inverses hold: \

Closure: $(m_1 n_1)(m_2 n_2) = m_1 n_1 m_2 n_2 = m_1 (n_1 m_2 n_1^inverse) n_1 n_2$ and $n_1 m_2 n_1^inverse in M because M normal G implies "closure holds"$

Inverse: note that for any $m n in M N$ the inverse (both left and right) is $(m n)^inverse = n^inverse m^inverse$, and this inverse is in $M N$ since $n^inverse m^inverse = (n^inverse m^inverse n) n^inverse "and" n^inverse m^inverse n in M because M normal G implies n^inverse m^inverse in M N$    

To prove that $M N normal G$  would like to show that $g m n g^inverse in M N, forall g in G ,forall m in M, forall n in N$ 

Note that $g m n g^inverse = g m g^inverse g n g^inverse = (g m g^inverse) (g n g^inverse) in M N$ since by assumption $g m g^inverse in M$ and $(g n g^inverse) in N$   

$qed$ 

]
#prob(breakable:false)[Let $M $ and $N $ be normal subgroups of $G $ such that $G = M N $ . Prove that $G slash (M inter N) =^tilde (G slash M) times (G slash N)$  ][

We can define a map $phi: G arrow (G slash M) times (G slash N)$ by $g arrow.bar g M times g N$  

Well defined: suppose $g_1 = g_2$ for $g_1, g_2 in G$  

Then $phi(g_1) = (g_1 M, g_1 N)$ and $phi(g_2) = (g_2 M, g_2 N)$

Then $phi(g_1) = phi(g_2)$ by the assumption that $g_1 = g_2$  

Homormophism: $phi(g_1 g_2)= (g_1 g_2 M, g_1 g_2 N) = (g_1 M g_2 M, g_1 N g_2 N)  = (g_1 M, g_1 N) (g_2 M, g_2 N) = phi(g_1) phi(g_2) $  

Surjective: let $g_1, g_2 in G$ where $g_1 = m_1 n_1, g_2 = m_2 n_2$ then we would like to show that $phi(m_2 n_1) = (g_1 M, g_2 N)$

This is true because $g_1 M = m_1 n_1 M = n_1 n_1^inverse m_1 n_1 M = n_1 M$ and that 

$g_2 N = m_2 n_2 N = m_2 N$

Finally, $phi(m_2 n_1) = (m_2 n_1 M, m_2 n_1 N) = (n_1 n_1^inverse m_2 n_1 M, m_2 n_1 N) = (n_1 M, m_2 M) = (g_1 M, g_2 N)$ 

The kernel of $phi$ is all elements $g in G$ such that $phi(g) = (g M, g N) = (M, N)$ which only happens if $g in M inter N$ (from a prop in class) so the kernel of $phi$ is $M inter N$   

Applying the first isomoprhism theorem, the claim follows

$qed$ 

reference:

https://math.stackexchange.com/questions/310351

]
#prob(breakable:false)[Let $p $ be a prime and let $G $ be a group of order $p^a m $ where $p $ does not divide $m $ . Assume $P $ is a subgroup of $G $ of order $p^a $ and $N $ is a normal subgroup of $G $ of order $p^b n $ where $p $ does not divides $n$ Prove that $|P inter N| = p^b $ and $abs(P N slash N) = p^(a-b)$. (the subgroup $P $ of $G $ is called a Sylow p-subgroup of $G $. This excercise shows that the intersection of any Sylow p-subgroup with a normal subgroup $N $ is a Sylow p-subgroup of $N$ )  ][

By the second isomorphism theorem we have that $ (P N) slash N =^tilde P slash (P inter N) arrow.double |(P N) slash N| = |P slash (P inter N)| = |P N| slash |N| = |P| slash |P inter N| \ implies |P N| = (|P| |N|)/(|P inter N|) implies |P N| = (p^a p^b n)/(P inter N) $

Thus we would like to show that $|P N| = p^a n$ then the claim will follow \

By langrange's we know that there exist $k$ such that $|P N| k = p^a m$ since $P N lt.eq G$

Then equivalently we would like to show that $p^a m = p^a n k implies m = n k$

Suppose that $m eq.not n k$ then $n divides.not m$

From lagrange's we know that $p^b n divides p^a m implies n divides m$ which invalidates this assumption, and the claim follows

$qed$ 

]
#prob(breakable:false)[Show that if $|G| = p q $ for some primes $p, q $ (not necessarily distinct) then either $G $ is abelian or $Z(G) = {1}$ ][Problem 3, Homework 7

by lagrange's theorem, the possible orders of $Z(G)$ are $1,p,q,p q$

Suppose that $|Z(G)|=1$ then $Z(G) = {1}$ (trivial group is a group)

Suppose that $|Z(G)|=p q$ then $Z(G) = G$ so that $G$ is abelian

Suppose that $|Z(G)| = p$ then $|G slash Z(G)| = p q slash p = q$ (from class) since $q$ is prime  $G slash Z(G)$ is cyclic (from previous homework). This makes $G$ abelian (from problem 2 (see below)) i.e. that $Z(G) = G$ leading to contradiction $p = p q$ so we conclude $|Z(G)| eq.not p$

Similarly, $|Z(G)| eq.not q$

$qed$  

For some $x in G$ let the generator of $G slash Z(G)$ be $x Z(G)$ then we have that for $g in G$ that $g Z(G) = (x Z(G))^a$ for some $a$ and using the binary operation of $G slash Z(G)$ we have that $(x Z(G))^a = x^a Z(G)$

Since we have that $g Z(G) = x^a Z(G)$ then by a proposition in class $(x^a)^inverse g in Z(G)$, so let $x^(-a) g = z$ for some $z in Z$ then we have $g = x^a z$   

Since $z$ is from $Z(G)$ and commutes with all elements of $G$, let $g_1 = x^(a_1) z_1$ and $g_2 = x^(a_2) z_2$  then $ g_1 g_2 = x^(a_1) z_1 x^(a_2) z_2 = x^(a_2) z_2 x^(a_1) z_1 = g_2 g_1 $

where $g_1, g_2 in G$ and so $G$ is abelian


]
#prob(breakable:false)[Show that the additive group $RR $ acts on the $x,y $ plane $RR times RR $ by $r dot (x,y) = (x + r y, y)$ ][

We can check the two properties of a left group action: let $r_1, r_2 in (RR, +)$ and $(x,y) in RR times RR$  then  

1. $(r_1 + r_2) dot (x,y) = (x + (r_1 + r_2)y,y) = (x + r_1 y + r_2 y, y)$

$r_1 dot (r_2 dot (x,y)) = r_1dot (x + r_2 y, y) = (x + r_2 y + r_1 y, y) = (x + r_1 y + r_2 y, y)$ since addition is commutative in $RR$

2. $0 dot (x,y) = (x + 0 y, y) = (x, y)$ 

$qed$ 

]
#prob(breakable:false)[For each $n gt.eq 1$ find all normal subgroups of $S_n$  ][

$S_1 = {1}$ and has normal subgroups ${1}$ and $S_1$ 

$S_2 = {(), (1 space 2)}$ and also has normal subgroups ${1}$ and $S_2$ 

$S_3 = {(), (1 space 2),(2 space 3), (1 space 3), (1 space 2 space 3), (1 space 3 space 2)}$. Besides ${1}$ and $S_3$  it also has normal subgroup $A_3$ since it is the kernel of the sign homomorphism  $f: S_n arrow {1, -1}^*$ where ${1,-1}^* =^tilde ZZ_2$ due to the isomphirsm $f(x) = 1/2 (1-x)$ 

None of the order 2 subgroups generated by a single transposition are normal since conjugation of a transpsoition by a transposition will result in a different transposition, for example $(1 space 3) (1 space 2) (1 space 3) = (2 space 3)$

$S_4$ has normal subgroups ${()}, S_4, A_4$ and also $V_4 = {(), (1 space 2) (3 space 4), (1 space 3) (2 space 4), (1 space 4) (2 space 3)}$ as we saw in class

For $n gt.eq 5$ we have $S_n, {()}, $and $A_n$

Since $A_n$ is simple for $n gt.eq 5$ then its only normal subgroups are trivial subgroup and itself

For a proof that $A_n$ is the only normal subgroup besides $S_n$ and ${()}$ wecan check the following post:

https://math.stackexchange.com/questions/482889/normal-subgroups-of-s-n-for-n-geq-5


]
#prob(breakable:false)[Assume $n $ is an even positive integer and show that $D_(2 n )$ acts on the set consisting of pairs of opposite vertices of a regular $n- $ gon. Find the kernel of this action][

Let $D_(2 n) = {1, r, r^2, dots, r^(n-1), s, s r, dots, s r^(n-1)}$ be the usual Diehedral group of order $2 n$

We would like to define a group action $mu: D_(2 n) times A arrow A$ where $A = {(i,i + n/2): 0 lt.eq i lt.eq n/2 - 1}$  such that $mu$ satisfies the "identity" and "compatibility" axioms for a group action (here $A$ represents the pairs of opposite vertices)

Define $mu$ by the following : \

(i) $(1, (i, i + n/s)) arrow.bar (i, i + n/2)$ then $mu$ immediately satisfies the identity axiom and the compatibility axiom is sastisfied by $1 1 dot (i, i+n/2) = 1 dot (i, i + n/2) = (i, i+n/2) = 1 dot (1 dot (i, i + n/2)) $  \

where $1 1$ is the multiplication of $1 in D_(2 n)$ with itself  

(ii) rotations are mapped by $(r^k, (i, i + n/2)) arrow.bar (i + k, i + k + n/2) $ where each coordinate is taken $mod n$. Clearly, $(i + k, i + k + n/2)in A$ and we have that $(r^(k_1) r^(k_2)) dot (i, i plus n/2 ) = r^(k_1 + k_2) (i, i + n/2) =  (i + k_1 + k_2, i + k_1 + k_2 + n/2) = r^(k_1) dot (i + k_2, i + k_2 + n/2) = r^(k_1) dot (r^(k_2) dot (i, i plus n/2))$ so that this map satisties compatibility

(iii) rotations that are not across a line of reflection across midpoints can be mapped by $(s r^k, (i, i plus n/2)) arrow.bar (i + n/2, i + n/2 + n/2) = (i + n/2, i)$ where coordinates are taken $mod n$
ility
clearly $(i + n/2, i)$ is in $A$ since the order of coordinates in $A$ does not matter, and we have that $(s r^k s r^k) dot (i, i plus n/2) = 1 dot (i,i+n/2) = (i, i plus n/2)$ and on the other hand $s r^k dot (s r^k dot (i, i plus n/2)) = s r^k dot (i plus n/2, i) = (i, i + n/2)$ so that this mapping satisfies compatibility 

(iv) rotations that are across midpoints don't have an explicit mapping, however since these reflections preserve midpoints between vertices (but will relabel the vertices), then the action of such a reflection on an element in $A$ will still be in $A$

And similar to (iii) since reflections have order 2 then case (iv) will also satisfy compatibility 

Additionally since combinations of a rotation and reflection (in either order) are still reflections, then $mu$ is a group action \

The kernel of $mu$ is ${1, r^(n/2)}$ since these are the only elements of $D_( 2 n)$ which preserve all opposite pairs of vertices \

$qed$ 

]
#prob(breakable:false)[Let $G $ be a group and let $A = G$. Show that the maps defined by $g dot a = a g^inverse forall g,a in G$ satisfy the axioms of a (left) group action of $G $ on itself.   ][

Note that $a g^inverse$ is computed in $G$ with $G$'s  binary operation in the definition of the map

(i) $1 dot a = a (1^inverse) = a$ 

(ii) $(g h) dot  a = a (g h)^inverse = a h^inverse g^inverse in A$ 

$g dot (h dot a) = g dot (a h^inverse) = a h^inverse g^inverse in A$ where $a h^inverse in A$  

$qed$ 

]