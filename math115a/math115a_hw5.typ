#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw5"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)

#env_headers.update("classic")
#env_colors.update("bw")

#prob([Suppose $f $ and $g $ are multiplicative functions. Prove that the function $F $ defined by $ F(n) = sum_(d divides n) f(d) g(n/d) $ is also multiplicative.],[])
#prob([(i) For each positive integer $n$, show that $mu(n) mu(n + 1) mu(n + 2) mu(n+3) = 0$ [Hint: What can you say about the four consecutive intgers $n, n+1, n_2, n_3$ modulo $4$ ? If you find yourself doing lots of algebraic manipulations to solve this problem, then you are almost certainly on the wrong track.] \ (ii) For any integer $n gt.eq 3$, show that $ sum_(k=1)^n mu(k!) = 1 $ ],[])
#prob([The von Mangoldt function $Lambda$ is defined by $ Lambda(n) = cases(log(p) "if" n = p^k "where" p "is prime and" k gt.eq 1, 0 "otherwise" ) $ Prove that $ Lambda(n) = sum_(d divides n) mu(n/d) log(d) = - sum_(d divides n) mu(d) log(d) $  [Hint: First show that $sum_(d divides n) Lambda(d) = log(n)$, and then apply the Mobius inversion formula. ]     ],[])
#prob([Let $n = p_1^(k_1)p_2^(k_2)dots p_r^(k_r)$ be the prime factorisation of an integer $n gt 1$. If $f $ is a multiplicative function that is not identically zero, prove that $ sum_(d divides n) mu(d) f(d) = (1 - f(p_1))(1-f(p_2)) dots (1-f(p_r)) $ [Hint: Use the fact that the function $F$ defined by $F(n) = sum_(d divides n) mu(d) f(d)$ is multiplicative (why is this so?), and is therefore determined by its values on powers of primes.  ] ],[])
#prob([Let $n = p_1^(k_1)p_2^(k_2)dots p_r^(k_r)$ be the prime factorisation of an integer $n gt 1$. Use the result of Problem 4 above to establish the following: \ (a) $sum_(m divides n) mu(m) d(m) = (-1)^r$ \ (b) $sum_(d divides n) mu(d) sigma(d) = (-1)^r p_1 p_2 dots p_r$ \ (c) $sum_(d divides n) mu(d)/d = (1 - 1/p_1)(1-1/p_2)dots(1-p_r)$ \ (d) $sum_(d divides n) d mu(d) = (1 - p_1) (1 - p_2) dots (1 - p_r)$    ],[])
#prob([

Let $S(n)$ denote the number of square-free divisors of $n$. Show that $ S(n) = sum_(d divides n) |mu(d)| = 2^(omega(n)) $ where $omega(n)$ is the number of distinct prime factors of $n$     

],[])