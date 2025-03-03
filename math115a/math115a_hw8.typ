#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw8"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)
#env_headers.update("classic")
#env_colors.update("bw")

#prob([

Prove that the quadratic congruence $ 6x^2 + 5x + 1 equiv 0 (mod p) $ has a solution modulo every prime $p$ even though the equation $6x^2 + 6x +1 = 0$ has no solutions in the integers.   

],[])

#prob([Show that 3 is a quadratic residue modulo 23, but is a non-residue modulo 31],[])

#prob([Given that $a $ is a quadratic residue modulo the odd prime $p $ , prove the following: \

(a) $a $ is not a primitive root of $p$ 

(b) The integer $p-a $ is a quadratic residue or non-residue modulo $p $ according as $p equiv 1 (mod 4)$ or $p equiv 3 (mod 4)$ 

(c) If $p equiv 3 (mod 4)$ then $x equiv plus.minus a^((p+1)\/4)(mod p)$ are the solutions of the congruence $x^2 equiv 1 (mod p)$   

],[])

#prob([If $p = 2^k +1$ is a prime, show that every quadratic non-residue modulo $p $ is a primitive root modulo $p$  ],[])

#prob([Find the value of the following Legendre symbols: \

(a) $(19\/23)$ \
(b) $(-23\/59)$ \
(c) $(-72\/131)$

],[])

#prob([Use Gauuss's Lemma to compute each of the following Legendre symbols (i.e., in terms of the notation that we used in class, find the integer $n $ in Gauss's Lemma for which $(a/p) = (-1)^n$ )

(a) $ (8\/11)$\
(b) $(7\/13)$\
(c) $(5\/19)$


],[])

#prob([

(a) Let $p $ be an odd prime, and suppose that $a $ is an integer with $(a,p)=1$. Show that the diophantine equation $ x^2 + p y + a = 0 $ has an integral solution $iff (-a\/p)=1$    

(b) Determine whether of not the Diophantine equation $ x^2 + 7y - 2 = 0 $ has a solution in the integers
],[])

#prob([Prove that 2 is not a primitive root modulo any prime of the form $p = 3 dot 2^n + 1$  except when $p = 13$ ],[])

#prob([For a prime $p equiv 7 (mod 8)$ show that $p divides 2^((p-1)\/2) - 1$  ],[])

#prob([(a) Suppose that $p $ is an odd prime, and that $a $ and $b $ are integers such that $(a b,p) = 1$ Prove that at least one of $a,b, "or" a b  $ is a quadratic residue modulo $p$

(b) Show that, for some choice of $n > 0$ $p$ divides $ (n^2 -2) (n^2 - 3) (n^2 -6)  $   

  ],[])