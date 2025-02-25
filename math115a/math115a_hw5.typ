#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw5"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)

#env_headers.update("classic")
#env_colors.update("bw")

#prob([Suppose $f $ and $g $ are multiplicative functions. Prove that the function $F $ defined by $ F(n) = sum_(d divides n) f(d) g(n/d) $ is also multiplicative.],[

\ Let $n = a b$ then $ F(a b) &= sum_(d divides a b) f(d) g((a b)/d) 

 \ &= sum_(d_1 divides a, d_2 divides b) f(d_1 d_2) g((a b)/(d_1 d_2)) \ &= sum_(d_1 divides a, d_2 divides b) f(d_1) f(d_2) g(a/d_1) g(b/d_2) \ &= sum_(d_1 divides a) f(d_1) g(a / d_1) dot sum_(d_2 divides b) f(d_2) g(b/d_2)  = F(a) F(b) $ \

 By definition, "double for loop" to generate divisors, multiplicativity of f and g, comutativity, and definition respectively. $qed$   


])

#pagebreak()


#prob([(i) For each positive integer $n$, show that $mu(n) mu(n + 1) mu(n + 2) mu(n+3) = 0$ [Hint: What can you say about the four consecutive intgers $n, n+1, n_2, n_3$ modulo $4$ ? If you find yourself doing lots of algebraic manipulations to solve this problem, then you are almost certainly on the wrong track.] \ (ii) For any integer $n gt.eq 3$, show that $ sum_(k=1)^n mu(k!) = 1 $ ],[
\
(i) Looking at the table of values for $mu$, we can see that $mu(n) = 0$ if $4 divides n$ (this is true because $4 = 2^2$, a power of a prime ) \
This means that for any positive integer $n$ that at least one of $mu(n), mu(n+1), mu(n+2), mu(n+3)$ will be 0. Since at least one of $n, n+1, n+2, n+3$ will be divisible by 4 \

And the claim follows. \

(ii) 

$mu(1!) = 1$; $mu(2!) = -1$; $mu(3!) = 1$; \

Since for $n eq 4$ we have that $n! = 3! dot 4 arrow.double mu(n!) = 0$ 

And for $n gt.eq 5$ we have that  $n! = 3! dot 4 dot prod_(i=5)^n i arrow.double mu(n!) = 0$ (recalling the finding in the previous part) \

Therefore for $n gt.eq 3$ we have that $sum_(k=1)^n mu(k!) = 1 - 1 + 1 + 0 + dots + 0 = 1 qed$  




])

#pagebreak()

#prob([The von Mangoldt function $Lambda$ is defined by $ Lambda(n) = cases(log(p) "if" n = p^k "where" p "is prime and" k gt.eq 1, 0 "otherwise" ) $ Prove that $ Lambda(n) = sum_(d divides n) mu(n/d) log(d) = - sum_(d divides n) mu(d) log(d) $  [Hint: First show that $sum_(d divides n) Lambda(d) = log(n)$, and then apply the Mobius inversion formula. ]     ],[

\ Let $n = p^k$ then the divisors of $n$ are $1, p, p^2, dots, p^k$ and $sum_(d divides n) Lambda(d) = Lambda(1) + Lambda(p) + dots + Lambda(p^k) = 0 + underbrace(log(p)+dots+log(p) ,"k times") = log(p^k)$ \

In general, if the prime factorization of $n$ is $n = p_1^k_1 p_2^k_2 dots p_s^k_s$  then for each $p_i^k_i$ we have $sum_(d divides p_i^k_i) Lambda(d) = 0+underbrace(log(p_i) + dots + log(p_i),"k_i times") = log(underbrace(p_i dots p_i,"k_i times")) = log(p_i^k_i)$. Then taking the sum over $i=1, dots, s$ we have $ sum_(d divides n) Lambda(d) = log(n) =  sum_(i=1)^s  sum_(d divides p_i^k_i) Lambda(d) $ which proves the first equality by the definition of the mobius inversion formula \

If we try to apply the Mobius inversion formula we find that $ Lambda(n) = sum_(d divides n) mu(n/d) log(d) =sum_(d divides n) mu(d) log(n/d) = sum_(d divides n) mu(d) (log n - log d) = \ sum_(d divides n) mu(d) (log(n)) - sum_(d divides n) mu(d) log(d) = 0 - sum_(d divides n) mu(d) log(d) $ \

where the last equality holds since $sum_(d divides n) mu(d) = 0$ if $n > 1$ (from class)

If $n = 1$ then $Lambda(1) = 0$ and since $log(1) = 0$ (and 1 is the only divisor of 1) then the equality still holds.   \

It is not possible that $n < 0$ since $Lambda$ is defined over domain of positive integers  

 $qed$  


])

#pagebreak()
#prob([Let $n = p_1^(k_1)p_2^(k_2)dots p_r^(k_r)$ be the prime factorisation of an integer $n gt 1$. If $f $ is a multiplicative function that is not identically zero, prove that $ sum_(d divides n) mu(d) f(d) = (1 - f(p_1))(1-f(p_2)) dots (1-f(p_r)) $ [Hint: Use the fact that the function $F$ defined by $F(n) = sum_(d divides n) mu(d) f(d)$ is multiplicative (why is this so?), and is therefore determined by its values on powers of primes.  ] ],[

  \ Let $F$ be defined as in the problem statement  

 The result from problem 1 implies that $F$ is multiplicative. Therefore $F(p_1^k_1 p_2^k_2 dots p_r^k_r) = F(p_1^k_1) F(p_2^k_2) dots F(p_r^k_r)$ Also note that: \

    $ F(p_i^k_i) = sum_(d divides p_i^k_i) mu(d) f(d) &= mu(1) f(1) + mu(p_i) f(p_i) + mu(p_i^2) f(p_i^2) + dots+mu(p_i^k_i) f(p_i^k_i) \ &= 1-f(p_i) $ and the claim follows if $f(1) = 1$ 
    
    Which is true since $f(1 dot x) = f(1) f(x) arrow.double f(1) = 1$ (where $1$ is multiplicative identity for $ZZ$, $x in ZZ$    ) 
    
     $qed$ 
])
#pagebreak()

#prob([Let $n = p_1^(k_1)p_2^(k_2)dots p_r^(k_r)$ be the prime factorisation of an integer $n gt 1$. Use the result of Problem 4 above to establish the following: \ (a) $sum_(m divides n) mu(m) d(m) = (-1)^r$ \ (b) $sum_(d divides n) mu(d) sigma(d) = (-1)^r p_1 p_2 dots p_r$ \ (c) $sum_(d divides n) mu(d)/d = (1 - 1/p_1)(1-1/p_2)dots(1-1/p_r)$ \ (d) $sum_(d divides n) d mu(d) = (1 - p_1) (1 - p_2) dots (1 - p_r)$    ],[

\
(a) $sum_(m divides n) mu(m) d(m) = (1 - d(p_1)) (1-d(p_2)) dots (1 - d(p_r)) = underbrace((-1)dots (-1), "r times") = (-1)^r$ \

(b) $sum_(d divides n) mu(d) sigma(d) &= (1-sigma(p_1))(1-sigma(p_2) dots(1-sigma(p_r))  &= (1-(1+p_1))  (1-(1+p_2)) dots (1 - (1+p_r)) = (-p_1)(-p_2) dots (-p_r) = (-1)^r p_1 p_2 dots p_r$ \

(c) follows if we let $f(d) = 1/d$ (note that $f $ is multiplicative since $f(d_1 d_2) = 1/(d_1 d_2) = 1/d_1 (1/d_2) = f(d_1) f(d_2)$ 

in particular $sum_(d divides n) mu(d) f(d) = (1 - f(p_1))dots(1-f(p_r))=(1-1/p_1)dots(1-1/p_r)$ \

(d) follows if we let $f(d) = d$ since $sum_(d divides n) mu(d) f(d) = (1-f(p_1))dots(1-f(p_r)) = (1 - p_1) dots (1-p_r)$  

])

#pagebreak()


#prob([

Let $S(n)$ denote the number of square-free divisors of $n$. Show that $ S(n) = sum_(d divides n) |mu(d)| = 2^(omega(n)) $ where $omega(n)$ is the number of distinct prime factors of $n$     

],[

\ Let $n = p_1^k_1 p_2^k_2 dots p_r^k_r$  be the prime factorization of $n$ \

Then $ S(n) = sum_(d_1 divides p_1^k_1, dots, d_r divides p_r^k_r ) |mu(d_1 dots d_r)| $ \

Since $mu(n) = 0$ if $p^2 divides n$ for some prime $p$, then the only non zero terms in the above sum are when $d_1 dots d_r$ are distinct primes and/or any of $d_1 dots d_r$ are 1. If $mu(d_1dots d_r) eq.not 0$ if follows by definition that $|mu(d_1 dots d_r)| = 1$. Therefore we are counting the number of combinations of $d_1 dots d_r$ such that $mu(d_1 dots d_r)$ is non-zero     \

In other words, $mu(d_1dots d_r) eq.not 0$ if $d_1 dots d_r = (d'_1) dots (d'_r)$ where each $d'_i = 1$ or $d_i$ \

Therefore there are $2^r$ such combinations of choices for $d'_1 dots d'_r$ where $r$ is the number of distinct prime factors of $n$  $qed$    

])