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

math111a jc hw6

#prob[Use Langrange's theorem in the multiplicative group $(ZZ_p)^times$ to prove fermat's little theorem: if $p $ is a prime then $a^p equiv a mod p $ for all $a in ZZ$  ][

Consider that $a^p = a^(p-1) a mod p$

Then if we show that $a^(p-1) = 1 mod p$ for any $p$ then the claim follows 

To see why this is true, note that for an element $a in ZZ_p^times,$  and by a corollary to langrange's theorem, $abs(a) divides abs(ZZ_p^times) = p-1 arrow.double |a| k = p- 1$ for some $k$ 

Then taking raising both sides by $k$ gives  $ a^((p-1)\/k) = 1 arrow.double a^(p-1) = 1 mod p $  

$qed$ 

]
#prob[Use Langrange's theorem in multiplicative group $(ZZ_n)^times$ to prove Euler's theorem: $a^(phi(n)) equiv 1 mod n$ for every $a $ relatively prime to $n$, where $phi $ denotes Euler's $phi $ function   ][

Note that the order of $ZZ_n$ is $phi(n)$

Then by a corollary to lagrange's theorem for any $a in ZZ_n^times$ we have $abs(a) divides abs(ZZ_n) arrow.double abs(a) k = phi(n) arrow.double a^(phi(n)\/k) = 1 arrow.double a^(phi(n)) = 1 mod n$ after raising both sides by $k$ 

$qed$ 

]
#prob(breakable: false)[
1. prove that if $H,K$ are normal subgroups of a group $G $ then their intersection $H inter K$ is also a normal subgroup of $G$

2. Prove that the intersection of an arbitary non-empty collection of normal subgroups of a group is a normal subgroup (do not assume that the collection is countable)

][

1. 

Note that $H inter K lt.eq G$ by an earlier homework, so we need to show that $H inter K$ is a normal subgroup of $G$   

In order to show that $g (H inter K) g^inverse = H inter K$ it is enough (from a proposition in class) that \ $g(H inter K)g^inverse subset.eq H inter K$

For some $g in G$ any any $x in H inter K$ we have that $g x g^inverse in g (H inter K)g^inverse$ 

Since $H normal G$ then $g x g^inverse in H$ and since $K normal G$ then $g x g^inverse in K$

Then we have $g x g^inverse in H inter K$ and the claim follows \ $qed$  

2.

From a previous homework we showed that the intersection of an
arbitrary non-empty collection of subgroups of a group $G$ is again a subgroup of $G$

Then we need to show this intersection is normal i.e. that if $H = inter_(a in cal(Alpha)) H_alpha$ where each $H_alpha "s.t." a in cal(Alpha)$ is a normal subgroup of $G$ then $H$ is a normal subgroup of $G$ (i)   \

It is enough to show that $g_1 (inter_(a in cal(Alpha))H_alpha) g_1^inverse subset.eq inter_(a in cal(Alpha))H_alpha$ 

let $g_1 in G$ and any $x in inter_(a in cal(Alpha))H_alpha$ then $g_1 x g_1^inverse in g_1 (inter_(a in cal(Alpha))H_alpha) g_1^inverse $

Note that if $x in inter_(a in cal(Alpha))H_alpha$ then $x in H_alpha$ for any $alpha$ and that $x$ has the form $x = g_2 y g_2^inverse$ for $y in H_alpha$ any $g_2 in G$        

Then $g_1 x g_1^inverse = g_1(g_2 y g_2^inverse) g_1^inverse = (g_1 g_2) y (g_1 g_2)^inverse in H_alpha "for any" alpha therefore g_1 x g_1^inverse in inter_(a in cal(Alpha))H_alpha$ (the normal subgroups definition holds for any $g in G$ (note that $g_1 g_2 in G$))

The claim follows 

$qed$ 

(i) $cal(Alpha)$ contains the indices which "label" each $H_alpha$  


]
#prob[Prove that if $N lt.tri.eq G$ and $H $ is any subgroup of $G$ then $N inter H lt.tri.eq H$    ][

It is enough to show that for any $h$ that $h (N inter H) h^inverse subset.eq N inter H$

let $h in H$ and $x in N inter H$ then $h x h^inverse in h (N inter H) h^inverse$

Note that $h x h^inverse in N$ since $N normal G, h in G, h^inverse in G, x in N$ since $H subset.eq G$

Note that $h x h^inverse in H$ since $h in H, h^inverse in H, x in H$ and that $H$ must be closed 

Then $h x h^inverse in N inter H$ and the claim follows \

$qed$ 

]
#prob(breakable: false)[Let $N $ be a finite subgroup of a group $G$ and assume that $N = chevron.l S chevron.r$ for some subset $S$ of $G$. Prove that an element $g in G $ normalises $N$ iff $g S g^inverse subset.eq N$      ][

This is equivalent to showing that $g N g^inverse = N iff g S g^inverse subset.eq N$

$(arrow.double)$ Assume that $g N g^inverse = N$

Then $g n g^inverse in N$ for any $n in N$

Consider $g s g^inverse in g S g^inverse$ for any $s in S$

Then $g s g^inverse in N$ since $s in S implies s in N because N = chevron.l S chevron.r$

$(arrow.double.l)$ Want to show that $g S g^inverse subset.eq N arrow.double g N g^inverse = N$

Firstly, note that for any $s in S$ we have $(g s g^inverse) (g s^inverse g^inverse) = 1$. Since $g s g^inverse in N$ then the inverse should also be in $N$ i.e. $g s^inverse g^inverse in N$ (0)

Next, denote an element in $n$ to be $n = s_1^epsilon_1 s_2^epsilon_2 dots s_m^epsilon_m$ where $epsilon = plus.minus 1$ by the definition of groups generated by a subset

Now, consider $g n g^inverse in g N g^inverse$ for some $n in N$

By a nice trick, $ g n g^inverse = g s_1^epsilon_1 s_2^epsilon_2 dots s_m^epsilon_m g^inverse = (g s_1^epsilon_1 g^inverse)(g s_2^epsilon_2 g^inverse) dots (g s_m^epsilon_m g^inverse) in N $

since each term is in $N$ by (0) and that $N$ is a closed (1) \

Then, consider $n in N$ then $ n = s_1^epsilon_1 s_2^epsilon_2 dots s_m^epsilon_m = g(g^inverse s_1^epsilon_1 g g^inverse s_2^epsilon_2 g dots g^inverse s_m^epsilon_m g)g^inverse = g (g^inverse n g)g^inverse $

And by the previous result (1) we know that $g^inverse n g in N$ therefore $n$ can be written as $g n g^inverse arrow.double n in g N g^inverse$ (2)

The claim follows by (1) and (2)

$qed$ 

]
#prob[Prove that the group of inner automorphisms $"Inn"(G)$ is a normal subgroup of $"Aut"(G)$  ][

Note that $"Inn"(G) = {phi.alt_g: phi.alt_g (x) = g x g^inverse forall x in G}$ where $phi.alt_g: G arrow G$

This is a group with identity $phi.alt_1$ and inverse $phi.alt_(g^inverse)$ and a subset of $"Aut"(G)$ (we showed $phi.alt_g$ is an automorphism in class)

We would like to show that for all $phi in "Aut"(G) "that" phi phi.alt_g phi^inverse in "Inn"(G)$. Note that $ (phi phi.alt_g phi^inverse)(x) = phi (phi.alt_g (phi^inverse (x))) = phi (g phi^inverse (x) g^inverse) = phi(g) x phi(g^inverse) = phi(g) x (phi(g))^inverse = phi.alt_(phi(g)) in "Inn "(G) $  

since $phi$ is a homomorphism and $phi(x^inverse) = (phi(x))^inverse$ for any $x in G$   

$qed$ 

]
#prob(breakable:false)[Let $G$ be a gorup such that $abs(G) = p q$ where $p,q$ are prime. Prove that every proper subgroup of $G$ is cyclic    ][

The divisors of $p q$ are $1,p,q,p q$

Then any proper subgroup of $G$ must have order $1,p,q$ by lagrange's theorem

We know that ${1}$ is cyclic, and that groups of prime order are also cyclic (from homework 5 problem 9)

$qed$  
]
#prob[Let $G$ be a group such that $abs(G) = 8$. Show that $G$ must have an element of order 2   ][

By lagrange's theorem, any $g in G$  must have order $1,2,4,8$

Suppose that there does not exist $g in G$ such that $|g|=2$

Since $|G| = 8$ then there exist $g in G$ such that $g eq.not 1$

Suppose $|g| = 8$ then $G = chevron g chevron.r$ and $g^4 in G$ has order $2$

Suppose $|g| = 4$ then ${e,g,g^2,g^3} lt.eq G$ and $(g^2)^2 = 1$ and by assumption $g^2 eq.not 1 arrow.double |g^2| = 2 $

These are both contradictions, so $G$ must have an element of order 2 

$qed$ 


]
#prob[Let $G $ be an abelian group with odd order. Show that the product of all the elements of $G$ is the identity ][

By Lagrange's theorem, there cannot exist an element of order $2$

Then every element $g in G$ has an inverse which is not itself i.e. $g^inverse eq.not g$ (except $1 in G$ )

Then $product_(g in G) g =1$ due to $G$ being abelian (order of multiplication does not matter). 

In other words, if we build this product on term at a time, we can pair each term with its inverse and also multiply by the identity for a total of $2 k + 1$ terms for some $k$  

$qed$ 

]
#prob[(Will not be graded: classification of groups of order $2 p$. Let $G$ be a group of order $2 p$ where $p $ is a prime greater than 2. Show that $G$ is isomorphic to either $ZZ_(2 p)$ or $D_(2 p)$.         )][]
