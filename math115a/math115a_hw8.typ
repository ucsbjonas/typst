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

],[\ No idea

Although for $p = 2$ the congruence can be solved with $x equiv 1 (mod 2)$ and $p=3$ the congruence has a solution also $x equiv 1 (mod 3)$    

])
#pagebreak()
#prob([Show that 3 is a quadratic residue modulo 23, but is a non-residue modulo 31],[
\
$(23-1)\/2 = 11$ and $3^11 equiv (3^3)^3 dot 3^2 equiv (4)^3 dot 3^2 equiv 18 dot 9 equiv 1 (mod 23)$ therefore $3 $ is a quadratic residue modulo $23 $ by Euler's criterion \

$(31-1)\/2 = 15$ and $3^15 = (3^3)^5 equiv (-4)^5 equiv 30 equiv -1 (mod 31) $ and therefore $3$ is a quadratic non-residue modulo  31  by Euler's criterion 

])
#pagebreak()

#theorem([Euler's criterion ],[

Suppose that $p $ is an odd prime, and let $a in ZZ$ satisfy $(a,p) = 1$ \

Then $a $ is a quadratic residue $mod p$  $ iff a^((p-1)\/2) equiv 1 (mod p) $  

],[])
#prob([Given that $a $ is a quadratic residue modulo the odd prime $p $ , prove the following: \

(a) $a $ is not a primitive root of $p$ 

(b) The integer $p-a $ is a quadratic residue or non-residue modulo $p $ according as $p equiv 1 (mod 4)$ or $p equiv 3 (mod 4)$ 

(c) If $p equiv 3 (mod 4)$ then $x equiv plus.minus a^((p+1)\/4)(mod p)$ are the solutions of the congruence $x^2 equiv a (mod p)$   

],[\
(a) Since $a$ is a quadratic residue $mod p$ then by Euler's criterion $a^((p-1)\/2) equiv 1 (mod p)$  and since \ $(p-1)/2 < p-1 = phi.alt(p)$ then it follows that $a$ is not a primitive root of $p$       

(b) Note that $(p-a)^((p-1)\/2) equiv (-a)^((p-1)\/2) equiv (-1)^((p-1)\/2) (a)^((p-1)\/2) equiv (-1)^((p-1)\/2)$ where the last equivalence holds by Euler's criterion.  \

If $p equiv 1 (mod 4)$ then $p = 4k+1$ then $(p-1)/2$ will be even and $(-1)^((p-1)\/2) equiv 1 (mod p)$ so that $p-a$ is a quadratic residue modulo $p$. Similarly if $p equiv 3 (mod 4)$ then $p = 4k+3$ making $(p-1)\/2$ odd so that $p-a$ is a quadratic non-residue modulo $p$       

(c) Substituing $x$ into $x^2 equiv a (mod p)$ we have $(plus.minus a^((p+1)\/4))^2 equiv a^((p+1)\/2) equiv a^((p-1)\/2) a equiv 1a equiv a (mod p)$   

])

#pagebreak()

#prob([If $p = 2^k +1$ is a prime, show that every quadratic non-residue modulo $p $ is a primitive root modulo $p$  ],[

\ Let $a $ be  a quadratic non-residue $mod p$ then by Euler's criterion the following equivalences are the same: \

$ a^((p-1)\/2) &equiv -1 (mod p) \ a^((2^k)\/2) &equiv -1 (mod p) \ a^(2^(k-1)) &equiv -1 (mod p) \ a^(2^k) &equiv 1 (mod p) $  First one by euler's criterion, second one by def of $p$ and fourth one by squaring both sides of second one 

Note that $a^(phi.alt(p)) = a^(p-1) = a^2^k$ therefore we would like to show that the order of $a$ is at most $2^k$ \

Suppose there exists some $z < 2^k$ such that $a^z equiv 1 (mod p)$  \

Case 1: $z$ is not a power of 2. Note that $a^(2^k) equiv 1 (mod p)$ implies that the order of $a$ divides $2^k$ (the divisors of $2^k$ are also powers of $2$  ), then $z$ cannot be the order of $a$ 

Case 2: $z$ is a power of $2$ then $z $ has the form  $2^l$ where $l < k$ but notice that if we repeatedly square the congruence (specifically: $k-l-1$ times) $a^(2^l) equiv 1 (mod p)$ that will eventually obtain $a^2^(k-1) equiv 1 mod p$ but from above we also know that $a^(2^(k-1)) equiv -1 (mod p)$ therefore $z$ cannot be the order of $a$

Since $z$ cannot exist, then $2^k$ is the order of $a mod p$ which means that $a$ is a primitive rood $mod p$      


])

#pagebreak()

#theorem([properties of the Legendre symbol],[

Let $p $ be an odd prime and let $a,b in ZZ$ with $(a,p) = (b,p) = 1$  \

(i) If $a equiv b (mod p)$ then $(a/p) = (b/p)$

(ii) $(a^2/p) = 1$ \

(iii) $(a/p) equiv a^(p-1 \/2 ) (mod p)$ \

(iv) $((a b)/p) = (a/p)(b/p)$ \

(v) $(1/p) = 1$ and $(-1/p) = (-1)^(p-1 \/ 2)$  


],[])

#prob([Find the value of the following Legendre symbols: \

(a) $(19\/23)$ \
(b) $(-23\/59)$ \
(c) $(-72\/131)$

],[

\

(a) $(19\/23) = (-4\/23) = (-1\/23)(4\/23) = -1$ \

since $(-1\/23) = (-1)^((23-1)\/2) = (-1)^11 = -1$

(b) $(-23\/59) = (36\/59) = 1$ 

(c) $(-72\/131) = (9\/131)(-8\/131)= (1)(-1\/131)(8\/131) = (-1) (2\/131) = 1$ where \ $(-1\/131) = (-1)^65 = -1$ and $(2\/131) = 2^65 equiv -1 (mod 131)$ 

])

#pagebreak()

#lemma([Gauss's Lemma],[

Let $p $ be an odd prime, and suppose $a in ZZ$ with $(a,p)= 1$ 

Let $n$ denote the number of integers in the set $S = {a,2a,3a,dots,(p-1)/2 a}$ whose smallest positive residue $mod p $ exceeds $p/2$ \

Then $(a/p) = (-1)^n$ 


 ],[])

#prob([Use Gauuss's Lemma to compute each of the following Legendre symbols (i.e., in terms of the notation that we used in class, find the integer $n $ in Gauss's Lemma for which $(a/p) = (-1)^n$ )

(a) $ (8\/11)$\
(b) $(7\/13)$\
(c) $(5\/19)$


],[

\

(a) We can compute $(p-1)/2 = 5$ smallest positive residues in the set ${8,16,24,32,40}$ which are ${8,5,2,10,7}$ since 3 of these numbers are larger than $p/2$ then $(8\/11)=(-1)^3 = -1$    

(b) Similar to (a) the smallest positive residues in the set ${7,14,21,28,35,42}$ are ${7,1,8,2,9,3}$ then $n=3$ and $(7\/13) = -1$ 

(c) Similar to (a) and (b) the smallest positive residues in the set ${5,10,15,20,25,30,35,40,45}$ are ${5,10,15,1,6,11,16,2,7}$ therefore $n=4$ and $(5\/19) = 1$  

])

#pagebreak()

#defn([Legendre symbol],[

Let $p $ be an odd prime, with $(a,p)=1$ \

The Legendre symbol $(a/p)$ is defined by \ 

$ (a/p) = cases(1 "if" a "is a quadratic residue " mod p, -1 "if a is a quadratic non-residue") $]) 


#prob([

(a) Let $p $ be an odd prime, and suppose that $a $ is an integer with $(a,p)=1$. Show that the diophantine equation $ x^2 + p y + a = 0 $ has an integral solution $iff (-a\/p)=1$    

(b) Determine whether of not the Diophantine equation $ x^2 + 7y - 2 = 0 $ has a solution in the integers

],[
\
(a) 

Mod $p$ the diophantine equation is equivalent to $x^2 equiv -a (mod p)$ \

Therefore there is a solution iff $-a$ is a quadratic residue $mod p$ iff $(-a\/p) = 1$   

 \ (b) Mod 7 the equation is equivalent to $x^2 equiv 2(mod 7)$ \

 Since $(2\/7) = 2^3 equiv 1 (mod 7)$ this implies that 2 is a quadratic residue $mod 7$ and therefore there exists an $x$ such that the diophantine equation holds (i.e. solution exists)   

])

#pagebreak()
#lemma([],[if $a$
 is a quadratic residue mod $p$
, then $a$
 is not a primitive root mod $p$ \ (the contrapositive holds as well)],[follows from Euler's criterion
 
 suppoe that $a $ is a quadratic residue then $a^((p-1)\/2) equiv 1 (mod p)$  but $phi.alt(p) = p-1 > (p-1)\/2$ therefore $a$ cannot have order $phi.alt(p)$ and is therefore not a primitive root $mod p$ \


 
 ])

 #theorem([],[Let $p $ be an odd prime, then $ (2/p) = cases(1 "if" p equiv 1 (mod 8) or p equiv 7 (mod 8), -1 "if" p equiv 3 (mod 8) or p equiv 5 (mod 8)) $ ],[From class])



#prob([Prove that 2 is not a primitive root modulo any prime of the form $p = 3 dot 2^n + 1$  except when $p = 13$ ],[

\ For $n=1$ we have $p=7$ and we can note that $(2\/7) = 1 "since" 2^3 equiv 1 (mod 7)$, therefore we know that 2 is a quadratic residue $mod p$ and therefore $2$ is not a primitive root modulo $p$ \

For $n=2$ we have $p=13$ and we showed that $2$ is a primitive of root modulo $13$ before. (note that $(2\/13) = -1$ )

For $n gt.eq 3$ we can see that $p = 3 dot 8 dot 2^(n-3) + 1 arrow.double$ $p equiv 1 (mod 8)$ and by the above theorem $(2/p) = 1$ therefore $2$ is a quadratic residue modulo $p$ and therefore $2$ is not a primitive root modulo $p$ for $n gt.eq 3$

Conclusion is that claim holds for all $n$ such that  $n gt.eq 1 and n eq.not 13$ 

])

#pagebreak()
#prob([For a prime $p equiv 7 (mod 8)$ show that $p divides 2^((p-1)\/2) - 1$  ],[

\ By the above theorem from class we have that $(2\/p)=1$ which implies that $2$ is a quadratic residue modulo $p$ and by euler's criterion $2^((p-1)\/2)equiv 1 (mod p) arrow.double 2^((p-1)\/2) - 1 equiv 0 (mod p) arrow.double p divides 2^((p-1)\/2) - 1$    

])

#pagebreak()

#prob([(a) Suppose that $p $ is an odd prime, and that $a $ and $b $ are integers such that $(a b,p) = 1$ Prove that at least one of $a,b, "or" a b  $ is a quadratic residue modulo $p$

(b) Show that, for some choice of $n > 0$ $p$ divides $ (n^2 -2) (n^2 - 3) (n^2 -6)  $   

  ],[
\
(a) Consider the Legendre symbol $(a b \/ p) = (a\/p)(b\/p)$ 

If both $a$ and $b $ are quadratic non-residues $mod p $ then $(a b \/p) = (-1)(-1)=1$ so that $a b$ is a quadratic residue modulo $p$. 

If $a b$ is a quadratic nonresidue $mod p $ then $(a b\/p) = -1 = (1)(-1)=(-1)(1)$ which means either $(a\/p) = 1 or (b\/p) =1$ so that one of $a,b$ is a quadratic residue $mod p$


(b) Want to show: $(n^2 -2) (n^2 - 3) (n^2 -6) equiv 0 (mod p)$ for all $p$ there exist some $n$ to satisfy this congruence \

This is true if $p$ divides at least one $(n^2-2), (n^2-3),(n^2-6)$ which further implies that the claim holds if at least one of $2,3,6$ is a quadratic residue $mod p$ \

Applying the result in part (a), we know that as long as $p$ is coprime to a product of two integers from the set ${2,3,6}$ that one of those integers is a quadratic residue or their product is a quadratic residue $mod p$ \

If $p=2$ or $p=3$ then the coprime condition does not hold, and we have to manually check if some $n$ exists. 

For $p=2$, set $n = 1$ then the expression becomes $(-1)(-2)(-5) = -10 equiv 0 (mod 2)$

For $p=3$  set $n=3$  then the expression becomes $(7)(6)(3)=126 equiv 0 (mod 3)$

For the case that $p > 3$ consider that since $p$ is odd, then $p$  must be coprime to $6 = 2 dot 3$ For $p=5$ this is easy to see. And for $p gt.eq 7$ we can see that $p$ has factors $1,p$ and $6$ has factors $1,2,3,6$ but $p > 6$ so their only shared factor is $1$

To summarize, since $(2 dot 3, p) = 1$ for any $p gt 3$ then at least one of $2,3,6=2 dot 3$  is a quadratic residue $mod p$ \

Therefore one of the following is true: $n^2 - 2 equiv 0, n^2 - 3 equiv 0, n^2 - 6 equiv 0 $ all $mod p$ and the claim follows.



  ])