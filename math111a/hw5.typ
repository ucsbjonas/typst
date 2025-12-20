#import "@preview/ergo:0.2.0": *

#show: ergo-init.with(
    colors:     ergo-colors.dracula,
    styles:     ergo-styles.sidebar1,
    breakable:  true,
    inline-qed: true,
    prob-nums:  true,
)

#set page(margin: 0.5in) 
#let title = "math111a hw5"
#let author = "jc"
#let inverse = (-1)
#let iff = $arrow.double.l.r$

math111a jc hw5

#prob[If $phi.alt: G arrow H $ is an isomorphism, prove that $abs(phi.alt(x)) = abs(x)$ for all $x in G$. Deduce that $G$ and $H$ have the same number of elements of order $n $ for each $n in ZZ^+ $. Is this result true if $phi.alt $ is only a homormophism?   ][

Let $x$ have order $n arrow.double x^n = 1_G$ \
Let $phi.alt(x)$ have order $m arrow.double (phi.alt(x))^m = 1_H$    

Firstly, consider that $(phi.alt(x))^m = phi.alt(x^m) = 1_H arrow.double x^m = 1_G$ since $phi.alt(1_G) = 1_H$

Then $abs(x) lt.eq m$ i.e $abs(x) lt.eq abs(phi.alt(x))$ 

Next, consider that $(phi.alt(x))^n = phi.alt(x^n) = phi.alt(1_G) = 1_H$

Then $abs(phi.alt(x)) lt.eq n$ i.e. $abs(phi.alt(x)) lt.eq abs(x)$

Then the claim follows

Since $phi.alt(x)$ is bijective and preserves the order of any $x in G$ then we can deduce that $G, H$ have the same number of elements of order $n in ZZ^+$. If there was some $x$ such that $abs(x) eq.not abs(phi.alt(x))$ then there exists some other $y in G, x eq.not y$ that has order $phi.alt(x)$, but $y$  should have order $phi.alt(y)$ which is a contradiction in general   

If $phi.alt$ is a homomorphism then the result may not hold, for example in the case of the trivial homormophism

]
#prob[
1. Prove that the multiplicative $CC^*$ and $RR^star$ are not isomoprhic.

2. Prove that $ZZ $ and $QQ$ are not isomoprhic 

][


1. Consider $z = e^((2 pi i) / 3) in CC$ which has order 3, but there are no positive real numbers which have order 3 

(only $1,-1$ in $RR$ have finite order with orders 1 and 2)

Using problem 1 the claim follows

2. Suppose that $phi: QQ arrow ZZ$ is an isomorophism. Then for some $q in QQ$ we have $phi.alt(q) = 1 in ZZ$ 

Then $ 1 =phi(q) = phi(2 q/2) = phi(q/2 + q/2) = phi(q/2) + phi(q/2)  = 2 phi(q/2) $

But there is no $z in ZZ$ such that $2 z = 1$ and the claim follows  

$qed$ 

]

#prob(breakable: false)[Let $G $ be a group.

1. Prove that the map from $G $ to itself defined by $g arrow.bar g^(-1)$ is an automorphism iff $G $ is Abelian

2. Prove that the map from $G $ to itself defined by $g arrow.bar g^2 $ is a homormophism iff $G $ is abelian
][

Denote the maps as $phi: G arrow G$ \

1.


$(arrow.double.l)$ suppose that $G $ is abelian. Then $phi $ is a homomorphism since for any $g_1, g_2 in G$ we have $phi(g_1 g_2) = (g_1 g_2)^(-1) = g_2^(-1) g_1^(-1) = g_1^(-1) g_2^(-1) = phi(g_1) phi(g_2) $    

$phi $ is bijective since for every $g in G$ we have that the preimage of $g$ under $phi$   is $g^(-1)$ (inverses exist) so that $phi $ is surjective and that $phi(g_1) = phi(g_2) iff g_1^inverse = g_2^inverse arrow.double g_1 = g_2 $ so that $phi $ is injective

$(arrow.double)$ suppose that $phi $ is an automorphism. Let $x = phi(a)$ and $y = phi(b)$ where $x,y,a,b in G$. $a,b$ must exist since $phi$ is a bijection. Then $ x y = phi(a) phi(b) = phi(a b) = (a b)^(-1) = b^(-1) a^inverse = phi(b) phi(a) = y x$ so that $G$ is abelian 

$qed$ 

2.

$(arrow.double.l)$ suppose that $G $ is abelian. Then for any $g_1, g_2 in G$ we have $phi(g_1 g_2) = (g_1 g_2)^2 = g_1^2 g_2^2 = phi(g_1) phi(g_2)$ where the last equality holds due to the assumption

$(arrow.double)$ suppose that $phi $ is a homomorphism. then we must have for any $g_1, g_2 in G$ that $phi(g_1 g_2) = phi(g_1) phi(g_2)$ 

This means that $(g_1 g_2)^2 = g_1^2 g_2^2$ is true, which implies that $G$ is abelian (from group properties we learned previously)


$qed$ 

]
#prob[

Prove that the map $A arrow.bar (A^T)^(-1)$ is an automorphism on $G L_n (RR)$  

][

Denote the map by $phi: G L_n (RR) arrow G L_n (RR)$

Let $A_1, A_2 in G L_n (RR)$ 

We can use the fact that $(A_1 A_2)^T = A_2^T A_1^T$ and that $ (A^T)^T = A$   \

First we can show that $phi $ is a homomorphism: $ phi(A_1 A_2) = ((A_1 A_2)^T)^inverse = (A_2^T A_1^T)^inverse = (A_1^T)^inverse (A_2^T)^inverse = phi(A_1) phi(A_2) $ 

Next, we can show $phi $ is a bijection: \

$phi $ is surjective since if we have an element $A in G L_n (RR)$ then its preimage is $(A^(-1))^T$ since applying $phi $ gives $phi((A^inverse)^T) = ((((A^(-1))^T)^T)^inverse) = A$ by the above facts   \

$phi $ is injective since if $phi(A_1) = phi(A_2) iff (A_1^T)^inverse = (A_2^T)^inverse iff A_1^T  = A_2^T iff A_1 = A_2$ 

$qed$ 

References:

https://proofwiki.org/wiki/Transpose_of_Matrix_Product

]

#prob(breakable: false)[Let $G $ be a cyclic group. Find all automorphisms of $G$. Consider both the finite order and the infinite order case ][

Let $n = abs(G)$ 

1. If $G$ is cyclic and finite order $n$ then the automorphisms of $G $ are the set $ "Aut"(G) = {phi_m: phi(x) = x^m: 1 lt.eq m lt n and (m,n) = 1, forall x in G} $ where $phi: G arrow G$ 

Note that $forall x,y$ that $phi(x y) = (x y)^m = x^m y^m = phi(x) phi(y)$ since $G$ is cyclic and therefore abelian

Note that if $phi(x) = phi(y)$ then $x^m = y^m arrow.double x = y$ since $G$ is cyclic and $(m,n) = 1$ and by Bezout identity we can write $1 = a m + b n$ for some $a,b$ and then $ x^m = y^m iff (x^m)^a = (y^m)^a iff x^(a m) = y^(a m) iff (x)^(1 - b n) = y^(1 - b n) iff x (x^n)^(-b) = y (y^n)^(-b) iff x e = y e iff x = y $   

Combined with the fact that $phi$ maps a finite set to itself, then $phi $ is surjective and bijective, as well as an automorphism

If we let $g$ be a generator of $G$ then $g^m$ is a generator as well (due to the coprime condition) however if $n = b m $ for some integer $b$ then we would have $phi(1) = 1$ and $ phi(g^m) = g^(m)^(n/b) = g^n^(m/b) = 1 $ which violates bijectivity. Therefore the condition that $(m,n)=1$ must hold ($phi$ can only be of the form described above) and $abs("Aut"(G)) = phi.alt(n)$      

This means also that $phi$ must map a generator to another generator if $phi $ is to be an automorphism of a cyclic (finite) group 

2. If $G$ is infinite order then the automorphisms of $G$ are the identity mapping and the inverse mapping \

Since inverses are unique, then the inverse map $phi: G arrow G$ s.t. $phi(x) = x^inverse forall x in G$ is bijective and $phi(x y) = (x y)^inverse = y^inverse x^inverse = x^inverse y^inverse = phi(x) phi(y)$ due to $G$ is abelian  

The identity mapping here is also an automorphism

From class we have that $G$ is ismorphic to $ZZ$ (see the reference)   

References:

https://www.youtube.com/watch?v=bNJDQWNwb8o

Jose Carlos Santos: https://math.stackexchange.com/questions/4086992/why-does-the-set-of-all-automorphisms-on-the-additive-group-of-integers-contain

]
#prob(breakable: false)[Prove that the homormopshim $S_3 arrow "Aut" (S_3)$ defined by $g arrow.bar phi.alt_g$ is an isomoprhism. Here $phi.alt_g$ denotes the 'conjugation by g' function defined in class.   ][

denote this homormophism by $phi: S_3 arrow "Aut" (S_3)$

for any $g, in G $ , conjugation by g is the map $phi.alt_g: G arrow G $ defined by $phi.alt_g (x) = g x g^(-1) forall x in G$

First we show that $phi $ is a homomorphism (let $g_1, g_2 in S_3$ ): \

note that $ phi(g_1 g_2) = phi.alt_(g_1 g_2)$ and that $phi(g_1) phi(g_2) = phi.alt_(g_1) phi.alt_(g_2)$ so we want to show that $phi.alt_(g_1 g_2) = phi.alt_(g_1) phi.alt_(g_2)$

let $sigma in S_3$ then $phi.alt_(g_1 g_2) = g_1 g_2 sigma (g_1 g_2)^(-1) = g_1 g_2 sigma g_2^inverse g_1^inverse$

and that $phi.alt_g_1(phi.alt_g_2 (sigma)) = phi.alt_g_1(g_2 sigma g_2^inverse) = g_1 g_2 sigma g_2^inverse g_1^inverse$ so they match, therefore $phi $ is a homomorphism \

Next we show that $phi $ is bijective: \

First we can show injective:

note $phi(g_1) = phi(g_2) iff phi.alt_g_1 = phi.alt_g_2$ and note that for any $sigma in S_3$ that $phi.alt_g_1(sigma) = g_1 sigma g_1^inverse$ and $phi.alt_g_2(sigma) = g_2 sigma g_2^inverse$  

we want to show that $g_1 sigma g_1^inverse = g_2 sigma g_2^inverse arrow.double g_2^inverse g_1 sigma g_1^inverse g_2 = sigma arrow.double (g_2^inverse g_1) in Z(S_3) = {1}$

then $g_2^inverse g_1 = 1 therefore g_2 = g_1$ and $phi$ is injective \

next we can show surjective by cardinality argument: \

$|S_3| = 3! = 6$ and we want to show that $|"Aut"(S_3)|=6$.

Since $S_3$ has 6 bijections then $"Aut"(S_3)$ must have at most 6 bijections (since bijections in $"Aut"(S_3)$ must also be homormorphisms) and due to injectivity we have that $|"Aut"(S_3)| = 6$

$qed$ 


]
#prob(breakable: false)[Let $H $ be the cyclic subgroup of the alternating group $A_4$ generated by the premutation $(1 2 3)$. Exhibit the left and right cosets of $H $ explicitly.  ][

the alternating group $A_4 = {(), (1 2)(3 4), (1 3)(2 4), (1 4)(2 3), (1 2 3), (1 3 2), (1 2 4), (1 4 2), (1 3 4), (1 4 3), (2 3 4), (2 4 3)

}$ 

and $H = chevron.l (1 2 3) chevron.r = {(),(1 2 3), (1 3 2)}$ \

The number of cosets are $|A_4|slash|H| = 4$ by a proposition in class (the left/right cosets also form a partition of $G = A_4$ )

Then the left cosets of $H$ are: \

handwritten

And the right cosets of $H$ are:  

handwritten

]
#prob(breakable: false)[Prove that if $H $ and $K$ finite subgroups of $G $ whose orders are relatively prime, then $H inter K = 1$  ][

Firstly, we can try to show that $H inter K lt.eq H and H inter K lt.eq K$. Since $1 in H and 1 in K$ then $H inter K eq.not emptyset$. Aditionally, $forall x,y in H inter K$ we have that $x,y in H and x,y in K arrow.double y^inverse in H and y^inverse in K$ and so $ x y^inverse in H and x y^inverse in K arrow.double x y^inverse in H inter K$ due to closure and existence of inverse. So this is true.

Then by langrange's theorem we can say that $abs(H inter K)$ should divide both $abs(H)$ and $abs(K)$ 

Since $(abs(H), abs(K)) = 1$ then $|H inter K| = 1 arrow.double H inter K = {1}$  

$qed$ 
]
#prob(breakable: false)[Prove that if $G $ is a group of prime order $p$, then $G$ is a cyclic group.  ][

Note that every element of $G$ generates a cyclic subgroup of $G$  

Consider the finite subgroup $chevron.l a chevron.r lt.eq G$ for some $a in G$  

If $G = {1}$ then $a=1$ and here $G$ is cyclic \

Otherwise, let $a eq.not 1$  then $abs(chevron.l a chevron.r)$ divides $|G|$ by Langrange's theorem and since $|G|$ is prime then $abs(chevron.l a chevron.r) = p = abs(G)$ implying that $G = chevron.l a chevron.r$, since $a$ generates a subgroup of $G$ with order equal to $G$ thererby generating all of $G$   

Then $G$ is cyclic. 

$qed$

references:

https://math.stackexchange.com/q/3293910

]

