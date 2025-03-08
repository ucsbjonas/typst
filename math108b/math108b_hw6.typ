#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math108B hw4"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)
#set math.mat(delim: "[")

#env_headers.update("classic")
#env_colors.update("bw")

#prob([Find the dual basis of the standard basis on $FF^(3,1)$ ],[

\ 

The standard basis ${e_i}_(i=1)^3$  on the set of $3 times 1$ matrices (with real values) is $e_1 = mat(1;0;0)$, $e_2=mat(0;1;0)$ and $e_3mat(0;0;1)$ \

The dual basis for the dual space of $FF^(3,1)$ can be defined as $ phi_j(mat(x_1;x_2;x_3)) = x_j $ for $j in {1,2,3}$  

This satisfies the definition of dual basis, that $phi_j (e_i)= 1$ if $i=j$ and 0 otherwise  
])
#pagebreak()
#prob([Let $V = P(RR)$ and let ${v_k}_(k=0)^n = {x^k}_(k=0)^n$ be the standard basis for $V$, and let ${phi_j}_(j=0)^n$ be the the corresponding dual basis for $V'$. Prove that $ phi_j (p) = (p^((j)) (0))/ j! $ for every $p in V$ and $j = 0,1,dots,n$],[

\

Note that $p^((j))$ denotes the $j$th derivative of $$p   

Note that for any polynomial $p$ that the taylor expansion of $p$ is $p$ itself \

Since the $k$th derivative for a degree $n$  polynomial is $0$ for all $k > n$ we have:    $ p = sum_(k=0)^n (p^((k))(0))/k! x^k $ 

And using LADR 3.114 we know that \

$p = phi_0(p) x^0 + dots + phi_n (p) x^n$ \

It is then natural to define the dual basis of $V$ to be $ phi_j (p) = (p^((j)) (0))/ j! $   

])

source: "Taylor's Series of a Polynomial | MIT 18.01SC Single Variable Calculus, Fall 2010" at link: https://www.youtube.com/watch?v=19x213y_uk4

#pagebreak()

#prob([

In the textbook we define ${phi.alt_1, dots, phi.alt_n}$ to be the dual basis of $V$ where the basis of $V$ is ${v_1, dots, v_n}$ satisfying the following: \ $ phi.alt_i (v_j) = cases(1 "if" i = j, 0 "if" i eq.not j) $ \
Given a constant $lambda eq.not 0$ we define another set ${T_1, dots, T_n}$ of elements in $V'$ satisfying that $ T_i (v_j) = cases(lambda "if" i = j, 0 "if" i eq.not j) $    

Is the set ${T_1, dots, T_n}$ a (nonstandard) dual basis? What is the relationship between $T_i$ and $phi.alt_i$ ?   

],[

\

Note that $T_i in {T_1, dots, T_n}$ is a scalar multiple of $phi.alt_i in {phi.alt_1, dots, phi.alt_n}$ where the scalar multiple is $lambda$ \

In general, if we have a basis $v_1, dots, v_n$ for a $n$-dimensional  vector space $V$ then for any $lambda eq.not 0 in FF$ the list $lambda v_1, dots, lambda v_n$ is also a basis  \

To show this we can show that $lambda v_1, dots, lambda v_n$ is linearly independent. (this list is of the "right length" $n$ ) \

Consider $alpha_1, lambda v_1 + dots + alpha_n lambda v_n = lambda (alpha_1 v_1 + dots + alpha_n v_n) = 0 in V$ \

Since $lambda eq.not 0$ then it must be true that $alpha_1 v_1 + dots + alpha_n v_n = 0$ Since $v_1, dots, v_n$ are a basis and therefore linearly independent then this implies that $alpha_1 = dots = alpha_n = 0 in FF$  

$qed$



])

#pagebreak()

#prob([Is $L(V, W)$ isomorphic to $L(W', V')$? \

Suppose that $V$ and $W$ are finite dimensional vector spaces over $FF$. Show that the map $D:L(V, W) arrow L(W', V')$ defined by $D(T) = T'$ is an isomorphism     
  ],[

\ We can try to show that $L(V, W)$ and $L(W', V')$ have the same dimension. \

Note that $dim(W') = dim(L(W, RR)) = dim(W) dim(RR) = dim(W)$ \

Similarly, $dim(V') = dim(V)$ (this result is also shown in LADR 3.111) 

Then $dim L(V, W) = dim(V) dim(W) = dim(W') dim(V') = dim(W', V')$ implies that $L(V, W)$ and $L(V', W')$  are isomorphic.   


  ])

#pagebreak()
#prob([Is the invertible operator equivalent to the invertible matrix that represents that operator?

Suppose that $V$ is a finite dimensional vector space over $FF$. Let ${v_k}_(k=1)^n$ be a basis for $V$, let $T in L(V)$ nand let $A$ be the matrix of $T$ relative to ${v_k}_(k=1)^n$ 

Prove that $T$ is an invertible operator if and only if $A$ is an invertible matrix.  

],[

\ Let $A = [T]_beta^beta$ be the matrix for $T$ relative to $beta={v_k}_(k=1)^n$  then \

If $T$ is an invertible operator, then there exists some $T^(-1)$ such that $T T^(-1) = T^(-1) T = I$ \

The matrix for $T^(-1)$is $[T^(-1)]_beta^beta$ and $[T circle.small T^(-1)]_beta^beta = [T]_beta^beta [T^(-1)]_beta^beta = [I]_beta = [T^(-1)]_beta^beta [T]_beta^beta=  [T^(-1) circle.small T]_beta^beta$ \

Therefore $[T]_beta^beta$ is invertible. \

Conversely, suppose that $[T]_beta^beta$ is invertible then there exists some matrix $[T^(-1)]_beta^beta$  such that $[T]_beta^beta [T^(-1)]_beta^beta = [I]_beta = [T^(-1)]_beta^beta [T]_beta^beta$ which implies that $T$ is invertible since if $[T^(-1)]_beta^beta$  exists then so does $T^(-1)$ \

Note that in the above we use the fact that there is an isomoprhism between linear maps and matrices which represent those linear maps i.e. $T arrow [T]_beta^beta$  for each $T in L(V)$ is an isomophism


])
#pagebreak()

#prob([Prove that an operator $T in L(V)$ on a finite dimensional vector space $V$ is invertible if and only if 0 is not an eigenvalue of $T$    ],[

\
$arrow.double$  Suppose that $0 $ is an eigenvalue of $T$, then consider the equation $T v = 0 v = bold(0)$. Then any $v in V$ will satisfy this equation, which implies that the null space of $T$ is not only ${bold(0) in V}$ and therefore $T$ cannot be injective and therefore is not invertible. (this is the contrapositive statement)         

$arrow.double.l$ Suppose that $T$ is not invertible then $T$ is no injective. Then $exists v in V$ such that $v eq.not bold(0)$ and $T(v) = bold(0) = 0v$ so that $v$ is an eigenvector with zero eigenvalue. (this is also the contrapositive statement)       

])
#pagebreak()
#prob([Prove that the sum of two invariant subspaces is invariant],[

\ Suppose that $U_1, U_2$ are invariant subspaces under $T in L(V)$ \

Then $U_1 + U_2$ is invariant if $T(z in U_1 + U_2) in U_1 + U_2$ for all $z in U_1 + U_2$ \ 

let $z = u_1 + u_2$ where $u_1 in U_1$ and $u_2 in U_2$ (by the definition of sums of subspaces) \

Then $T(u_1 + u_2) = T(u_1) + T(u_2)$ by linearity and \

Then we can conclude that $T(u_1) + T(u_2)$ is an element of $U_1 + U_2$ since $T(u_1) in U_1$ and $T(u_2) in U_2$  by the assumption that $U_1, U_2$ are invariant subspaces under $T$ 

])
#pagebreak()
#prob([Let $V$ be a vector space over $FF$, let $T in L(V)$ and let $W subset V$ be a subspace invariant under $T$. Prove that $"null"(T|_W) = ("null"T) inter W$],[

\ Let $T|_W: W arrow W$ 

Suppose that $v in null(T|_W)$ then $T|_W (v) = 0$  Clearly $v in W$ and $v in V$   and since $0 in W arrow.double 0 in V$ we have that $v$ is in the null space of $T$. Then $v in "null"T inter W$  \

Suppose that $v in "null"T inter W$ then $v in "null"T and v in W$ \ Note that $W$ and $V$ share the same $0$ element since $W$ is a subspace of $V$. Then $T(v) = 0 in W$ which is the same condition for $v$ being in the null space of $T|_W$ (that a vector in  $W$ must map to $0 in W$) 

])