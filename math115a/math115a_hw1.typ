#import "@local/superTemplate:0.1.3": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw1"
#let author = "Jonas Chen"
#let date = datetime(year: 2024, month: 1, day: 8)
#show: assignment.with(title, author, date)

#prob(
  [(i) Suppose that $n > 1$ is a composite integer, with $n = r s$, say. Show that $2^n - 1$ is divisible by $2^r - 1$.
    (This shows that $2^n - 1$ is prime only if $n$ is prime. Primes of the form $2^n - 1$ are called Mersenne primes.) \

    (ii) Show that if $2^k + 1$ is prime, then $k$ must be a power of 2. (This explains why Fermat only had to consider
    numbers of the form $f_n = 2^(2^n) + 1$ (using the notation described in class) when he was hunting for primes, rather
    than more general numbers of the form $2^k + 1$ for an arbitrary positive integer $k$. ],
  [

  (i) Want to show that $2^(r s) - 1$ is divisible by $2^r -1$ where $n = r s$ \

  To do this, we can see that $ 2^(r s) - 1 = 2^(r(s)) - 1^1 $ this construction allows us to use the difference of powers of formula:  \

  $ 2^(r(s)) - 1 = (2^r -1)[(2^r)^(s-1) + dots + 2^r + 1] $ \

  therefore $2^n - 1$ is divisible by $2^r -1$ $qed$

  (ii) We want to show that if $2^k + 1$ is prime then $k$ must be a power of 2 \

suppose that $k$ cannot be divisible be an odd prime $p$ (and is therefore not a power of 2) so that $k = m p$   \

then it holds that $2^k + 1 = 2^(m p ) + 1 =  (2m + 1)(1 − 2
^m + 2^(2m) − ... + 2^((p−1)m))$ (geometric series expansion) \

which means that $2^k + 1$ is divible by some (2m + 1) and is therefore composite, leading to a contradiction. \

therefore in order for $2^k + 1$ to be prime $k$ must be a power of 2.  $qed$

  ],
)
#prob(
  [The Fibbonaci sequence $(F_n)_(n gt.eq 1)$ is defined recursively by the equations $F_1 = 1$, $F_2 = 1$, and $F_(n+1) = F_n + F_(n-1)$ for $n gt.eq 2$.
    \ Let $alpha$ be any real number larger than $beta = 1/2 (1 + sqrt(5))$. Prove by induction or otherwise that, for $n gt.eq 1$, $F_n lt alpha^n$.
    [Hint: You may find it helpful to note that $beta$ is a solution of the equation $x^2 = x + 1$ ] ],
  [

  For the base cases n=1 and n=2 we can observe that $ F_n = F_1 = f_2 = 1 < beta^1 = 1/2 (1+sqrt(5)) approx 1.6 < alpha^1 $ \

  For the inductive hypothesis, assume that $F_n lt alpha^n$ for some $n lt.eq k$ \

  Then $F_(k+1) = F_k + F_(k-1) < alpha^k + alpha^(k-1) < alpha^(k-1)(alpha + 1) < alpha^(k+1)$ where the last statement comes from the fact that $ beta^2 = beta + 1 arrow.double alpha^2 > alpha + 1 arrow.double alpha^2 alpha^(k-1) > alpha^(k-1) (alpha+1) equiv alpha^(k+1) >  alpha^(k-1) (alpha+1) $ \

  Therefore the claim holds (by induction). Since we proved the base case $k=1$ as well as all $k+1$ \
$qed$
  ],
)
#prob([

  Prove that for $n gt.eq 1$, $ sum_1^n m = 1/2 n(n+1)$ \

], [

Since $m$ is not defined, we can reformulate the problem and get a solution using induction. \

Reformulate the problem to the following: \

Prove that for $n gt.eq 1$, $ sum_(i=1)^n m_i = (n(n+1))/2 $ where $m_i = i$ \

For the base case $n = 1$ we can observe that 1 = (1(1+1))/2 = 1 \

For the inductive hypothesis assume that the claim holds for some $n = k$. \

Then $ sum_(i=1)^(k+1) m_i = sum_(i=1)^k m_i + (k+1) = (k(k+1))/2 + (2(k+1))/2 = (k^2 + 3k + 2)/2 = ((k+1)(k+2))/2 $
$qed$
])
#prob(
  [Suppose that $n$ pairs of gloves of different sizes are mixed together in a drawer. How many individual gloves must you
    take out if you are to be sure of having at least one complete pair. (justify your answer) ],
  [

    $n+1$ pairs is the minimum to ensure having at least one complete pair. \ If we draw $n$ gloves, they may be all distinct in the worst case (one glove from each of the $n$ pairs). However, the next glove must form a complete pair, \

  ],
)
#prob(
  [prove that the integer $n = 2^10 (2^11 -1)$ is not a perfect number by showing that $sigma(n) eq.not 2n$. [Hint: $2^11 -1 = 23 times 89$ ]
  ],
  [

Firstly, we know that if $2^n - 1$ is prime then $2^(n-1)(2^n - 1)$ is a perfect number. It is known that there exists a one-to-one mapping between mersenne primes of the form $2^n - 1$ and the corresponding perfect number $2^(n-1) (2^n - 1)$ by the Euclid–Euler theorem. Since $2^11 - 1$ is not a mersenne prime (it's not prime), then it follows that $n$ is not perfect. \ 

Alternatively, it is known that $sigma(m n) = sigma(m) sigma(n)$ so long as $m$ and $n$ are coprime. \

Since $2^10$ is a power of $2$ this means that all of its divisors must also be powers of $2$ or 1 (since $2^10 = underbrace(2 dot 2, "10 times")$ ). \

The other number, $2^11 - 1 = 23 times 89$. Therefore $2^10$ and $2^11-1$ are coprime (23 and 89 do not have 2 as a divisor.) \

Next, $ sigma(2^10 (2^11 - 1)) = sigma(2^10) sigma(2^11 -1) = (2^(10+1) - 1) sigma(23 times 89) = (2^11 - 1)(24)(90) $ where we use the fact that $sigma(2^n) = 2^(n+1) - 1$. Also, since 23 and 89 are prime they are also coprime. \

On the other hand, $2n = 2 times 2^10 (2^11 - 1) = 2^11 (2^11 -1) eq.not (24 times 90)(2^11 -1) = sigma(n) $

$qed$

  ],
)

#prob([Verify each of the following statements: \

  1. No power of a prime can be a perfect number

  2. The product of two odd primes is never a perfect number], [

1. Let $p$ be a prime. We want to see if $p^k = sigma(p^k) = 1 + p + p^2 + dots + p^(k-1) = 1 + p(1+p+dots+ p^(k-2))$. \

But since $p^k$ is divisible by $p$ but $1 + p(1 + p + dots + p^(k-2))$ is not, $p^k eq.not 1 + p + p^2 + dots + p^(k-1)$ implies $p^k$ is not perfect.  \ 

Note that the definition of $sigma(n)$ for this subproblem does not include $n$ itself in the sum, and that prime numbers must be greater than 1. \
$qed$
b. By the euclid-euler theorem, a perfect number must be en even number multiplied by an odd prime number (2 is not a mersenne prime), which proves the claim. \

Alternatively, let $p_1, p_2$ be both odd and prime. Then we want to see (or show) that $2 p_1 p_2 = sigma(p_1 p_2)$, supposing this is true for the sake of contradiction. \

Note that $p_1, p_2$ are coprime therefore $ sigma(p_1 p_2) = sigma(p_1) sigma(p_2) = (p_1 + 1)(p_2+1) = p_1p_2 + p_1 + p_2 + 1 $ \

Equivalently, if we exclude $p_1p_2$ from the sum of divisors we can see if $ p_1 + p_2 + 1 = p_1p_2  $ But if this is true then $p_1p_2 - p_1 - p_2 + 1 = 2 = (p_1 - 1) (p_2 - 1)$ \

But since $p_1, p_2 gt.eq 3 arrow.double (p_1-1)(p_2-1) gt.eq 4 gt 2$ which is a contradiction. $qed$


  ])
#prob([1. If $n$ is a perfect number, prove that $sum_(d|n) (1/d) = 2$
  2. Show that no proper divisor of a perfect number can be perfect.], [

a. 
Note that
$sigma(n) = 2n arrow.double sigma(n)/n = 2$ \

and that $sigma(n)/n = sum_(d divides n) d/n = sum_(d divides n) (1/d)$ \







2. Note that all known perfect numbers are composite \

Therefore if we have some proper divisor $i$ of a perfect number $n$ then using part (a): \

$2 = sum_(d divides n) (1/d) > sum_(d divides i) (1/d)$ which implies that $i$ is not perfect. 



  ])
#prob(
  [If $sigma(n) = k n$ where $k gt.eq 3$, then the positive integer $n$ is called a k-perfect number. Establish the
    following assertions concerning k-perfect numbers: \
    (a) If n is a 3-perfect number, and 3 $divides.not$ n, then 3n is 4-perfect. \
    (b) If n is a 5-perfect number, and 5 $divides.not$ n, then 5n is 6-perfect. \
    (c) If 3n is a 4k-perfect number, and 3 $divides.not$ n, then n is 3k-perfect. ],
  [

  1. since $n$ is 3-perfect, then we have $sigma(3 n) = sigma(3)sigma(n) = 4sigma(n) = 4 (3n)$ therefore $3n$ is 4-perfect and the multiplicative properties hold for coprime numbers $3$ and $n$ (note that $3 divides.not n$) \

  2. similar to part (a) we can compute $sigma(5n) = sigma(5)sigma(n) = 6(5 n)$ therefore $5n$ is 6 perfect. \

  3. since $3n$ is $4k$ perfect, we know that $sigma(3n) = (4k)(3n)$. since $3 divides.not n$ like in part (a) we also know that $sigma(3n) = 4(3n) = 4sigma(n)$. \

  This implies that $4 sigma(n) = (4k)(3n)$. Dividing 4 on both sides gives $sigma(n) = 3k n arrow.double$ $n$ is $3k$ perfect. \






  ],
)

#pagebreak()

Resources: \

https://en.wikipedia.org/wiki/Perfect_number \

https://penguinmaths.blogspot.com/2019/07/proof-sum-of-divisors-function-is.html \

https://people.math.harvard.edu/~knill/seminars/perfect/handout.pdf \

https://math.stackexchange.com/questions/157419/show-that-sum-nolimits-dn-frac1d-frac-sigma-nn-for-every-pos \

https://math.stackexchange.com/questions/4051082/prove-that-sigman-n-sum-d-mid-n-1-d

