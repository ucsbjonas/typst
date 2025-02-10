#import "@local/superTemplate:0.1.3": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw3"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)

#prob([(Euler, 1770). Divide 100 by two summands such that one is divisible by $7$ and the other by $11$.   ],[

We can try to solve the linear diophantine equation $7x + 11y = 100$ \

The gcd of 7,11 is $1$ which divides 100 so the equation should be solvable \ 

We can first try to solve $7 x_i + 11 y_i = 1$ and by inspection we can we that one solution is $x_i = -3, y_i = 2$ \

Then one solution will be $(x_i dot n/d, y_i n/d) = (-3 dot 100, 2 dot 100) = (-300,200)$ where $n=100$ \

We can verify the solution by resubstituing into the original equation: (-2100+2200=100) \

Thus the two summands are $-2100$ and $2200$ which are divisible by $7$ and $11$ respectively.    



])
#pagebreak()
#prob([Find the last two digits of the number $9^9^9$. [Hint: $9^9 equiv 9 (mod 10)$; hence $9^9^9 = 9^(9+10 k)$; now use the fact that $9^9 equiv 89 (mod 100)$] ],[

Using the hint we know that $ 9^9^9 = 9^(9 + 10 k) = 9^9 dot 9^(10 k) equiv 89 dot (9 dot 9^9)^k equiv 89(1)^k equiv 89 (mod 100) \   $  

Thus we know that $9^9^9 = 100(k) + 89$ and therefore the last two digits are 89. \

Additionally note that $9^9 dot 9 equiv 89 dot 9 = 801 equiv 1 (mod 100)$ which justifies the second to last equivalence. \


])
#pagebreak()
#prob([Show that $2^n$ divides an integer $N$ if and only if $2^n$ divides the number made up of the last $n$ digits of $N$     ],[

Let $ N = a_(n+i) 10^(n+i) + dots + a_n 10^n + a_(n-1) 10^(n-1)+ dots + a_0 $ be the base 10 expansion of $N$ where $i gt.eq 0, n gt.eq 1$. \

Then, note that $10^n = 2^n dot 5^n$ \

Therefore $N = 10^n (a_(n+i) 10^i + dots + a_n) + (a_(n-1)10^(n-1)+dots+a_0)$ is divisible by $2^n$ iff the last digits (here $a_(n-1) dots a_0$) are divisible by $0$  \

Since, by rules of modular arithmetic if $10^n (a_(n+i) 10^i + dots + a_n) equiv 0 (mod 2^n)$ and $(a_(n-1)10^(n-1)+dots+a_0) equiv 0 (mod 2^n)$ and since $N$ is a sum of these two terms then if their sum is divisible by $2^n$ then $N$ will also be divisible by $2^n$.    

])
#pagebreak()
#prob([a. Let $N = a_m 10^m + dots + a_2 10^2 + a_1 10 + a_0$, where $0 lt.eq a_k lt.eq 9$ be the decimal expansion of a positive integer $N$. Prove that $7,11,"and" 13$ all divide $N$ if and only if $7,11,"and" 13$ divide the integer $M = (100 a_2 + 100 a_1 + a_0)-(100 a_5 + 100 a_4 + a_3)+(100 a_8 + 100 a_7 + a_6) - dots$ \

[Hint: If $n$ is even, then $10^(3 n) equiv 1, 10^(3n +1) equiv 10, 10^(3n + 2) equiv 100 (mod 1001)$; If $n$ is odd, then $10^(3 n) equiv -1, 10^(3 n + 1) equiv -10, 10^(3 n + 2) equiv -100 (mod 1001)$   ]  

b. Show that the number $29310478561$ is divisible by $7$ and $13$, but not by $11$.    
     ],[

a.

First observe that $7 times 13 times 11 = 1001$ and that $7,11,13$ are all prime. \

Thus, $7,13,11 divides N arrow.double N equiv 0 (mod 1001)$ and similarly, $7,13,11 divides M arrow.double M equiv 0 (mod 1001)$ \

Thus if we can show that $M equiv N (mod 1001)$ then the claim will follow \

Several students believe that there is a typo, and that $M$ should be defined as $ M=(100a_2 + 10a_1 + a_0) - (100a_5+10a_4+a_3)+(100a_8 + 10a_7 + a_6) - ... + ... $  \

Then the claim will hold by the hints given since \ $ a_0 equiv a_0 (mod 1001) \ 10 a_1 equiv 10a_1 (mod 1001) \ 100 a_2 equiv 100 a_2 (mod 1001) \ 10^3 a_3 equiv -1 a_3 (mod 1001) \ 10^4 a_4 equiv -10 a_4 (mod 1001) \ 10^5 a_5equiv -100a^5 (mod 1001) \ 10^6 equiv 1 a_6 (mod 1001) \ dots.v $ (Starting from the fourth equivalence we can start apply the hints) \

Then since these numbers are pairwise congruent mod 1001 we can the numbers on the left column (which are from $N$) and the numbers on the right column (numbers from $M$ ) and maintain congruence mod 1001.\  Therefore $M equiv N (mod 1001)$ and the claim holds. 

b. 

From part a, we know that $29310478561$  is divisible by $7,11,13$ if and only if $561 - 478 + 310 - 29 = 364$ is divisible by $7,11,13$. However, a possible factorization of 364 is $364 = 7 times 13 times 4$ therefore divisibility by 7 and 13 holds. \

In fact, the number does not end in 1 so divisibility by 11 will not hold. Also from class we know that divisibility by 11 holds iff the alternating sum of the digits of a numbers are divisible by 11. But the alternating sum of $29310478561$ is  $1-6+5-8+7-4+0-1+3-9+2 = -10$ .
     ])

#pagebreak()

#prob([An old and somewhat illegible invoice show that 72 canned hams were purchased for $\$ x 67.9 y$ \ Find the missing digits.

 ],[

Since $72=8 times 9$ then $9 divides x 6 7 9 y$  \

A number is divisible by 9 if the sum of its digits is also divisible by 9, therefore $x + 6 + 7 + 9 +y  equiv 0 (mod 9)$ \

If $x+y = 5$ then the result (27) will be divisible by 9. \

After trying a few combinations if $x=3, y=2$ then we have $367.92 \/ 72 = 5.11$ (each can was purchased for $\$5.11$) (the decimal point doesn't matter since everything is in base 10)  

 ])

#pagebreak()

 #prob([Prove that there exist one million consecutive integers, each of which is divisible
by the cube of an integer > 1],[

Since there are infinitely many primes, it follows that there are infinitely many cubes of primes that are coprime with eachother. \

Pick 1 million consecutive coprime cubes of integers, and assume there exist 1 million consecutive integers that are divisible by each corresponding cube. Then the chinese remainder theorem guarantees that this is true (the unique $x$ is 0) (see below) \

$qed$ \

The chinese remainder theorem states that there exist unique $x$ such the following congruences hold: $ x equiv a_1 (mod n_1) dots x equiv a_k (mod n_k) $ 

as long as $n_1, dots, n_k$ are coprime and $0 lt.eq a_i lt.eq n_i$  

])