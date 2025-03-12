#import "@preview/slydst:0.1.3": *
#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#show: slides.with(
  title: "Variation of Existence of Eigenvalue Proof",
  subtitle: "from linear algebra done right edition 4",
  date: none,
  layout: "large",
  ratio: 4/3,
  title-color: none,
)

#env_headers.update("classic")
#env_colors.update("classic")

#show raw: set block(fill: silver.lighten(65%), width: 100%, inset: 1em)

// == Outline

// #outline()

// == Content

// - *Level-one headings* corresponds to new sections.
// - *Level-two headings* corresponds to new slides.
// - Blank space can be filled with *vertical spaces* like `#v(1fr)`.

// ```typst
// == Outline

// #outline()

== polynomials that take an operator as input

#notation([

$T^m in cal(L)(V)$ is $T$ applied $m$ times \
$T^0$ is defined to be the identity operator $I$ on V 
])

== polynomials that take an operator as input

#notation([

$T^m in cal(L)(V)$ is $T$ applied $m$ times \
$T^0$ is defined to be the identity operator $I$ on V 
])

#notation([Suppose $T in cal(L)(V)$ and $p in cal(P)(FF)$ where $p(z) = a_0 + a_1 z + a_2 z^2 + dots + a_m z_m$ for all $z in FF$ and $a_0 dots a_m in FF$  

Then $p(T) in cal(L)(V)$ is defined by $p(T) = a_0 I + a_1 T + a_2 T^2 + dots + a_m T^m$  
 ])

== polynomials that take an operator as input

#notation([

$T^m in cal(L)(V)$ is $T$ applied $m$ times \
$T^0$ is defined to be the identity operator $I$ on V 
])

#notation([Suppose $T in cal(L)(V)$ and $p in cal(P)(FF)$ where $p(z) = a_0 + a_1 z + a_2 z^2 + dots + a_m z_m$ for all $z in FF$ and $a_0 dots a_m in FF$

Then $p(T) in cal(L)(V)$ is defined by $p(T) = a_0 I + a_1 T + a_2 T^2 + dots + a_m T^m$   
 ])


#remark([

suppose $p, q in cal(P)(F)$ then 

$(p q)(T) = p(T) q(T) "and" p(T) q(T) = q(T) p(T)$ 

#text(weight: "bold", [No matter if $z in FF$ or  $T in cal(L)(V)$ is the input to $p$ and $q$, properties will hold   ])

 ])

== polynomials that take an operator as input

== facts about polynomials

#theorem([Fundamental Theorem of Algebra 

],[Every nonconstant polynomial with complex coefficients has a zero in $CC$   \

In other words for every $p in cal(P)(CC)$ there exists $lambda$ such that $p(lambda) = 0$  
],[])

== facts about polynomials

#theorem([Fundamental Theorem of Algebra 

],[Every nonconstant polynomial with complex coefficients has a zero in $CC$   \

In other words for every $p in cal(P)(CC)$ there exists $lambda$ such that $p(lambda) = 0$  
],[])

#theorem([each zero of a polynomial corresponds to a degree-one factor],[

Suppose $p in cal(P)(FF)$ is a polynomial of degree $m$ 

Then for $lambda in FF$, we have $p(lambda) = 0 arrow.double.l.r exists q in cal(P)(FF)$ of degree $m - 1$ such that $p(z) = (z - lambda)q(z)$ for every $z in FF$

From before, we also know that $p(T)(v) = (T - lambda I) (q(T) v)$ for $T in cal(L)(V)$ and $v in V$    

],[])

== existence of eigenvalues

#theorem([],[Every operator on a finite-dimensional nonzero complex vector space has an
eigenvalue.],[

Suppose $V$ is a finite-dimensional complex vector space with dimension $n$  \

Let $n > 0$ and $T in L(V)$, and choose $v in V$ with $v eq.not 0$



])
#theorem([],[Every operator on a finite-dimensional nonzero complex vector space has an
eigenvalue.],[

Suppose $V$ is a finite-dimensional complex vector space with dimension $n$  \

Let $n > 0$ and $T in L(V)$, and choose $v in V$ with $v eq.not 0$

The list $v, T v, T^2 v, dots, T^n v$ is not linearly independent (since it has $n+1$ elements)




])
#theorem([],[Every operator on a finite-dimensional nonzero complex vector space has an
eigenvalue.],[

Suppose $V$ is a finite-dimensional complex vector space with dimension $n$  \

Let $n > 0$ and $T in L(V)$, and choose $v in V$ with $v eq.not 0$

The list $v, T v, T^2 v, dots, T^n v$ is not linearly independent (since it has $n+1$ elements)

let $p(T) v = (a_0 I + a_1 T + a_2 T^2 + dots + a_n T^n) (v)$ 

Then some non-constant $p$ exists exists such that $p(T)v = 0$ 
])
#theorem([],[Every operator on a finite-dimensional nonzero complex vector space has an
eigenvalue.],[

Suppose $V$ is a finite-dimensional complex vector space with dimension $n$  \

Let $n > 0$ and $T in L(V)$, and choose $v in V$ with $v eq.not 0$

The list $v, T v, T^2 v, dots, T^n v$ is not linearly independent (since it has $n+1$ elements)

let $p(T) v = (a_0 I + a_1 T + a_2 T^2 + dots + a_n T^n) (v)$ 

Then some non-constant $p$ exists exists such that $p(T)v = 0$ 

Additionally, there exists $lambda in CC$ such that $p(lambda) = 0$ by the fundamental theorem of algebra, and therefore there exists $q in cal(P)(CC)$ such that $p(z) = (z - lambda) q(z)$   
 

])
#theorem([],[Every operator on a finite-dimensional nonzero complex vector space has an
eigenvalue.],[

Suppose $V$ is a finite-dimensional complex vector space with dimension $n$  \

Let $n > 0$ and $T in L(V)$, and choose $v in V$ with $v eq.not 0$

The list $v, T v, T^2 v, dots, T^n v$ is not linearly independent (since it has $n+1$ elements)

let $p(T) v = (a_0 I + a_1 T + a_2 T^2 + dots + a_n T^n) (v)$ 

Then some non-constant $p$ exists exists such that $p(T)v = 0$ 

Additionally, there exists $lambda in CC$ such that $p(lambda) = 0$ by the fundamental theorem of algebra, and therefore there exists $q in cal(P)(CC)$ such that $p(z) = (z - lambda) q(z)$   

Then combining the above 2 results gives us $0 = p(T)v = (T - lambda I)(q(T)v)$ 


])

== existence of eigenvalues continued

#theorem([ ],[ Every operator on a finite-dimensional nonzero complex vector space has an
eigenvalue.],[

Previously we saw that $ 0 = p(T)v = (T - lambda I)(q(T)v)$ 

Since $q$ has smaller degree than $p$, then we cannot have $q(T) v eq.not 0$ \

This is because if $T = lambda I$ then $p(T)v = (a_0 I + a_1 T + a_2 T^2 + dots + a_n T^n)(v)$ is a constant, which is a contradiction \

Therefore it must be that $T eq.not lambda I$ which implies $q(T)v eq.not 0$ (recall that we chose $v eq.not 0$ )

])

== existence of eigenvalues continued

#theorem([ ],[ Every operator on a finite-dimensional nonzero complex vector space has an
eigenvalue.],[

Previously we saw that $ 0 = p(T)v = (T - lambda I)(q(T)v)$ 

Since $q$ has smaller degree than $p$, then we cannot have $q(T) v eq.not 0$ \

Therefore $T - lambda I$ is not injective, which implies that $lambda$ is an eigenvalue of $T$ with eigenvector $q(T)v$  
])

#remark([Recall that if $T - lambda I$ is not injective then $lambda$ is an eigenvalue of $T$   ])
