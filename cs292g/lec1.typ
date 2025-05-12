#import "@local/superTemplate:0.3.0": *
#import "@local/superTheorems:0.1.0": *
#import math_mod:*
#import pstat_mod:*
#import cs_mod: *

#show: thmS-init.with(colors: "gruvbox_dark", headers: "classic")
#show: notes.with("Post Quantum Cryptography", "Spring 2025", depth: 3, continuous: true)

= Lecture 1

== Introduction

#note([Some general information],[
Google: willow quantum chip (superconducting qubits) \
Microsoft: Majorana 1 quantum chip (topological qubits) \
Jensen Huang: changed his mind on feasibility of quantum computers from infeasible to possibly feasible \
Shor's (efficient) algorithm: breaks integer factoring although not practical (requires millions of qubits) \
Want: cryptosystems using quantum-resistant mathematical assumptions \
Effort by NIST, post-quantum standardization \
Generally, we use a polynomial size quantum circuit to break a (classical) mathematical assumption \
Concern of "harvest now, decrypt later" (revealing ciphertexts may be risky) \
])

#note([Grading], [Grading will be based on class participation, assignments, and either scribing lecture notes OR research report])

#note([Examples of post-quantum cryptographic assumptions include SIS (short integer solutions), and LWE (learning with errors) \

These are lattice-based ("hard" problems in the classical sense which use lattices)
])

#concept([Short Integer Solutions],[

Suppose that $A in ZZ_q^(n times n)$ where $A$ is full rank \
Goal: find $x in ZZ^n$ such that $A x = 0$ \
Answer: set $x := 0 in ZZ^n$ where $Z^n$ denotes $n$-dimensional column vectors \
If we require that $x eq.not 0$ then $x$ cannot exist (full ranks implies invertibility / violates linear independence)

Suppose that $A in ZZ_q^(n times m)$ where $m >> n$ \

We split $A$ in the following way: $A = [overline(A) | A']$ where $A$ is $n times n$ and $A'$ is the rest of $A$ \

Consider the following cases: \

Case 1: the $n+1$ th column is all zero, then $x = vec(0,0,dots.v, 1, dots.v,0,0)$ where $1$ is in the $n+1$ th position   

Case 2: $overline(A)$ is full rank and the $n+1$ th column is non-zero. Then $x = vec(u, -1, 0, dots.v, 0)$ where $u in ZZ^n$ and the $n+1$th column is some $v in ZZ^n$ and such that $overline(A) u = v$    

Case 3: $overline(A)$ is not full rank. Then $exists u $ s.t. $overline(A) u = 0$ and $u eq.not 0$. Then $x = vec(u, 0, dots.v, 0)$     

In fact, if $m >> n$ then thare are many potential solutions. We are interested in finding $B$-short solutions. \

#defn([B short solutions], [We say that $u in ZZ^m$ is $B$  short if $||u||_infty lt.eq B$ where $|| dot ||_infty$ is the infinity norm: $"max"_i {|u_i|}$])
])

== Short Integer Solutions

#defn([$"SIS"_(n,m,B,q)$],[

given $A in ZZ_q^(n times m)$,

find $x in ZZ^m$ s.t. $A x = 0$; $x eq.not 0$ ; $||x||_infty lt.eq B$     

it is believed that any PPT adversary $cal(A)$ can find $x$ only with neglible probability

])

#prop([existence of $B$ short solutions ],[

Claim: if $m gt.eq 2 n log_2 (q)$ then $exists B$ short solutions  

],[

Note that the number of possible $B$ short vectors of dimension $m$ is at most $(2 B + 1)^m$ and the number of possible $n$ dimensional vectors over $ZZ_q$ is $q^n$, then 

$ (2B + 1)^m &< q^n \ m log(2 B + 1) &< n log(q) \ m &< ((n log(q))/log(2 B + 1)) $ which is a contradiction

(therefore there exists a solution)

])

#defn([Collision resistant hash functions (CRHF)],[For each $h_k in H = {h_k: {0,1}^m arrow {0,1}^n}$ where $m >> n$ it is hard to find $x,y $ such that $x eq.not y $ and $h_k (x) eq h_k (y)$ and $k unif {0,1}^l$ where $l$ is polynomial length (sometimes in the security parameter $lambda$ )])

#theorem([Collision Resistant hash function using SIS assumption],[

The following hash function is collision resistant: \

$h_A (x) = A x$ where $x in {0,1}^m$ and $A in ZZ_q^(n times m)$   

],[

Suppose that i.e. if $cal(A)$ knows $h_A$ then it can output $x,y$ such that $x eq.not y$ and $h_A (x) = h_A (y)$ 

Then we construct $cal(B)$ using $cal(A)$ such that $cal(B) $ breaks $"SIS"_(n,m,B,q)$ ; specifically, \

$cal(B) (A)$: \

1. run $A(h_A) arrow (x,y)$ and output $(x,y)$  

This satisfies all conditions to "break" "SIS" since 

$h_A (x) = h_A (y) arrow.double A(x-y) = 0$ \

$x eq.not y arrow.double x-y eq.not 0$ \

$||x-y||_infty = 1$

(note that $x,y$ are 0/1 vectors) 

])

#defn([inhomogenous SIS, (ISIS) ], [

It is "hard" for an adversary to find $x$ such that $A x = y$ given $y unif ZZ_q^m$ and $A$    

])

#note([ISIS combined with trapdoors can be used to construct digital signature schemes]) 

#defn([Trapdoor],[Let $A in ZZ_q^(n times m)$ then a trapdoor $T$ is such that $A T = 0$ and each column of $T$ is a $B$ short solution. Formally we defined the polynomial time algorithm \

TrapGen($1^n, 1^m, 1^q$): \ 

outputs $(A,T)$ subject to the above conditions. Additionally, $T$ is full rank over $RR$])

#note([Why over $RR$ specifically ],[Consider $M = mat(q+1, 1;q,0)$ then $det(M) = 0 mod q$ but $det(M) eq.not 0$ over $RR$]) 

= Lecture 2 Digital Signatures from I-SIS

#note([Recap: SIS and I-SIS],[

The following is a hard problem: given $A in ZZ_q^(n times m)$ where $m >> n$ and $m approx O(n log(q))$  find a short and non-trivial solution $x$ in the kernal of $A$ i.e. $A x = 0$ (SIS) \

SIS is conjectured to be secure against both classical PPT adversaries and quantum adversaries

Inhomogenous SIS: Given $(A,y)$ find short $x$ such that $A x = y$   

])

#note([Trapdoors and TrapGen],[

The following algorithm exists and runs in efficient(i.e. polynomial) time:

TrapGen($1^n, 1^m, 1^q, 1^B$ ): outputs $(A, T)$  such that $A in ZZ_q^(n times m)$ and $T in ZZ^(m times n)$ where the columns of $T$ are each $B$ short in the kernel of $A$, $A T = 0$ and $T$ is full rank over $RR$      
])

#defn([statistical distance (denoted approx_s) (??)],[

for a sample space $chi$ we say that distributions $D_1 approx_s D_2$ if $  1/2 sum_(x in chi) | Pr[x arrow.l D_1] - Pr[x arrow.l D_2] | lt.eq epsilon $    

])

#note([A nice property #1 about TrapGen],[

$D_1 approx_s D_2$ where $D_1 = {A; (A, T) arrow.l "TrapGen"()}$ and $D_2 = {A; A unif ZZ_q^(n times m)}$   

])

#note([TrapGen does not violate SIS since in SIS matrix $A$ is fixed ])

#note([A nice property #2 about TrapGen],[

given $(A, T, y)$ there exists an algorithm to find short $x$ such that $A x = y$ called $"PREIMAGESAMP"(A, T, y) arrow x$ \

Note that this does not violate I-SIS since the algorithm requires $T$ as an input 

])

#note([A nice property #3 about TrapGen],[

Consider $D_1$ and $D_2$ where \

$D_1: $ sample $A unif ZZ_q^(n times m)$ and generate short $x$ and set $y := A x$ then output $(A, x, y)$

$D_2 :$ sample $(A, T) arrow.l "TrapGen"$ and $y unif ZZ_q^(n)$ and find short $x$ using $(A, T)$ such that $A x = y$ and output $(A, x, y)$  (remember that we can do this since PREIMAGESAMP exists)   

])

#defn([Digital Signatures],[

setup: signing key sk and verification key vk \
sign(sk, $D$) generates signature $sigma$ on message $D$ \
verify(vk, $D, sigma$ ) generates VALID iff $sigma$ is valid on $D$ \

corectness: verify works
security: for any  PPT $cal(A)$ which quries $q$ signatures and outputs $ cal(A) ((D_1, sigma_1), dots, (D_q, sigma_q)) arrow (D^*, sigma^*) $ the following is true: $ Pr[D^* in.not {D_1, dots, D_q} and (D^*, sigma^*) "is VALID"] lt.eq "negl" $    \

(typically negligible in some security parameter used in the generation algo)
(note that signing key should not be revealed)

])

#concept([Digital Signature scheme from I-SIS ],[

in this case, out verification key vk = $A$ (the matrix) and the signing key sk is $T$ (the trapdoor) \

To sign some message $D$ we can perform the following steps: \

1. from $D$ determinstically derive $y in ZZ_q^n$ (shown below) 
2. find short $x$ such that $A x = y$
3. output $sigma = x$    

To verify a that $sigma$ is a valid signature on $D$: \
1. check if $A x = y$ and that $x$ is short (output VALID/INVALID accordingly)  

])

#defn([Formal Description of digital signature scheme (??)],[

note that in the below $H$ is a hash function $H: {0,1}^* arrow ZZ_q^*$  

setup: run TrapGen($1^n, 1^m, 1^q, 1^B arrow (A, T)$) and output vk $ = A$ and sk = $T$   

sign(sk, $D$ ): 

1. set $y:= H(D)$ and run PREIMAGESAMP(A, T, y) $arrow x$ and output $x = sigma$ 

verify(vk, $D, sigma$ ): \

1. set $y:= H(D)$ and check that $A sigma = y$ and that $sigma$ is short (output VALID/INVALID accordingly)

Corectness: trivially true \

Security: (use random oracle model) \

])

= Lecture 3: LWE and LWR

#note([Last time],[

Set the following: $A in ZZ_q^(m times n)$, $s in ZZ_q^n$, $e in ZZ_q^m$

If we are given $A$ and $A s$, we can solve for $s$ using guassian elimination. Note that since $ZZ_q$ is a field, all elements have an inverse. \

However, given $A s + e$ and $A$ it is conjecture to be "hard"to solve for $s$ \

Note also that we let $||e||_infty$ be small (say in poly(log(q))) 

])

#defn([SearchLWE(n,m,q, $chi$ )],[


Let $chi$ be some distribution, and $A unif ZZ_q^(m times n), s unif ZZ_q^n, e arrow.l chi^m$ then solving for $s$ given $A s + e$ is conjectured to be not possible any PPT algorithm as well as quantum adversaries.    

#note([If $chi^m$ is replaced with uniform distribution over $ZZ^m$ then $A s + e$ is uniformly random, therefore $A s + e$ does not depend on $s$ and therefore the probability of finding $s$ is $ 1/q^n $])

])

#defn([DecisionLWE(n,m,q, $chi$ )],[

let $(A, A s + e)$ be as above and denote thie distribution $D_1$ \

also, let the distribution $D_2$ be $(A, b)$ where $b unif ZZ_q^m$ (recall that $A$ is also unifromly sampoled) \

Then the following is true: $D_1 approx_c D_2$ for both PPT and quantum adversaries

If $s arrow.l chi^m$ then the above still holds 

])

#defn([public key encryption],[

Say that Alice wants to communicate wiht Bob, then Alice will send Enc(x, pk) to Bob using Bob's pk and Bob will decrypt the message with his sk

The algorithms are setup $arrow$ (pk, sk) $Enc(pk, x) arrow C$ and $Dec(C, sk) arrow x'$   

Corectness: $x = x'$ 

Security: ${Enc(pk, x_0)} approx_c {Enc(p_k, x_1)}$ 

(recall the chose a random bit game)

])

#defn([Oded Regev public key encryption scheme],[

Setup: sample $A unif ZZ_q^(m times n), s unif ZZ_q^n, e arrow.l chi^m$

let the public key pk be $overline(A) = [A bar A s + e]$ of size $(m times n+1)$ 

let the secret key sk be $s$ 

Enc(pk, $x in {0,1}$): (one bit)

Sample $r unif {0,1}^(1 times m)$

$ C = cases(r overline(A) "if" x = 0, r overline(A) + vec(0, dots.v, 0, floor(q/2))^T "if" x = 1) $

Dec (sk, $C$ ):

compute $ C dot vec(-s, 1) \ &= angle.l r overline(A) + x mat(0,dots,0, floor(q/2)), vec(-s, 1) angle.r \ &= r overline(A) dot vec(-s, 1) + x mat(0, dots, 0, floor(q/2)) dot vec(-s, 1) \ &= r dot e + x floor(q/2) $ 

We can note that some typical parameters ranges are $q = 2^lambda, n = poly(log(q)), m = n log(q), e = poly(log(q))$ \

Therefore we can reason that $||r dot e ||_infty lt.eq m dot ||e||_infty << q$ 

And so the decrypted bit will be $x' = 0$ if $C dot vec(-s, 1) lt.eq q/4$ and $x'=1$ otherwise

(recall the interval in the notes)
])

#prop([Security of Definition 3.0.6],[
  3.0.6 satisfied the security definition for general public key encryption in 3.0.6
],[

The proof uses the hybrid argument \

Let $H_1 = Enc(pk, 0)$ and $H_2 = r dot [A bar b]$ where $b unif ZZ_q^m$ then $H_1 approx_c H_2$ by the DecisionLWE assumption and the randomness of $r unif {0,1}^(1 times m)$

Let $H_3 = C unif ZZ_q^(1 times (n+1))$ by the fact ${(B, r B)} approx_c {B, u}$ where $B$ is size $m times n$ and $u$ is a random vector \

Here we can set $B := [A bar b]$ and $u := r$

Let $H_4 = C = C' + mat(0,dots,0,floor(q/2))$ where $C' unif ZZ_q^(1 times (n + 1))$ then $H_3 approx_c H_4$ by the randomness of $C'$

Let $H_5 = C = r dot [overline(A) bar b] + mat(0,dots,0,floor(q/2))$ and $H_6 = Enc(pk, 1)$ then $H_4 approx_c H_5 approx_c H_6$ by the randomness of $r$ and the definition of Enc(pk, 1)

])

#defn([dual regev public key encryption scheme],[

Setup $arrow (A, T) arrow.l "TrapGen"$ 

here we have $T A = 0$ and $A in ZZ_q^(m times n)$ and $T in ZZ^( m times m)$ (we can note that $T A =^? 0$ (??) ) 

Anways the public key is $A$ and the secret key is $T$ \

Encryption on a message $x$ outputs $C = A s + e + x mat(0, dots, 0, floor(q/2))^T$ 

Decryption: compute $T (A s + e + x mat(0, dots, 0, floor(q/2))^T) = T A s + T e + T x mat(0, dots, 0, floor(q/2))^T = 0 + "small" + vec(dots.v)$ \

So the decrypted bit will be 0 if the above value is approx 0 and 1 if $||("above")||_infty gt.eq q/4$ 

Corectness follows

Security follows a similar path to proposition 3.0.7

])

== LWR

#note([Intuition],[

recall that $A s + e$ mod $q$ is indistinguisable from unifromly random
suppose $q = 2^lambda$  and $chi$ be uniform over ${0, dots, 2^l}$ such that $l << lambda$ 

consider the binary representaiton of $A s + e$ then this implies that the least significant $l$ bits are jumbled

Learning with rounding simply discards these bits

])

#defn([rounding function $angle.right angle.right.rev : ZZ_p arrow ZZ_q$ ], [

$ angle.right angle.right.rev (x)_p = overline(x) / (q/p) mod p $ where $overline(x) = x mod q$

divide into $q/p$ size blocks

an alternative definition is $x p/q mod p$ 

can round up or down
])

= Lecture 4: LWR, PRF, reductions

#defn([LWR],[

$A unif ZZ_q^(m times n)$, $s unif ZZ_q^n$, $u unif ZZ_p^m$ with $p << q$

Claim: ${A, floor(A s )_p} approx_c {A, u}$

We will use the floor function to denote the rounding \

Note that the value rounded is at the $i$th block where each block is of size $q/p$ on the real line 

Interpretation: $floor(A s)_p$  drops least significant bits of $A s$ in the case that $p, q$ are powers of 2

])

#note([Fact 1],[

$floor(A s + e)_p = floor(A s)_p$ with high probability

])

#note([Fact 2],[

${floor(u)_p} approx_c {u'}$ where $u unif ZZ_q^m, u' unif ZZ_p^m$  

])

#defn([pesudorandom functions],[

A function $F: {0,1}^lambda times {0,1}^n arrow {0,1}^m$  is called pesudorandom if 

$ | Pr[1 arrow cal(A)^(F(k, dot)): k unif {0,1}^lambda] - Pr[1 arrow.l cal(A)^(g(dot)): g unif cal(F)] | lt.eq "negl" $

where $cal(F)$ denotes all functions from n bits to m bits 

#note([

PRF($k,x$) = PRF($k_1, x_1$) || PRF($k_2, x_2$) is not a pesudorandom function

where the key and input are split in half respectively \

This is due to $F$ being deterministic 

])

])

#notation([Typically, we write $u$ to be an element coming from the uniform distribution ])

#defn([Construction 1 of PRF using LWR],[

$ "PRF"(k,x) = floor("PRF"(k_1, x_1) dot "PRF"(k_2, x_2))_p (dagger) $

Conceptually we can think of $k in {0,1}^(2 lambda)$  and $x in {0,1}^(2 l)$ 

Let the output of $"PRF"(k_1, x_1)$ be $A$ and let the output of  $"PRF"(k_2, x_2)$ be $s$

Then from fact 2 from before we have that:

Case 1: fix $x_1$ then $ {(A, floor(A s_1)_p, dots, floor(A s_t)_p ) } approx_c {(A, u_1, dots, u_t} $

Case 2: fix $x_2$ then $ {(A_1, dots, A_t, floor(A_1 s)_p , dots, floor(A_t s)_p} approx_c {(A_1, dots, A_t, u_1, dots, u_t} $  

#theorem([$(dagger)$ is a PRF  ],[


Note the above implies that $ {floor("PRF"(k_1, x_1^((1))) dot "PRF"(k_2, x_2^((1))))_p, dots, floor("PRF"(k_1, x_1^((t))) dot "PRF"(k_2, x_2^((t))))_p} approx_c {u_1, dots, u_t} $ for queries $x^((1)), dots, x^((t))$  

])
])

#example([Recursive computation of 4.0.7 PRF],[

let the key be $k = {S_(i b)}$ for $i in 1, dots, l$ where $l$ is the input length and $b in {0,1}$ and $S_(i b) in ZZ_(q_0)^(n times n)$ 

Let $q_0 > q_1 > q_2 > dots $ such that each $q_i$ is "significantly" smaller than previous $q_i$ (e.g. $2^lambda, 2^(lambda/2), 2^(lambda/4),$ etc. )  

Let $x in {0,1}^8$ then $"PRF"_k (x) = $

$ floor(floor(floor(S_(1 x_1) dot S_(2 x_2) )_q_1 dot floor( S_(3 x_3)dot S_(4 x_4) )_q_1)_(q_2) dot floor(floor( S_(5 x_5) dot  S_(6 x_6))_q_1 dot floor(S_(7 x_7) dot  S_(8 x_8))_q_1)_q_2)_q_3 $ 
                                           

])

#defn([Construction 2 of PRF using LWR],[

Let the key be $k = {(A in ZZ^(m times n), {S_(i b)})_(i b)}$ where $S_(i b), i,b$ are the same as in 4.0.9 \

Then we define $ "PRF"(k, x) = floor(A dot prod_i S_(i x_i))_p $ 

We note the following for error matrices $E_i$ (which has small entries) :

$ floor(A dot prod_i S_(i x_i))_p approx_c floor((A + E_i) dot prod_i S_(i x_i))_p $  

Then it follows that $floor(A dot prod_(i=1) S_(1, x_i))_p approx_c  floor(A dot prod_(i=2) S_(2, x_i))_p approx_c dots approx_c floor(U)_p$ where $U unif ZZ_q^(m times n)$ 

])

== Reductions between SIS, LWE, LWR 

We now show some reductions between SIS, LWE, and LWR. Note the use of contrapositives.

#defn([Easy to Solve],[

A problem is easy to solve if there exists some adversary (classical or quantum) which can solve the problem in polynomial (or potentially subexpotential) time

#defn([SIS (search) is esasy],[

For $A in ZZ_q^(m times n)$ can efficiently find $x in ZZ_q^m$ such that $x^T A = 0$ where $x eq.not 0, ||x||_infty = "poly(log"(q)) << q$    

])

#defn([Decision LWE is easy],[

can efficiently distinguish ${(A, A s + e)}, {(A, u)}$ 

])

#defn([Search LWE is easy],[

given $(A, A s + e)$ cam efficiently find $s in ZZ_q^n$  

])

])

#theorem([if SIS is easy then decision LWE is easy],[

LWESolver($A,b$):

1. $x arrow.l$ SIS solver($A$)

2. If $|x^T b| < q/4$ then $b$ is from LWE sample else from uniform 

Case 1: $b = A s + e$ then $x^T (A s + e) = 0 + x^T e$ which is "small"

Case 2: $b$ is uniform then with constant probability $x^T b$ is not small  

])

#theorem([if search LWE is easy then decision LWE is easy],[

dLWE Solver (A, b):

  $s arrow.l$ sLWE solver(A, b)

  if $||b - A s||_infty$ is small then $b$ is from LWE
  else from uniform

  case 1: $b = A s + e$ then $||b - A s||_infty$ is always small

  case 2: $b$ is uniform (in the case that $m >> n$ ) 

  note the following: $ Pr[b = A s + e "for any" s in ZZ_q^n, e in [-B, B]^m] lt.eq 1/"poly" $

  this is because the number of possibilities of $A s + e$ are much smaller than the possibilities of $b$

  i.e. $q^n dot (2 B + 1)^m << q^m$ since $n log(q) + m log(2 B + 1) << m log(q)$ by $m >> n$ and $B << q$        

])

= Lecture 5: more reductions, lattices

#theorem([if decision LWE is easy then search LWE is easy],[

given $(A, A s + e)$ the goal is to find $s$ where $A in ZZ_q^(m times n), s in ZZ_q^(n), e in ZZ_q^(m)$

write $A$ in the following way (seperate out leftmost column): $ A = mat(a_1, arrow.l a'_1 arrow.r; dots.v, dots.v; a_m, arrow.l a'_m arrow.r) $  

then we can make a guess for $g in ZZ_q$ and sample $c_i unif ZZ_q$ \

Then the following is relevant: $ A s + e + g c = mat(a_1 s_1 + angle.l a'_1, s'_1 angle.r + e_1; dots.v; a_m s_1 + angle.l a'_m , s'_1 angle.r + e_m) + vec(g c_1 , dots, g c_m) $

We slo define $A' := A + mat(c_1, 0, dots, 0; dots.v, dots.v, dots.down, dots.v; c_m, 0, dots, 0)$ 

We can compute $alpha arrow.l "dLWE"(A', A s + e + g c)$

If $alpha$ is "LWE" then the guess g is correct, else the guess g is incorrect  

Consider the following cases:

Case 1: $g_1 = s_1$ (in general: $g_i = s_i$)

Then $ A s + e + g c = vec(a_1 s_1 + angle.l a'_1\, s'_1 angle.r + e_1 + c_1 s_1, dots.v) = vec((a_1 + c_1)s_1 + angle.l a'_1\,s'_1 angle.r + e_1, dots.v, ) = A' s + e $ which is a LWE sample

Case 2: $g_1 eq.not s_1$ (in general: $g_i eq.not s_i$ )  then $ A s + e + g c $ is uniform due to the uniformity of $c$

Note that we need to guess over all possible $s$ to obtain the answer, but do not need to also check every possible $e$  

])

#theorem([Wether $s$ in LWE comes from uniform or chi (small) distribution doesn't matter ],[

1: ${(A, A s + e)} approx_c {(A, u)}$ 

2: ${(A, A s + e)} approx_c {(A, u)}$ 

Theorem: if 2 is easy than 1 is easy 

(if 1 is hard then 2 is hard)

],[??])

#theorem([LWR is easy implies LWE is easy],[

  i.e. LWE is hard implies LWR is hard
],[

LWR: ${(A, floor(A s)_p)} approx_c {(A, u)}$ \

LWE: $(A, A s + e) approx_c {(A, u)}$

Note that ${(A, floor(A s )_p)} approx_s {(A, floor(A s + e)_p)} approx_s {(A, floor(u)_p)} approx_s {(A, u)}$

implies that ${(A, floor(A s + e)_p)} approx.not_s {(A, floor(u)_p)}$ 

])

== Lattices

#note([So far we have seen constructions of LWE, SIS< and LWR as well as reductions between them, as well as a few applications of these assumptions

They rely on average case assumptions which are stronger than worse case assumptions

But why do are these conjectured to be post-quantum secure?
])

#defn([Lattices],[

A lattice $cal(L)(u_1, dots, u_l) = {sum s_i u_i : s_i in ZZ}$ where $u_1, dots, u_l in RR^n$ are linearly independent (called the basis)

$cal(L)$ has rank $l$ and is a dicrete additive subgroup of $RR^n$ where $n$ is the dimension of $cal(L)$ (note that $n gt.eq l$ ) 

For example $L((0,1),(1,0))$ is a lattice and it has infinitely many bases 

])

#defn([Lattive basis characterization],[

Let $B_1, B_2$ be two matrices whose columns are two different bases of some lattive $cal(L)$

Then $B_1 U = B_2$  where $det(U) = 1$ \ $U$ is called "unimodular"  

])

#defn([Fundamental Parallelopiped], [

We denote the fundamental Parallelopiped as $cal(P) (u_1, dots, u_l) = {s_i u_i: s_i in RR; 0 lt.eq s_i lt.eq 1}$

Then $u_1, dots, u_l$ is a lattice iff $cal(P)(u_1, dots, u_l) sect cal(L)(u_1, dots, u_l) = {0}$  

])

#defn([shortest vector in lattice],[


Defined by $ lambda_1(cal(L)) = min_(v in cal(L) \\ {0}) ||v||_2 $  where the norm is a euclidian 2 norm

])

#defn([$lambda_i (cal(L))$],[

We define $lambda_i (cal(L)) := $ smallest $r$ such that some subset of $cal(L)$ contains $i$ l.i. vectors of norm $lt.eq r$     

])

#note([

$lambda_1, lambda_i$ are relative to the origin  

A "good lattice basis" means that this basis generates a lattie for which calculating $lambda_1$ is easy

A "bad lattice basis": cannot efficeintly calculate $lambda_1$ 

])

#defn([Coset of a lattice],[

Let $cal(L)$ be a lattice then coset of $cal(L) = {c + cal(L): v in cal(L)}$ for some $c in RR^n$ 

Note that if $c in cal(L)$ then $c + cal(L) = cal(L)$  

])

#defn([Dual Lattice],[

The dual lattice is denoted as $cal(L)^* = {w: angle.l w, v in cal(L)}$ where $w in ZZ$  and all $v in cal(L)$ 

])


#defn([Shorted vector problem],[

given basis $B$ of an $n$ dimensional lattice find $v in cal(L)$ such that $||v|| lt.eq gamma(n) dot lambda_1(cal(L))$

If $B$ contains the shortest vector then easy but $B$ can be any basis  

])

#defn([$"GapSVP"_(gamma)$ / $"ApproximateSVP"_(gamma)$ ],[


given basis $B$ of an n-dim lattice find $v in cal(L)$ such that $||v|| lt.eq gamma(n) dot lambda_1(cal(L))$   

The smaller the $gamma$ the harder this problem is to solve

In fact we believe the following results hold: \

$ 1 lt.eq gamma lt.eq 2^(log(n)^(1-epsilon)): "for some" epsilon "this is NP-Hard" $

$ 2^(log(n)^(1-epsilon)) lt.eq gamma lt.eq n^1.5: "this is in NP" sect "coNP" $ 

$ n^1.5 lt.eq gamma lt.eq 2^(n^delta) "for some" delta < 1 "assumptions is used to build cryptosystems" $

$ gamma lt.eq 2^(o(n)) "exists LLL poly-time algo to solve" $ 

])

#theorem([Hardness of $"GapSVP"_gamma arrow.double$ hardness of $"SIS"_(n,m,q,B)$ (intuition)],[

Here the setting is $m=poly(n) \ q gt.eq B dot poly(n)$ \ 
and $gamma = B dot poly(n)$  

],[

(intuitive idea of proof): use contradiction / contrapositive


Consider a random lattice point $v$ and some $i$ perturbations such that $u_i = v + e_i$ which generate $u_1, dots, u_n$ 


Also, consider $mat(arrow.t, arrow.t,,arrow.t;u_1, u_2, dots, u_n; arrow.b, arrow.b,,arrow.b) vec(r_1, dots.v, r_n) = 0$ as in the SIS problem \

our goal is to find $r_i in ZZ$ such that $sum_i r_i u_i = 0$ and at least one of $r_i eq.not 0$

In fact by our assumption we can find $r_1, dots, r_n$ and $ 0 = sum r_i u_i =  sum r_i v + sum r_i e_i = 0 $ Since $sum r_i v in cal(L) and 0 in cal(L)$ then this implies that $sum r_i e_i in cal(L)$ where $e_i$ are both $r_i, e_i$ are small (roughly)

So $sum r_i e_i in cal(L)$ is a solution to $"GAPSVP"_gamma$  

])

#defn([Discrete Gaussian function over $RR^n$ ],[

$ rho_s (x) = e^((- pi ||x||^2)\/s^2) $ where $x in RR^n$ 

The standard discrete gaussian is when $s = 1$ 

The continuous gaussian is derived by integrading $rho_s$ and is defined by 

$ (rho_s (x))/s^n $ 

])

#defn([Discrete Gaussian distribution],[


We paramterize this distribution with lattice $cal(L) subset.eq RR^n$ and "width" $s$ as well as $c in RR^n$ and define $ cal(D)_(c, cal(L), s) = cases(rho_s (x) "if" x in c + cal(L), 0 "otherwise")  $     

For example, if $c = 0$ then points furthere away from the origin have less likelihood of being sampled 

])

#problem([Given basis $B$ which generates $cal(L)$ how to (efficiently) sample from $cal(D)_(c, cal(L), s)$ ?   ],[

Not really given in the lecture

However it was mentioned that setting $s$ to "larger" values creates a distribution that is more "spread out or closer to uniform" (making it easier to sample from) 

For sufficiently small values of $s$ we cannot efficeintly sample by the $"GapSVP"_gamma$ problem 

])

#theorem([Hardness of $"GapSVP"_gamma arrow.double$ Hardness of $"decisionLWE"_(n,m,q,chi)$ (rough idea)],[


We set the following paramterization: $m = poly(n); q lt.eq 2^(n^0.99); gamma = O^tilde (n/alpha), s = alpha q > sqrt(2 n)$ 

The general concept is to keep sampling from $cal(D)_(cal(L), s_i)$ where smaller and smaller values of $s_i$ which is possible by assumption

We went over a quantum algorithm which is considerably complex

])

= Lecture 6

#note([Lecture 6 covered 5.1.5 to 5.1.16])

= Lecture 7 (online)

#note([Monday’s lecture: https://drive.google.com/file/d/1rXsNm-CpNMaq1TxN3Le-dTIffv7_Tf1A/view?usp=drive_link])

= Lecture 8 (youtube)

#note([
Wednesday’s lecture: https://www.youtube.com/watch?v=Lo-_ZBqGa7I&t=3790s (this lecture is by Chris Peikert who is one of the experts on lattices in general and ring LWE in particular)])

= Lecture 9 - Insecure Ring-SIS

#note([Recap],[

Topics recalled: SIS, decision LWE, search LWE hard implies decision LWE hard, LWE is equally hard whether $s unif ZZ_q^n$ or $s unif chi^n$, SIS hardness and LWE hardness via computational problems over lattices ($"GAPSVP"_gamma$ )

Additionally, recall that the distribution $chi$ can be thought of as a discrete gaussian distribution

We also recalled a SIS-based hash function where $A in ZZ_q^(n times m)$ and $h_A (x) = A x$ where $x in ZZ_2^m$

If $m = O(n log(q))$ then the storage cost (in bits) will be $m n log(q) = n^2 poly(log(q))$

and the computational cost will be $m n log(q) = n^2 poly(log(q))$ since finite field addition and multiplication typically take $poly(log(q))$ time  

our goal will be to define a more efficient hash function
])

#definition([Structured matrices $X, X^2, dots$ generate a lattice which is isomorphic to univariate polynomial quotient rings],[

Suppose that $A in ZZ_q^(n times m)$  and that the first column of $A $ is $vec(a_1, dots.v, a_n) unif ZZ_q^n$

We define $A$ pictorally: $A = mat(a_1, a_n, a_(n-1), a_(n-2), dots; dots.v, a_1, a_n, a_(n-1), dots; dots.v, dots.v, a_1, a_n, dots; dots.v, dots.v, dots.v, a_1, dots;dots.v, dots.v, dots.v, dots.v, dots; a_n, a_(n-1), a_(n-2), a_(n-3), dots)$ 

As we can see the columns of $A$ are generated by permutations of the first column, which means that $A$ can has storage cost $n log(q)$ ($A$ can be reduced to a "short description" )

Observe also that the first column of $A_1 = I vec(a_1, dots.v, a_n)$

Second column is $A_2 = mat(0, dots, 0, 1; 1, dots, 0, 0; 0, 1, dots, 0; 0,0, dots.down, 0; 0,0, dots, 1) = X vec(a_1, dots.v, a_n)$ 

Similarly, the third column of $A$ is $X^2 vec(a_1, dots.v, a_n)$ and the $i $th column of $A$ is $X^(i-1) vec(a_1, dots.v, a_n)$    

In fact, we can write $A$ as $a_1 I + a_2 X + a_3 x^2 + dots + a_n X^(n-1)$ 

Then can define $I, X^1, X^2, dots, X^(n-1)$ to be a basis which generates the lattice $cal(L)_("str") = {sum_(i=1)^n a_i X^(i-1): a_i in ZZ}$ 

This means $A in cal(L)_("str")$ and we can create an isomorphism from $cal(L)_("str") arrow.long.l.r ZZ[x]$ (the univariate polynomials with coefficients from $ZZ$)

$Z[X]$ forms a ring, allowing us to inherit some nice algebraic properties (of rings)

However, the above isomorphism is not entirely correct. Since $X^n = I$ we have $x^n = 1 arrow.double x^n - 1 equiv 0$ so we will need to modulo by $x^n - 1$ to form the quotient ring $ZZ[x]\/ (x^n -1) = {sum_(i=0)^(n-1) alpha_i x^i: alpha_i in ZZ}$ (these are the remainders of $ZZ[x]$ when divided by $x^n -1$  )

the isomorphism is the map $phi.alt(X^i) = x^i$

#notation([

We denote $ZZ[x] \/ (x^(n-1),q)$ to be the set of all degree $d$ polynomials with coefficients in $ZZ_q$ and the polynomials are modulo $x^(n-1)$   

])

#example([

Working modulo $x^n - 1$  we have $x^(n+1) = x (x^n -1) + x equiv x$ 

])

])

#defn([New Hash Function],[

We modify our original hash function $h_A (y) = A y$ to instead be $h_A (M_y) = A M_y$ where $M_y$ is size $m times m$ and has short entries, and in addition $A, M_y in cal(L)_("str")$

Further we would like to work with polynomials, so we map $A arrow.l.r P_A$ and $M arrow.l.r P_M$ and the definition of the hash function becomes $h_A (M) = (P_A) (P_M) mod (q, x^n - 1)$

Then the runtime is $n^2 poly(log(q))$ with naive algorithm but $n poly(log(q))$ using FFT  

We can also define $P_A^(1) dots P_A^(l)$ to be the key of hash function then we can have hash function definition $sum_(i=1)^l P_A^(i) P_M^(i)$ where the $P_M^(i)$ again have short entries  and the runtime will still be $n poly(log(q))$ if $l = poly(log(q))$  

The security of this hash function follows as long as ring SIS holds and we pick the right quotient ring

])

#defn([Ring SIS (insecure version)],[

Let $p_1, dots, p_l unif ZZ_q [x] \/ x^n - 1$  and $q_1, dots, q_l arrow.l chi$ 

We denote $chi$ to be a distributino over $ZZ_q [x] \/ x^n - 1$ where the coefficients are small

Problem: given $(p_1, dots, p_l, r)$ find $q_1, dots, q_l$ such that $sum p_i q_i = r mod(q, x^n -1)$    

])

#theorem([Definition 9.0.6 is not secure],[

Intution: $x^n - 1$ is factorable

#lemma([high chance of factorability of],[

pick a random $p$ from $ZZ_q [x] \/ q, x^n - 1$ then the probability that $(x-1)$ divides $p$ is $gt.eq 1\/q$      

],[

(roughly)

if $p = (x-1) (sum_(i=0)^(n-1) alpha_i x^i) = (x-1)(alpha_0 + alpha_1 x_1 + dots + alpha_(n-1) x^(n-1)) = (alpha_(n-1) - alpha_0) + (alpha_1 - alpha_2)x + (alpha_2 - alpha_3) x^2 + dots$

Then the probability that the sum of coefficients of $p$ is $0 mod q$ is $1\/q$   

])

Note that if we pick a random $p$ as in the above lemma then $ p(1+x+x^2+dots+x^(n-1)) = q (x-1) (1+x+x^2+dots+x^(n-1)) = 0 mod (q, x^n - 1) $   

Then the following attack is possible when $r = 0$ :

Given $p_1, dots, p_l$ find one $p_i$ such that $(x-1)$ divides $p_i$

Set $q_i = 1 + x + x^2 _ dots + x^(n-1)$ 

Set $q_j = 0 forall j eq.not i$ 
])

= Lecture 10: ring LWE priv/pub encryption, code based assumptions and error correcting codes

#defn([Rings SIS ("regular")],[

find $q_1, dots, q_l$ such that $sum p_i q_i = 0$ given $p_1, dots, p_l$ where $q_1, dots q_l $ must have small coefficients   

])

#note([In fact the hash function from 9.0.5 is secure even if only regular SIS is secure

If the hash function is not secure then an efficient adversary $cal(A)$ can find $q_1, dots, q_l$ and $q'_1, dots, q'_l$ that both multiply to with the $p$'s to equal $r$ 

Then a solution to ring SIS regualr would be $q_1 - q'_1, dots, q_l - q'_l$ 

])

#defn([lattice generate by $ZZ_q [x] \/ x^n + 1$ ],[

We define the matrix $X' = mat(0,0,dots, 0, -1;1,0,dots, 0,0; 0,1, dots, 0,0; dots.v, 0, dots.down, 0, 0; dots.v, 0, dots, 1, 0)$ 

and the new lattice $cal(L')_("str")$ to be generated by basis $I, X', (X')^2, dots, (X')^(n-1)$  


])

#defn([Ring LWE],[

$a_1, dots, a_l unif ZZ_q [x] \/ x^n +1$ 

set $b_1, dots, b_l$ where $b_i := a_i s + e_i mod (q, x^n + 1)$

where $s arrow.l chi, e_i arrow.l chi$ where $chi$ is a distribution over polynomials with small coefficients in $ZZ_q [x] \/ x^n + 1$    

])

#defn([Private Key Enc using ring LWE],[

Gen: $s arrow.l chi$ \

Enc$(s, mu in {0,1}):$

if $mu = 0$ then output $(a, a s + e)$where $a,e$ as above

if $mu = 1$ then output $(a, "uniform")$

Dec$(s, c):$

parse $c = (a,b)$

compute $b - a s mod(q, x^n + 1)$

if all coefficients of $b - a s$ are small then output $mu = 0$ else output $mu = 1$   

security follows by ring LWE hardness

])

#defn([Public Key Enc using ring LWE],[

Gen: $s arrow.l chi, a' arrow.l ZZ_q [x] \/ x^n + 1, e arrow.l chi, y = a' s + e mod(q, x^n + 1)$

set public key to be $(a', y)$ and secret key to be $s$

Enc:$((a', y), mu in {0,1}):$

1. $r arrow.l chi, e' arrow.l chi, e'' arrow.l chi$
2. set $a := a' r + e' mod(q, x^n + 1)$
3. set $b := y r + e'' + floor(q/2) mu mod(q, x^n + 1)$   
4. output $(a,b)$

Dec:$(s,(a,b)$

Observe that $b = (a' s + e) r + e'' + floor(q/2) mu = a' r s + e r + e'' + floor(q/2) mu$

$a s = a' (r s) + (e' s)$ 

then $b - a s = "small" + floor(q/2) mu mod(q, x^n+1)$

This implies if all coeffeicient of $b - a s$ small then $mu = 0$ else $mu = 1$    

Security: invoke ring LWE assumption

])  

#defn([prisoner's game],[

7 prisoners are each assigned a hat with half probability each of bein red or blue

prisoners can guess if they are wearing red, blue, pass

win if nobody answers wrong AND at least one prisoner doesn't answer pass

])

== error correcting codes

(skip)

= Lecture 11: Learning Parity with noise/error correcting codes, Peikert

(skip due to midterm)

= Lecture 12: LPN based hash functions, cryptographic group actions 

#defn([Hash function (LPN)],[

We defined a collision resistant hash function using a expand then compress approach

Conceptually, we take a vector and "sparsify" it using a function expand($y$) $arrow z$ where $y,z$ are binary vectors

If $n$ is a security parameter then we divide $y$ into blocks of size $L = o(log(n))$ and expand each of these blocks into a corresponding block of $z$ of size $2^L$. The result is the expansion of the size of $y$, and both $y$ and $z$ have the same number of blocks 

Speficially, each block in $z$ is a "one-hot" vector with a $1$ in position $i$ where $i$ is the integer representation of the corresponding block in $y$

Then, for a hash key $M in ZZ_2^(n times q)$ we define the hash function $ h_M (x) = M dot "expand"(x) $ where $q>k>n, x in ZZ_2^k, "expand"(x) in ZZ_2^q$  

Recall that hash functions are typically length reducing

])

#prop([Security of 12.0.1],[

We claim that ${h_M}$ is collision resistant 

],[

Suppose on the contrary that ${h_M}$ is not collision resistant

Then there exists an efficient adversary $cal(A)$ such that $cal(A)(h_M) arrow (y, y')$ such that $y eq.not y'$ and $ h_M (y) = h_M (y') arrow.double M dot "expand"(y) - "expand"(y') = 0 $

Goal: design a PPT $cal(B)$ which distinguishes  ${M^T, s M^T + e}$ and ${(M^T, u)}$  (recall the definition of decision LPN)

Let $v$ be either a LPN sample of a uniform sample 

We define $cal(B)$ as follows:

$cal(B)(M^T, v)$:

1. $(y, y') arrow.l cal(A)(h_M)$

2. compute $v dot ("expand"(y) - "expand"(y'))$  (here the $dot$ denotes inner product)

Case 1: if $v$ is uniform then $ Pr[v dot ("expand"(y) - "expand"(y')) = 0] = 1/2 $  

Case 2: if $v$ is a LPN sample then $v$ has the form $s M^T + e$ then $ v dot ("expand"(y) - "expand"(y')) &= \ s M^T + e ("expand"(y) - "expand"(y')) &= \ 0 + e dot ("expand"(y) - "expand"(y'))  $ 

Then roughly speaking (details were skipped in lecture) due to sparness we have $ Pr[e dot ("expand"(y) - "expand"(y')) = 0] >> 1/2 $

If we run $cal(B)$ some $n$ times on inputs $v_1, dots, v_n$ then the expected value is $ theta := EE_i [v_i dot ("expand"(y) - "expand"(y'))] $

So if $theta gt.eq n/2 - 1/poly(n)$ then output "uniform" otherwise output "LPN"  

])

== cryptographic group actions

#defn([cryptographic group action],[

For a group $G$ and a set $X$, a mapping $star: G times X arrow X$ is is said to be a group action if $forall g,h in G, x in X$ the following holds: $ g star (h star x) = (g h) star x $

(we notably skip the identity axiom where $e star x = x$ for all $x in X$ and identity $e in G$)

])

#example([group action],[

The mapping $star: ZZ_q times G arrow G$ defined by $x star g = g^x$   

Where $(ZZ_q, +)$ is the group

this looks a lot like discrete log (this is insecure against quantum adversaries)

])

#note([
quantum resistant cryptographic constructions/assumptiosn often rely on $X$ having little algebraic structure 
])

#defn([regular group actions],[

a group action $star: G times X arrow X$ is regular if the mapping $f_x: g arrow g star x$ defines a bijection between $G$ and $X$    

])

#defn(['effective group actions' (EGA)],[

the following algorithms should be efficient:

membership testing in $G$

equality testing in $G$

sampling from $G$

group operation and inversion in $G$

membership testing in $X$

for all $x in X$ $x$ is uniquely representable

exists "origin" $x_0 in X$

groups action operation

])

We define some hardness asumptions for effective group action (EGA)

#defn([One-way EGA],[


Given a pair $(x, g star x)$ where $x unif X$ and $g unif G$ there is no PPT adversary $cal(A)$  that can recover $g$     

$cal(A)$ is implicitly given $f_x$ since we assume that $f_x$ is efficiently computable/implementable   

])

#defn([Weak Unpredictable EGA],[

Given poly many tuples of the form $(x_i, g star x_i)$ where $g unif G$ and each $x_i unif X$ there is no PPT adversary that can comput $g star x^*$ for a given challenge $x^* arrow.l X$

This is implied from One-way EGA

])

#defn([Weak Pseudorandom EGA],[

there is no PPT adversary that can distinguish tuples of the form $(x_i, g star x_i)$ from $(x_i, u_i)$ where $g unif G$ and each $x_i, u_i unif X$      

])

#defn([Pesudorandom functions from EGA],[


Let the key $k$  be $(g_0, g_1, dots, g_l) unif G$ 

and let the input $x$ (a bitstring) be of the form $(s_1, dots, s_l)$   

let $x_0$ be the "origin" of $X$

then we define the pesudorandom function $ F(k,x) = (g_0 prod_(i=1)^l g_i^(s_i)) star x_0 = g_0 star (g_1^s_1 star (g_2^s^2 star dots (g_l^(s_l) star x_0))) $ 

where the second equality holds by the condition for a group action (12.1.1) and the implicit assumption that $G$ is abelian, and denote $g_i^0 = e$ where $e$ is the identity of $G$
])

#prop([proof of security of 12.1.9 in the simple case],[

the function $F(k,x)$ as defined in 12.1.9 is secure if adversary $cal(A)$ makes the all ones query $x = 11 dots 11$ i.e. $F(k,11 dots 11) approx_c u$ where $u unif X$   

],[

Follows by a natural hybrid argument and 12.1.8 i.e.

$ g_0 star (g_1 star (g_2 star dots (g_l star x_0))) &approx_c \ g_0 star (g_1 star (g_2 star dots (u_l))) &approx_c \ dots.v &approx_c \ g_0 star u_0  $

where $g_0 star u_0$ is uniform on $X$  

])

#defn([Public Key Encryption from EGA],[

We define a public key encryption scheme as follows:

Let $s arrow G$ and $x unif X$

The public key is $(x, overline(x))$ where $overline(x) = s star x$

The secret key is $s$

Encryption on a bit $b in {0,1}$ is split in two cases:

If $b = 0$ output $(r star x, r star overline(x))$

If $b = 1$ output $(r star x, u)$ where $r unif G, u unif X$ 

Decryption can be done by checking one of the following two conditions on the parsed cipher text $(c_1, c_2)$: 

$s^(-1) star c_2 =^? c_1$ or $s star c_1 =^? c_2$

If either of these conditions holds, then output 0 otherwise output 1

This is because in the case that $x=0$,  $s^(-1) star c_2 = s^(-1) star r star s star x = (s^(-1) s) star r star x = r star x = c_1$

additionally, $s star c_1 = s star r star x = r star s star x = r star overline(x) = c_2$

($G$ is once again implicitly abelian)  

Then corectness follows

])

#prop([security of 12.1.11],[

If $c$ is a ciphertext output by the encryption algorithm in 12.1.11, then $("pk", c) approx_c ("pk", "uniform")$ i.e.

$ {(x, s star x, r star x, r s star x)} approx_c {(x, s star x, r star x , u)} $ where $u unif X$

Since $r,x, s star x$ are known parameters then this proof simplifies to showing that ${(r s star x)} approx_c {u}$  

It follows by 12.1.8

])