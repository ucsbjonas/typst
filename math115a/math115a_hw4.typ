#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw4"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)

#env_headers.update("classic")
#env_colors.update("bw")

#prob([Use Fermat's Little Theorem to verify that $17$ divides $11^104 + 1$],[\ $11^104 = (11^2)^52 equiv 2^52 = (2^16)^3 dot 2^4 equiv 1 dot 16 = 16 (mod 17)$ \ Then $11^104 + 1 equiv 16 + 1 equiv 0 (mod 17)$ as desired. $qed$])

#pagebreak()
#prob([Show that for any integer $n gt.eq 0, 13 divides (11^(12 n + 6)+1)$  ],[$\ \ 11^(12 n + 6) = (11^12)^n dot 11^6 equiv 1 dot (11^2)^3 equiv 4^3 = 4^2 dot 4^1 = 3dot 4 = 12 (mod 13)$ (first equiv by Fermat's little theorem) \ Then $11^(12 n + 6) + 1 equiv 12 +1 equiv 0 (mod 13)$ as desired.$qed$   ])

#pagebreak()

#prob([Let $a$ be any integer. Show that $a$ and $a^5$ have the same last digit. ],[\ Note by Euler's theorem that $a dot a^4  equiv a (mod 10)$ since $phi.alt(10) = 4$. This implies $a^5 equiv a (mod 10)$ which means that $a^5 "and" a$ will have the same remainder after dividing by 10, and therefore will have the same last digit. $qed$])

#pagebreak()

#theorem([Fermat's little],[$a^p equiv a (mod p)$ where $p$ is prime \ $a^(p-1) equiv 1 (mod p) iff p divides.not a$  ],[])

#prob([Use Fermat's Little Theorem to show that, if $p $ is an odd prime, then \ (i) $1^(p-1) + 2^(p-1) + 3^(p-1) + dots + (p-1)^(p-1) equiv -1 (mod p)$ \ (ii) $1^p + 2^p + 3^p + dots + (p-1)^p equiv 0 (mod p)$],[ \

(i) Since $p divides.not 1, dots, p-1$ this equation mod $p$  by Fermat's little theorem is congruent to $underbrace(1+dots+ 1,"p-1 times" ) = p-1$ \

Also, note that $-1 equiv p-1 (mod p)$ and the claim follows. 

(ii) By Fermat's little theorem this equation equals $1 + 2 + 3 + dots + (p-1) = (p (p-1)) / 2 equiv 0 (mod p)$. (Since $p$ is odd, $p-1$ is even and divisible by 2  ) 

])

#pagebreak()
#prob([Prove each of the following assertions:  (i) If $n $ is an odd integer, then $phi.alt(2n) = phi.alt(n)$  (ii) If $n$ is an even integer, then $phi.alt(2n) = 2 phi.alt(n)$  (iii) $phi.alt(3 n ) = 3 phi.alt(n) iff 3 divides n$  (iv) $phi.alt(3 n) = 2 phi.alt(n) iff 3 divides.not n$  (v) $phi.alt(n) = n/2 iff n = 2^k$ for some $k gt.eq 1$. [Hint: Write $n = 2^k N$, where $N $ is odd, and use the condition $phi.alt(n) = n/2$ to show that $N = 1$  ]     ],[
\ (i) 2 and $n$ are coprime therefore $phi.alt(2n) = phi.alt(2)phi.alt(n)= phi.alt(n)$

(ii) Let $k,m $ be positive integers $gt.eq 0$. Recall that an odd integer times an even integer is even. We can try to take advantage of the fact that $phi.alt$ is multiplicative and that $phi.alt(p^q) = p^(q-1) (p-1) = p^q - p^(q-1) (dagger)$  

Let $n$ be even and $m$ be odd. Then we can try to express $n$ in terms of $m$. Let $n = 2^k m$ to take advantage of the above. Then $phi.alt(2n) = phi.alt(2 dot 2^k m) = phi.alt(2^(k+1)) phi.alt(m) =  2^(k) phi.alt(m)$ \

And $2 phi.alt(n) = 2 phi.alt(2^k m) = 2 phi.alt(2^k) phi.alt(m) = 2 (2^(k-1)) phi.alt(m ) = 2^k phi.alt(m)$ $therefore phi.alt(2n) = 2 phi.alt(n)$ for even $n$   

(iii) $(arrow.double.r)$ Suppose that $phi.alt(3n) = 3 phi.alt(n)$ and for contradiction assume that $3 divides.not n$. Then $3$ and $n$ are corpime therefore $phi.alt(3 n) = phi.alt(3) phi.alt(n) = 2 phi.alt(n)$. This means that $3 divides n$ \

$(arrow.double.l)$ Suppose that $3 divides n$ Similar to part (ii) we can first note that $n = 3^k m$ where $(3^k, m) = 1$ and $ phi.alt(3 n) = phi.alt(3 dot 3^k m) = phi.alt(3^(k+1) m) = phi.alt(3^(k+1)) phi.alt(m)  = (3^(k+1) - 3^k) phi.alt(m)  = 3 (3^k - 3^(k-1)) phi.alt(m) = 3 phi.alt(3^k) phi.alt(m) = 3 phi.alt(3^k m) = 3 phi.alt(n)$ 


(iv) $(arrow.double.l)$ Suppose that $3 divides.not n$ then $(3,n)=1$ (3 and $n$ are coprime) $therefore phi.alt(3 n) = phi.alt(3) phi.alt(n) = 2phi.alt(n) $ \

$(arrow.double.r)$ Suppose that $phi.alt(3n) = 2 phi.alt(n) eq.not 3phi.alt(n)$. In part (iii) we showed that $3 divides n arrow.double phi.alt(3n) = 3 phi.alt(n)$. Then the claim follows if we take the contraposition of the previous statement.

(v) $(arrow.double.r)$  First note that $n$ must be even since $phi.alt$ returns integers. Then we can write $n = 2^k N$ where $N$ is odd.  \ $therefore phi.alt(2^k N) = 2^(k-1) phi.alt(N) = 2^(k-1) N$. And $N = phi.alt(N) arrow.double N = 1$. $therefore phi.alt(2^k N) = 2^(k-1) = n/2$ \         
$(arrow.double.l)$ Suppose that $n = 2^k$ then we showed in class that $phi.alt(n) = 2^(k-1) = n/2 (dagger)$   

])

https://math.stackexchange.com/questions/2578183/is-this-proof-even-valid-is-it-true-that-all-odd-numbers-can-be-uniquely-expres

#pagebreak()
#note([The totient function $phi.alt(n)$ count the number of COPRIME integers to n where $n in ZZ^+$ ])

#prob([Use Euler's Theorem to establish the following: \ (i) For any integer $a $, $a^37 equiv a (mod 1729)$. [Hint: $1729 = 7 times 13 times 19$. First consider the case in which $(a, 1729) = 1$  ] \ (ii) For any odd integer $a$, $a^33 equiv a (mod 4080)$ [Hint: $4080 = 15 times 16 times 17$. First consider the case in which $(a, 4080) = 1$  ]   ],[

\ (i) Note that $7,13,19$ are coprime. Therefore if we show the following congruences hold: $ a^37 equiv a (mod 7) \  a^37 equiv a (mod 13) \ a^37 equiv a (mod 19) $ then it will follow that $a^37 equiv a (mod 7 times 13 times 19)$ by the lemma at the end of this document

Using euler's theorem we have $ a^(phi.alt(7)) equiv 1 (mod 7) arrow.double a^6 equiv 1 (mod 7) arrow.double (a^6)^6 a equiv a (mod 7) $ $ a^(phi.alt(13)) equiv 1 (mod 13) arrow.double a^12 equiv 1 (mod 13) arrow.double (a^12)^3 a equiv a (mod 13) $ $ a^(phi.alt(19)) equiv 1 (mod 19) arrow.double a^18 equiv 1 (mod 19) arrow.double (a^18)^2 a equiv a (mod 19) $ $qed$      

(ii)

The proof is nearly identical to (i) \

Note that $phi.alt(15) = 8 = phi.alt(16), phi.alt(17) = 16$ \

Then $(a^8)^4 a equiv a (mod 16), (a^8)^4 a equiv a (mod 15), (a^16)^2 a equiv a (mod 17)$ and the claim follows similarly. $qed$ 

])

#pagebreak()
#prob([(a) Use Fermat's Little Theorem to find the last digit of $3^100$ \ (b) Let $a $ be any positive integer. Show that $a $ and $a^5$ have the same last digit. ],[
\

(a) note that $phi.alt(10) = 4$ therefore $3^100 = (3^4)^25 equiv 1^25 equiv 1 (mod 10)$ \ If we want to use Fermat's Little Theorem then we can note that $3^4 equiv 1 (mod 2), 3^4 equiv 1 (mod 5)$ then $3^4 equiv 1 (mod 10)$ by the lemma \* at the end of this document \

$therefore "the last digit is " 1$ 

(b) proven more generally in problem 3

])

#pagebreak()
#prob([(a) Find the remainder when $15!$ is divided by $17$ \ (b) Find the remainder when $2 (26!)$ is divided by 29 ],[

\ (a) By Wilson's theorem we have that $16! equiv -1 (mod 17)$ \ Then $16! = 15! dot 16 equiv 15!  (-1) equiv -1 arrow.double 15! equiv 1 (mod 17) $ and the remainder is 1  \

Note that $-a equiv -b (mod n) iff a equiv b (mod n)$ (Intuitively, if we need to subtract/add $k$ multiples of $n$ from $a$ to get $b$ then we will need to add/subtract $k$ multiples of $n$ to $-a$ to get $-b$) (also we can apply modular arithmetic) \

(b) Note that 29 is a prime. Therefore by Wilson's theorem, $28! equiv -1 (mod 29)$. \

Then $28! = 28 dot 27 dot 26! equiv -1 dot -2 dot 26! equiv -1 arrow.double 2(26!) equiv -1 equiv 28(mod 29)$ so that the remainder (which must be positive) is 28 

])

#pagebreak()
#prob([Show that $18! equiv -1 (mod 437)$ [Hint: $437 = 19 times 23$ ]],[
\
$18! equiv -1 (mod 19) (dagger)$ and $22! equiv -1 (mod 23)$ \

Therefore $22! = 18! 4! = 18! (1) equiv -1 (mod 23) arrow.double 18! equiv -1 (mod 23)$. Combining this result with $(dagger)$ we have that $18! equiv -1 (mod 19 times 23 = 437)$ (by lemma \* below)  

])

#pagebreak()
#lemma([\*],[If $m equiv a (mod i) and m equiv a (mod j)$ then $m equiv a (mod i times j)$ if $(i,j)=1$   ],[

Suppose the assumption then $m = k_1 i + a = k_2 j + a$ but (i,j) are coprime so in order for the equality to continue to hold we must have $k_1 = l_1 j$ and $k_2 = l_2 i$ \

Then $m = l_1 i j + a = l_2 i j + a$ and the claim holds. 

])

Used by problems 9, 6 , 7