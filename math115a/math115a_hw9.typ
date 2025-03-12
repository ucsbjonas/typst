#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw9"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)
#env_headers.update("classic")
#env_colors.update("bw")

#prob([Find the value of the following Legendre symbols: \

(a) $(71\/73)$

(b) $(-219\/383)$

(c) $(3658\/12703)$ [Hint: $3658 = 2 dot 31 dot 59$ ]  

],[])
#prob([Prove that 3 is a quadratic non-residue of all primes of the form $2^(2 n) + 1$, and all primes of the form $2^p - 1$, where $p $ is an odd prime. [Hint: for all $n, 4^n equiv 4 (mod 12)$  ]  ],[])
#prob([
Verify that $p$ is an odd prime, then $ (-2/p) = cases(1 "if" p equiv 1 (mod 8) or p equiv 3 (mod 8), -1 "if" p equiv 5 (mod 8 ) or p equiv 7 (mod 8)) $ 

],[])
#prob([

(a) Prove that if $p gt.eq 3 $ is an odd prime, then $ (-3/p) = cases(1 "if" p equiv 1 (mod 6), -1 "if" equiv p equiv 5 (mod 6)) $ 

(b) Using part (a), show there are infinitely many primes of the form $6k + 1$ [Hint: Assume that $p_1, p_2, dots, p_r$  are all primes of the form $6k + 1$, and consider the integer $N = (2p_1 p_2 dots p_r)^2 + 3$  ] 

],[])
#prob([
Determine whether the following quadratic congruences are soluble: 

$(a) x^2 equiv 219 (mod 419)$ 

$(b) 3x^2 + 6x + 5 equiv 0 (mod 89)$ 
],[])
#prob([

Determine which primes can divide integers of the forms $n^2 + 1$, $n^2 + 2$, or $n^2 + 3$  for some value of $n$   

],[])
#prob([Find all solutions of the quadratic congruence $x^2 equiv 11 (mod 35)$ ],[])