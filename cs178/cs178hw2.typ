#import "@local/superTemplate:0.2.0": *
#import math_mod: *
#import cs_mod: *
#let date = datetime.today()
#show: assignment.with("CS178 Assignment 2", "Jonas Chen", date)

#env_headers.update("classic")
#env_colors.update("bw")

#prob([Let $f: {0,1}^lambda times {0,1}^n arrow {0,1}$ be a pseudorandom function. Show that there exists a pseudorandom generator $G: {0,1}^lambda times {0,1}^n' arrow {0,1}^m$, \ where $m gt n' + lambda$ and  $n'=n - ceil(log_2(m))$ and $n gt.eq ceil(log_2(m))$    ],[

\

Define $G$ over any choice of $lambda, n', m$ such that $m > n' + lambda$  as follows:

On input ($k in {0,1}^lambda$ ,$z in {0,1}^n'$ )

1: Compute $n = n' + ceil(log_2(m))$ \

2: Generate the first $m$ strings of length $n$ and denote them to be $x_1, x_2, dots, x_(m) = 0000,0001,dots,1111$ etc. 

Note that $m lt.eq 2^(ceil(log_2(m))) lt.eq 2^n$ (by the last condition in the problem statement) so that there are always sufficient amount of strings of length $n$ generated by the above   

3: output $f(k || x_1) || f(k || x_2) || dots || f(k || x_(m))$ \

Then $G$ is guaranteed to generate $m $ bits of output. \ 

Also, the third condition that $n gt.eq ceil(log_2(m))$ is satisfied based on the computation of $n$ above. (note that $n'$ can be $0$  )

$G$ will run in a time polynomial in $m$ and is determinstic since $f$ is determinstic \

We need to show that $G$ is a function that satisifes the definition of pesudorandom generators \

Let $G_(n,m) = {g: {0,1}^n arrow {0,1}^m}$ and let $g_(n,m) unif G_(n,m)$  be the family of random functions as defined in class.

By definition of pesudorandom functions we have that $"dist"{f}approx_c {g_(n,1)} approx_c {U_({0,1}^1)}$ since the random function $g: {0,1}^n arrow {0,1}$ simply samples from uniform distribution over the bits ${0,1}$ \

This means that each bit from the output of $G$ is computationally indistinguishable from a random bit, which further means that ${y=G(z) | z unif {0,1}^n} approx_c {y unif {0,1}^m}$  \

Therefore $G$ as constructed above is a pesudorandom generator $qed$   

Importantly, each call to $f$ is on a different input, if any two of the inputs are identical then those two bits would be distinguishable from uniform 2 bits (we showed this is important in class today (feb 19)) 

])

#pagebreak()

#prob([Let $f:{0,1}^n arrow {0,1}^m$ \

Suppose there is a binary string $y in {0,1}^m $ such that $ Pr[f(x)=y: x unif {0,1}^n] gt.eq 1/("poly"(n)) $ Note that the probability is taken over choice of $x $. Show that $f $ is not a one-way function.  ],[

\
Fix $x unif {0,1}^n$ and also fix $f(x) in {0,1}^m$ 

Consider an adversary $A$ which on input $f(x)$ outputs $s$ where $s unif {0,1}^n$ \

Then $A(f(x))$ is sampled uniformly from ${0,1}^n$ and since we know there exists $y$ such that $f(x) = y,$       $ Pr[f(A(f(x))) = y] gt.eq 1/"poly"(n) "and "\ "Pr"[f(x)=y] gt.eq 1/"poly(n)" "means that" \ Pr[f(x) = f(A(f(x)))] \ = "Pr"[f(x)=y] dot Pr[f(A(f(x))) = y] gt.eq 1/"poly"(n)^2 gt.eq "negl"(n) $ which shows that $A$ outputs a preimage of $f(x)$ with non-negligilble probability. (thus $f$ is not a one-way function.) \ $qed$   

])

#pagebreak()

#prob([Let $"PRG:" {0,1}^n arrow {0,1}^(2n)$ be a pesudorandom generator. Let $s unif {0,1}^n, r unif {0,1}^(m=2n) "and" y = "PRG"(s) $ Consider the following program $P_(r,y)$: \

1: On input $x in {0,1}^n $ check that $"PRG"(x) xor r = y$ \

2: If true; output 1 else output 0 

Show that there is no PPT adversary that, given $(r,y)$ outputs $x in {0,1}^n$ such that $P_(r,y) (x) = 1$ with non-negligilble probability. \

You have to show that for all PPT adversary $A$ with input $(r,y)$ and output $x in {0,1}^n$ that \

$ Pr[P_(r,y) (x) = 1 | x arrow.l A(r,y)] = "negl"(n) $ 
    ],[
\ 

Suppose that there $exists A$ such that $Pr[P_(r,y) (x) = 1 | x arrow.l A(r,y)] gt "negl"(n)$ \

Note that $Pr[P_(r,y)(x) = 1] = Pr["PRG"(x) plus.circle r = y]= Pr["PRG"(x)= r xor y]$

Note that all pesudorandom generators are one way functions (we will prove this later)

Consider another adversary $B$, which is defined as follows: \

$B$ on input $r xor y$: \

1: Set $"PRG"(x) := r xor y$ 

2: Outputs $x' arrow.l A(r,y)$ \

Then $Pr["PRG"(x) = "PRG"(x') = r xor y] = Pr[P_(r,y)(x') = 1] gt "negl"(n) $ due to the initial assumption \

Which contradicts the fact that $"PRG"$ is a one way function. (For any $r,y$ we have that an adversary that can generate an $x'$ such that $"PRG"(x') = r xor y$, note that $r xor y$ is a uniformly sampled string from ${0,1}^(2 n)$    ) \

Therefore $A$ cannot exist, as desired $qed$ 

Proof that pesudorandom generators are one-way functions: \

Assume that $G: {0,1}^n arrow {0,1}^(n+1)$ is a pesudorandom generator and is not a one way function i.e. \

$Pr[G(x) = G(x') | x' arrow.l A(G(x));x unif {0,1}^n] gt "negl"(n) $ \

Then consider a distinguisher $D$ that does the following: \

On input $z$, run $A(z)$ to try to generate an $x'$ such that $G(x') = z$ \

If $A $ runs sucessfully, output $1$, else output 0 \

$"Pr"[1 arrow.l D(z_1) | z_1 arrow.l {G(x)}] gt "negl"(n)$ by assumption, and \

$"Pr"[1 arrow.l D(z_2) | z_2 unif {0,1}^n] = "negl"(n)$ since $G$ is a pesudorandom generator  

Then $| "Pr"[1 arrow.l D(z_1) | z_1 arrow.l {G(x)} ] - "Pr"[1 arrow.l D(z_2) | z_2 unif {0,1}^n ] | gt "negl"(n)$ \

This leads to a contradiction that $G$ is not a pesudorandom generator. therefore $G$ must be a one-way function  $qed$ 



    ])
