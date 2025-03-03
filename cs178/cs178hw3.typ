#import "@local/superTemplate:0.2.0": *
#import math_mod: *
#import cs_mod: *
#let date = datetime.today()
#show: assignment.with("CS178 Assignment 3", "Jonas Chen", date)

#env_headers.update("classic")
#env_colors.update("bw")

#prob([Let $F: {0,1}^lambda times {0,1}^n arrow {0,1}^lambda$ be a pseudorandom function.

Define $G: {0,1}^lambda times {0,1}^(2n) arrow {0,1}^lambda$ such that $ G(k, x_1 || x_2) = F(F(k,x_1),x_2)$ where $|x_1| = |x_2| = n $

Show that $G$ is also a pseudorandom function. \

 ],[
\
Suppose for contradiction that $G$ is not a pseudorandom function \

Since $F$ is a pseudorandom function, then we know that $$  

(this version of the definition for security of PRFs is both implied by the oracle definition and defined in class in the prf "game") \

Fix a key $k = |lambda|$ and let $U$ be the set of all random functions from ${0,1}^(lambda + 2n) arrow {0,1}^lambda$

Goal: show that ${G(lambda, x_1, x_2): x_1, x_2 unif {0,1}^n} approx_c {u: {0,1}^(lambda + 2n) arrow {0,1}^lambda} = U$ \


Consider the following distributions: \

$H_0 = {G_k: k in {0,1}^lambda} "is the distribution of PRFs" G "with key" k$ 

$H_1 = {G_k (x_1, x_2): x_1, x_2 unif {0,1}^n}$

$H_2 = {G_k (x_1||x_2): x_1, x_2 unif {0,1}^n}$

$H_3 = {F(F(k,x_1),x_2): x_1, x_2 unif {0,1}^n}$ 

$H_4 = {F(z_1, x_2): x_1 unif {0,1}^n, z_1 := F(k,x_1) in {0,1}^lambda}$ 

$H_5 = {u: u unif {0,1}^(lambda + 2n)}$

$H_6 = {}$ 



 ])

#prob([

Let $G: {0,1}^lambda arrow {0,1}^m$ be a secure pseudorandom generator, where $lambda < m$. Given $x in {0,1}^n$ and $k in {0,1}^(2n dot lambda)$, we split $k $ into $2n $ substrings of length $lambda$, where $k = (S_(1,0), S_(1,1), dots, S_(n,0), S_(n,1))$ and $|S_(i,j)| = lambda$ and define $S_(i, x_i)$ as follows: $ S_(i, x_i) = cases(S_(i,0) "if" x_i = 0, X_(i,1) "if" x_i = 1) $ 

Where $x_i $ is the ith bit of $x_1, dots, x_n$. Let $F: {0,1}^(2n lambda) times {0,1}^n arrow {0,1}^m$ be a pseudorandom function where $ F(k,x) = G(S_(1, x_1)) xor dots xor G(S_(n, x_n)) $ \

Show that $F$ is not a secure pseudorandom function 

],[

\

Let $cal(G)_(n,m)$ be the set of random functions from ${0,1}^n arrow {0,1}^m$    Consider the following 4 inputs into $F$ :

$x_1 = (0000 dots)$ ; $x_2 = (1111 dots)$ ; $x_3 = (000,dots,1,dots,000)$; $x_4 = (111,dots,0,dots 111)$   

i.e. the first input is all 0's, second input is all 1's, and the last two inputs are negations of eachother. We consider the specific example listed above where we have two strings of 0's and 1's expect at the $m$th position. Consider the following: \

$F(k,x_1) = G(S_(1,0)) xor dots xor G(S_(n,0)) = G(S_(1,0)) xor dots G(S_(m,0)) xor dots xor G(S_(n,0))$

$F(k,x_2) = G(S_(1,1)) xor dots xor G(S_(n,1)) = G(S_(1,1)) = G(S_(m,1)) xor dots xor G(S_(n,1))$ 

$F(k, x_3) = G(S_(1,0)) xor dots xor G(S_(m,1)) xor dots xor G(S_(n,0))$ 

$F(k, x_4) = G(S_(1,1)) xor dots xor G(S_(m,0)) xor dots xor G(S_(n,1))$

We have $F(k,x_1) xor F(k,x_2) xor F(k,x_3) xor F(k,x_4) = xor.big_(i=1)^n xor.big_(j=0)^1 [G(S_(i,j)) xor G(S_(i, j))] = xor.big_(i=1)^n 0^m = 0^m$ since $xor$ is commutative \

Then, if some adversary $A$ querys an oracle on inputs $x_1, x_2, x_3, x_4$  where the oracle could be $F$ or $g in cal(G)_(n,m)$ then $A$ will know with probability $1 - 1/2^n$ that the oracle is $F$ if $F(k,x_1) xor F(k,x_2) xor F(k,x_3) xor F(k,x_4) = 0^m$, since $g$  outputs $0,dots,0 in {0,1}^m$ with probability $1/2^n$    

Specifically, applying the definition of pseudorandom functions, set $(dot) = (x_1, x_2, x_3, x_4)$ then we have \

$ | Pr[1 arrow.l A^(F(k, dot)): k unif {0,1}^lambda] - Pr[1 arrow.l A^(g(dot)): g unif cal(G)_(n,m)] | = \  | 1 - Pr[g(x_1) xor g(x_2) xor g(x_3) xor g(x_4) = 0] | = |1 - Pr[g(x_1) xor g(x_2) = g(x_3) xor g(x_4)] = \ |1 - Pr[z_1 = z_2 : z_1,z_2 unif {0,1}^m]| = |1 - 1/2^m| lt.eq.not "negl"(lambda) $ 

Therefore $F$ is not a secure pesudorandom function 


])

#pagebreak()

#prob([

Let $cal(F) = {f_k: {0,1}^n arrow {0,1}^m : k in {0,1}^lambda}$ be a class of functions such that for every $k in {0,1}^lambda$, $f_k$ is one-way and moreoever, $m < n$. Using $cal(F)$ design another function class $cal(F') = {f'_k:{0,1}^n arrow {0,1}^m : k in {0,1}^lambda}$ such that

1. for every $k in {0,1}^lambda, f'_k$ is a one-way function 

2. $cal(F')$ is not collision resistant 

],[])