#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw6"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)

#env_headers.update("classic")
#env_colors.update("bw")

#prob([Find the orders of the integers 2,3, and 5 \ (a) modulo 17 \ (b) modulo 19 \ (c) modulo 23],[
\

Firstly, the 2, 3, and 5 are each coprime respectively to 17,19, and 23 so the definition of order can be used. \

From class we know that the order of $a mod n$ must divide $phi.alt(n)$  \

Here, $phi.alt(17) = 16, phi.alt(19) = 18, phi.alt(23) = 22$. Therefore the order is at most $phi.alt(n)$ or if the order is less, it must divide $phi.alt(n)$. Checking if the divisors $d_i$  of 16, 19, 23 are the smallest numbers satisfying $a^(d_i) equiv 1 (mod n)$ in increasing order gives us the following for parts (a),(b),(c) respectively: \   

(a) 
$2^2 equiv 4 (mod 17)$ 

$2^4 equiv 16 ( mod 17)$ 

$2^8 = 256 equiv 1 (mod 17)$ therefore the order of 2 mod 17 is 8 

Similarly the orders of 3 and 5 (mod 17) are 16 and 16 respectively \

(b)

Similar to (a) we have that $2,3,5$ have orders $18,18,9$ mod 19 respectively \

(c)

Similar to (a) and (b) we have that $2,3,5$ have orders $11,11,22$ mod 23 respectively 

])
#pagebreak()

#prob([Establish each of the following statements below: \ (a) if $a $ has order $h k $ modulo $n $, then $a^h $ has order $k $ modulo $n$ \ (b) if $a$    has order $2 k $ modulo an odd prime $p $ , then $a^k equiv -1 mod p $   ],[

\ 

(a) Suppose that $a$ has order $h k$ modulo $n$ \

Then it follows that $a^(h k) equiv 1 (mod n)$ and it follows that $(a^h)^k equiv 1 (mod n)$ so that $k$ is a possible candidate for the order of $a^h$ \

We can show that $a^h $ has order at most $k$ since if there exists $1 lt.eq z < k$ such that $(a^h)^z equiv 1 (mod n)$ then it follows that $a^(h z) equiv 1 (mod n)$, but since $h k$ is the order of $a$ we have that $h k < h z arrow.double k lt z$ which is a contradiction. Therefore $k$ is the smallest possible number such that $(a^h)^k equiv 1 (mod n)$ \

(b)

Suppose that $a$ has order $2 k$ then $a^(2 k) equiv 1 (mod p)$ implies that $a^(2 k) - 1 equiv 0 (mod p)$ therefore $p divides a^(2 k ) - 1 = (a^k +1)(a^k - 1)$ which means that either or $a^k equiv 1 (mod p)$ or that $a^k equiv -1 (mod p)$ \

But $a^k equiv 1 (mod p)$ cannot hold since $2 k $ is the order of $a (mod p)$ \

Therefore the other case, that $a^k equiv -1 (mod p)$ holds

])
#pagebreak()

#prob([Prove that $phi.alt(2^n -1 )$ is a multiple of $n $  for any $n gt.eq 1 $. [Hint: The integer 2 has order $n $ modulo $2^n -1$  ]],[

\ From the hint we know that $2^(n) equiv 1 (mod 2^n - 1)$  This equivalence holds since $2^n -1 equiv 0 (mod 2^n -1)$ holds. \

Note that if $n$ is the order of $2 mod 2^n -1$ then $n divides phi.alt(2&n-1) arrow.double phi.alt(2^n -1) = n k$ for some $k gt.eq 1$ i.e. $phi.alt(2^n -1)$ is a multiple of $n$ as desired. \

To show that $n$ is the order of $2 mod 2^n - 1$ we can first suppose that there exists $1 lt.eq z < n$ such that $2^z equiv 1 (mod 2^n -1)$ \

This implies that $2^n - 1 divides 2^z -1$ but since $2^n -1 > 2^z -1$ this cannot be true. Therefore $z$ cannot exist and $n$ is the order of $2 mod 2^n -1$    \



])
#pagebreak()

#prob([Prove the following assertions: \ (a) The odd prime divisors of the integer $n^2 + 1 $ are of the form $4 k + 1 $ . [ Hint: if $p $ is an odd prime, then $n^2 equiv -1 mod p $ implies that $4 divides phi.alt(p)$ ]\ (b) The odd prime divisors of the integer $n^4 + 1 $ are of the form $8 k + 1$  ],[
\
(a) If $p$ is an odd prime divisor of $n^2 + 1$, then $n^2 + 1 equiv 0 (mod p)arrow.double n^2 equiv -1 (mod p) arrow.double n^4 equiv 1 (mod p)$ \

Next, we can show that $p$ is coprime to $n$ \

Suppose $p$ is not coprime to $n$, then $n = k p$ for some $k$ (since $p$ must be a factor of $n$  ) \

Since $p$ is a divisor of $n^2 + 1 $ we expect that $(k p)^2 + 1 equiv 0 (mod p)$   holds, but this is not true since $p divides k^2 p^2$ but $p divides.not 1$, which show that $p$ is not a divisor of $n^2 + 1$ which is a contradiction. therefore $p$ is coprime to $n$ \

We can then apply Euler's theorem to obtain $n^(phi.alt(p)) equiv 1 (mod p) arrow.double.l.r n^(p-1) equiv 1 (mod p)$ \

From the first line we have $1 equiv n^4 equiv n^(p-1) (mod p)$ which implies that $4 divides p-1 = phi.alt(p)$ since $n^(4k) = (n^4)^k equiv (n^(p-1))^k equiv (n^(p-1)) (mod p)$ and therefore $p-1 = 4 k arrow.double p = 4 k + 1$ \

(b)

Similar to part (a) we can argue that if $p $ is an odd prime divisor of $n^4 + 1$ then $n^8 equiv 1 (mod p)$ \  

Similarly, $n$ and $p$ are coprime and using Euler's theorem we have $n^(p-1) equiv 1 (mod p)$ \

Therefore $1 equiv n^8 equiv n^(p-1) (mod p)$ implies that $8 divides p-1 arrow.double.l.r 8 k = p-1 arrow.double.l.r p = 8 k + 1 $  

])

#pagebreak()

#prob([Let $r $ be the primitive root modulo $p$, where $p $ is an odd prime. Prove the following: \  \ (a) The congruence $r^((p-1)\/2) equiv -1 (mod p)$ holds. \ (b) If $r'$ is any other primitive root modulo $p $, then $r r' $ is not a primitive root modulo $p$. [Hint: From part (a), $(r r')^((p-1)\/2)  equiv 1 (mod p)$ ] \ (c) If the integer $r' $  is such that $r r' equiv 1 (mod p)$, then $r' $ is also a primitive root modulo $p$    ],[

\

(a) The problem statement implies that $r^(p-1) equiv 1 (mod p)$ implies that $ p divides r^(p-1) -1 =  ((r^((p-1)\/2))-1)((r^((p-1)\/2))+1) $ \

However $p divides.not  ((r^((p-1)\/2))-1)$ since $r$ has primitive root $p-1$, and therefore $ (r^((p-1)\/2)) equiv.not 1 (mod p)$ \

Therefore it must be true that $p divides  (r^(p-1\/2))+1$ which implies that $ r^(p-1\/2)equiv -1 (mod p)$  

(b) The statement from the hint holds since $(r r')^(p-1\/2) = (r )^(p-1\/2)(r')^(p-1\/2) equiv (-1)(-1) = 1 (mod p)$ using the result from part (a), since $ r r'$ must have an order less than or equal to $(p-1) \/ 2$ then it cannot have order $phi.alt(p) = p-1$ and therefore $r r' $ is not a primitive root modulo $p$ 

(c)

We would like to show that $r'$ has order $phi.alt(p) = p-1$ i.e. $p-1$ is the smallest integer such that \ $(r')^(p-1) equiv 1 (mod p)$ 

Then if we consider some $1 lt.eq z < p-1$ and call $z$ the order of $r'$ then $ r r' equiv 1 (mod p) arrow.double.l.r (r r')^z equiv 1^z (mod p) arrow.double.l.r r^z r'^z equiv 1 (mod p) arrow.double.l.r r^z equiv 1 (mod p) $ but since $r$ is a primitive root modulo $p$ it must have order $p-1$ and therefore $z$ canonot satisfy the equation $r^z equiv 1 (mod p)$, which contradict $r r' equiv 1 (mod p)$ therefore $p-1$ is the order of $r' (mod p)$ \

Note that $r'$ is not divisble by $p$ since if it were then $r r' equiv 1 (mod p)$ cannot hold, and therefore we can use Fermat's little theorem to assert that $(r')^(p-1) equiv 1 (mod p)$ holds.    



])

#pagebreak()

#prob([
For any prime $p > 3$, prove that the primitive roots modulo $p $ occur in incongruent pairs $r, r'$, where $r r' equiv 1 (mod p) $. [Hint: If $r$ is a primitive root modulo $p$, consider the integer $r' = r^(p-2)$   ]   

],[

\
 
We can first try to show that if $r $ is a primitive root modulo $p$ then $r' = r^(p-2)$ is also a primitive root modulo $p$ \

We can observe that $r r' = r dot r^(p-2) = r^(p-1) equiv 1 (mod p)$ Therefore $r'$ is a primitive root given r is also a primitive root \

Claim: $r equiv.not r^(p-2) (mod p)$ This claim holds for $p=3$ but does not hold for any $p gt 3$

Suppose the $r, r'$ are congruent than for any $p gt 3$ we have that $ r equiv r^(p-2) (mod p) iff r - r^(p-2) equiv 0 (mod p) $ where $p-2 > 2$ \

This implies that $p$ must divide $r (1-r^(p-3))$ which is not possible since $(p,r) = 1$ by the definition of order. In addition, $p$ cannot divide $1 - r^(p-3)$ since this quantity is less than 1, and $p > 2 forall p$     \

Therefore $r, r'$ are incongruent 

])

#pagebreak()
#prob([Suppose that $p $ is a prime. Use the fact that there exists a primitive root modulo $p $ to give a different proof of Wilson's theorem. [Hint: show that if $r $ is a primitive root modulo $p $ , then $(p-1)! equiv r^(1 + 2 + dots + (p-1)) (mod p)$ ]],[

\ 

The hint follows from a result in shown in class which shows that the numbers $alpha_1, alpha_2, dots, alpha_(phi.alt(n))$ that are less than and coprime to $n$ are congruent in some order to $r, r^2, dots, r^(phi.alt(n))$ where $r$ is a primitive root mod $n$ \

Since $(p-1)! = 1 dot 2 dots (p-1)$ and $1,2,dots, (p-1)$ are smaller than and coprimt to $n$ it follows that $(p-1)! equiv r dot r^2 dots r^(phi.alt(n)) = r^(1+2+dots+(p-1))$, which proves the hint

Using the hint and part (a) of question 5 and sum of first $p $ natural numbers we can see that $ (p-1)! equiv r^(1+2+dots+(p-1))  \ equiv r^(p(p-1)/2) = (r^((p-1)/2))^p equiv (-1)^p equiv -1 (mod p) $ 

which is wilson's theorem
])
