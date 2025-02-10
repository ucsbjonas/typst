#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A lecture notes"
#let author = "Alice Bob"

#show: notes.with(title, author)

== January 7

Basic Properties : What questions are studied in this subject?

#remark(
  [Fermat (1636): Every positive integer can be represented as a sum of the squares of four integers \ e.g. $1 = 1^2 + 0^2 + 0^2 + 0^2$ \ e.g. $7 = 2^2 + 1^2 + 1^2 + 1^2$ \ e.g. $10 = 2^2 + 2^2 + 1^2 + 1^2$ \

    Langrange published the first proof in 1770

  ],
)

#defn(
  [prime number],
  [A positive integer p is prime if its only positive divisors are 1 and p. (should be greater than 1)],
)

#remark([Euclid proved that there are inifinitely many primes])

#remark(
  [Fermat: All numbers of the form $f_n := 2^2^n + 1$ are prime. \ Therefore, for example, $641 | 2^2^5 + 1$ (check this)],
)

#remark(
  [Gauss: A regular polygon with $m$ sides can be constructed as using straight edge and compasses alone iff $m = 2^k dot f_n_1 dot f_n_2 dot dots dot f_n_r$ (check
    this)],
)

#remark(
  [How are the primes distributed? \

    $pi(x) = |{n lt.eq x : "n is prime"}|$ \

    How does $pi(x)$ grow with $x$? \

    Gauss used tables of primes to guess the answer e.g. look at values $(pi(x) - pi(x-1000))/1000$ for large $x$ i.e.
    frequency of primes in [x - 1000, x] \

    He noticed that this frequency call it $Delta(x)$ seems to be slowly decreasing. He then noticed that $1/Delta(x) tilde.equiv 1 / log(x)$ (for
    log base $e$ ) so that $pi(x) approx int_2^x dt/(log t)$ \

    Then, if we define $"li"(x) = int_2^x dt/(log t)$ then the following conjecture was made: $ lim_(x arrow infty) (pi(x))/("li"(x)) = 1 $ \

    And later proved by Hadamard using complex variable theory

  ],
)

== Properties of $ZZ$

#prop(
  [properties of $ZZ$ \ 1. cancellation law: if ab = ac then b = c as long as $a eq.not 0$ ($ZZ$ is said to be a domain or
    an integral domain) \ 2. $ZZ$ is ordered therefore $ZZ^+$ is closed under addition and multiplication and for every $a eq.not 0$ exactly
    one of a, -a belongs to $ZZ^+$. Define $a gt b$ to mean $a - b in ZZ^+$ \ 3. $ZZ^+$ is well ordered: Every non-empty set
    of positive integers has a smallest element. (note that $QQ, RR$ are NOT well-ordered) ],
  [],
)

#remark([We can partiion the integers into three classes: \

  1. Units $pm 1$ (i.e. integers with reciprocals in $ZZ$)\

  2. Prime numbers (i.e. integers $n$ for which we cannot have $n = a b$ with $a,b in ZZ$ and $a,b$ not units)\

  3. Composite numbers (the rest)

])

#defn(
  [If $m,n$ are integers, we say that $m$ divides $n$ (written $m | n$) if there exists an integer $t$ such that $n = m t$.
    Otherwise write $m |! n$],
  [

  ],
)

 == Types of proofs:

#thm(
  [],
  [Every integer $n > 1$ is divisible by a positive prime.],
  [Suppose that $n > 1$ has no positive prime divisor. Then $n$ is not prime, and we may write $n = a b$, with $a$ and $b$ not
    units. Then $n = |a| dot |b| $ and $|a| lt n$ since $|b| gt 1$. \

    Set $n_1 = |a|$. Then $n_1 gt 1$ and $n_1$ has no prime divisor \

    Now repeat the above argument with $n_1$ in place of $n$ to produce an integer $n_2$ with $1 < n_2 < n_1$ and such that $n_2$ has
    no prime divisor. Continuing in this way, we produce a non-empty set of positive integers $n_1, n_2, dots$ having no
    smallest integer. \

    However, this contradicts the well-ordering principle.

  ],
)

#thm(
  [],
  [There are infinitely many positive primes],
  [

    Suppose that there are only finitely many positive primes. \

    Consider the integer $N = p_1 dots p_2 dots p_r + 1$. Then $p_i$ does not divide $N$ for all $i$, but $N > 1$ and our
    previous result shows that $N$ is divisible by some prime. Henve there is a prime $p$ distinct from $p_1, dots, p_r$ such
    that p divides N. (this leads to a contradiction)

  ],
)

no class next tuesday yay

#thm([],[There is no integer between 0 and 1],[

Suppose that there exists $m in ZZ$ such that $0 < m < 1$. Then we have $ 0 < m^2 < m < 1 arrow.double \ 0 < m^3 < m^2< m < 1 arrow.double \ 0 < m^4 < m^3 < dots $

and so we obtain an infinite set of positive integers with no smallest element. This contradicts the well-ordering principle.

])

#thm([],[The real number $e$ is irrational],[

We know that $ e = 1 + 1/1! + 1/2! + dots$. \

So for each $n in ZZ^+$, we have $ n! e = n!/1 + n!/2 + dots + n!/n! + n!/(n+1)! + dots$ \

Suppose that $e$ were irrational then $e = a/b$, with $a,b in ZZ$. If this is true, then \

$n! a/b = q_n + n!/(n+1)! + dots$ \

set $r_n := n! a - q_n b$ \

$r_n = n! a - q_n b = b(n!/(n+1)! + n!/(n+2)!)$ \ 

Since $r_n in ZZ$ we have $r_n < b/(n+1) + b(1/((n+1)(n+2)) + 1/((n+2)(n+3)) + dots) = b/(n+1) + b((1/(n+1)-1/(n+2))+ (1/(n+2)-1/(n+3))+ dots) = b/(n+1) + b/(n+1) = 2b/(n+1) $ \

Hence if $n gt.eq 2b$ we have $0 < r_n < 2b/(n+1) < 1$ which is a contradiction by the previous theorem (hence $e$ is irrational)

])

#thm([Principle of Induction],[If a set $S$ of integers contain $n_0$, and if $S$ contains $n+1$ whenever it contains $n$, then $S$ contains all integers greater than or equal to $n_0$],[

Suppose that $m$ is an integer with $m > n_0$, and $m in.not S$. Then $m-1 in.not S$ for otherwise, since $m = (m-1) + 1$ we would have $m in S$ \

Hence $m - 1 eq.not n_0$ therefore $m - 1 > n_0$. Now we can continue to repeat the argument and thereby obtain a contradiction to the well ordering principle

])


#thm([Birrchlet's pigeonhole principle],[suppose that a set of $n$ elements is partitioned with $m$ subsets with $1 lt.eq m < n$. Then some subset must contain more than one of the elements.],[])

== Back to number theory
#prop([Every natural number greater than 1 is either a prime or can be written as a product of primes.],[

Proof via induction : \

Let $n in ZZ^+$. If $n$ is prime, then there is nothing to prove. \

However if $n$ is composite we can write $n = a b$ with $0 < a,b < n$. By induction $a$ and $b$ are either primes or expressible as a product of primes, and so substituting for $n$ yields an expression for $n$ as a product of primes.

])

#thm([Fundamental theorem of arithmetic],[Any natural number greater than 1 can be represented in one and only one way as a product of primes],[

Let $P(n)$ denote the statement "$n$ can be written uniquely as a product of primes" \

observe that 2 is prime, so that $P(2)$ is true. \

Suppose for inductive hypothesis that $k$ is an integer such that $P(t)$ is true for all integers $t$ satisfying $2 lt.eq t lt.eq k$ \

Consider $k +1$. If this is prime, then we are trivially done. \

Suppose $k + 1$ is composite (so that it has at least 2 prime factors) and (for contradiction) has 2 distinct representations as products of primes: \ $k + 1 = p q r ... = p' q' r' ...$ \

(Note that the same prime cannot be in both representations (as P(t) is true for all $2 lt.eq t lt.eq k$)) \

Suppose WLOG that $p$ and $p'$ are the smallest primes occuring in each factorization \

Since $k+1$ is composite, we have $k+1 gt.eq p^2$ and $k+1 gt.eq p'^2$ and since $p eq.not p'$ then at least one of these ineuqalities is a strict inequality, therefore $k + 1 > p p'$ \

Consider $k+1 - p p'$ which by induction hypothesis can be written uniquely as a product of primes. Since this quantity is divisible by both $p$ and $p'$, we have the prime factorization $k + 1 - p p' = p p' Q R dots$ implies $ p p'$ divides $k + 1$, this implies that ... 
])

#remark([Consequences of Fundamental theorem of arithmetic. \

suppose that the prime factorisation of $n in ZZ^+$ is given by $n = p_1^(q_1) p_2^(q_2) dots p_r^(q_r)$ with $p_1, dots, p_2$ distinct primes. The divisors of $n$ consist of all products of the form $p_1^(alpha_1) dots p_r^(alpha_r)$ where $ 0 lt.eq alpha_i lt.eq q_i$ and the total number of choices is $(alpha_1 + 1)(alpha_2 + 1) dots (alpha_r + 1) = prod_(i=1)^r (alpha_i + 1)$ \

let $d(n)$ be the number of divisors of $n$ \

We may consider the sum $sigma(n)$ of all divisors of $n$ (including 1 and n). We have that $sigma(n) = (1 + p_1 + p_1^2 + dots + p_1^(q_1))  (1 + p_2 + p_2^2 dots  p_2^(q_2))  dots  (1 + p_r + p_3^r + dots + p_1^(q_r))$ \

when we multiply this expression it is the sum of all possible products of the sum $p_1^(alpha_1) p_2^(alpha_2) dots p_r^(alpha_r)$ \

(this is probably in the book)

])

== January 16

#defn([],[A positive number n is said to be perfect if the sum of the divisors of n including 1 and excluding n is equal to n]) 

#thm([(by Euclid)],[Suppose that $p$ is a prime such that $p+1 = 2^k$ for some $k > 0$. Then $2^(k-1) dot p$ is pefect. ],[

Took a picture

])

#thm([(Euler)], [Every even perfect numbers is of the form $2^(k-1) dot p$, where $p+1 = 2^k$], [Did not do in class])

#remark([are there any odd perfect numbers (open question)]) \

#prop([If $m,n$ have common prime factors, we may obtain the greatest common divisor or highest common factor (HCF) of $m$ and $n$ by multiplying together the various common prime factors of $m$ and  $n$, each of these being taken to the highest power to which it divides both $m$ and $n$],[

For example, $3132 = 2^2 dot 3^3 dot 29$ and $7200 = 2^5 dot 3^2 dot 5^2$ then the highest common factor is $2^2 dot 3^2 = 36$  

])

#thm([division theorem],[If $a$ is any integer and $b in ZZ^+$, then there exists exactly one pair of integers $q$ and $r$ such that the condition $a = b q + r$ where $0 lt.eq r lt b$ hold. (the number $q$ is called the quotient and $r$ is the remainder when $a$ is divided by $b$)        ],[look it up]) \

#algo([Euclid's algorithm],[Finds the highest common factor of two positive integers $a$ and $b$. Suppose that $a > b$. Then $  a = q b + c, 0 lt.eq c lt b $ \ 


Any common divisor of a and b is also a common divisor of b and c. So we've reduced the problem to finding the highest comon factor of b and c (which are respectively less than and b). \

i.e. the problem we are solving is $b = r c + d, 0 lt.eq d lt c$ \

The common divisors of $b$ and $c$ are the same as those of $c$ and $d$. etc. \

We can repeat this process until we arrive at a number which is a divisor of the preceding number. \ ])

#defn([],[Suppose that $a,b in ZZ^+$. Say that $n in ZZ$ is linearly dependent on $a$ and $b$ if it can be written in the form $n = a x - b y$ for some $x, y in ZZ^+$. \

Remarks: \

(i) Any number representable in the form $a x - b y$ can also be represented in the form $b y' - a x'$ with $x', y' in ZZ^+ union {0}$  \

Observe that $a x - b y = b y' - a x' arrow.double.r.l a(x + x') = b (y + y')$. To ensure that this last equality holds, take any integer $m$ such that $m b > x$ and $m a > y$. \

Then define $x'$ and $y'$ by $x + x' = m b, y + y' = m a$. \

(ii) If $n$ is linearly dependent on $a$ and $b$, then so is $k n$ for any integer $k$ \

(iii) If $n_1, n_2$ are (both)linearly dependent on $a,b$ then so is $n_1 + n_2$ \   
      ])

We come to an interesting property of the HCF: \

#thm([],[The HCF $h$ of two positive integers $a$ and $b$ is representable in the form $h = a x - b y$ where $x,y in NN$ \
     ],[

Consider the stpes involved in Euclid's algorithm. Observe that $a,b$ are linearly dependent on $a,b$ since $a = a(b+1)-b a, b = a b - b(a -1)$. \

Now we have $a = q b + c$. So, since $b$ is linearly dep on a,b so is $q^b$. Hence $c = a - q b$ is linearly dependent on $a,b$. Continue in this way to deduce that the last remainder is the applicatino of the algorithm, i.e. $h$ is linearly dependent on a,b.     \

Example: took a picture (this seems important)
     ]) \

#remark([Here is a problem: suppose that $a,b in ZZ_(gt.eq 0)$. Find $x, y in ZZ$ such that $a x + b y = n$ ($dagger$) \ This is an example of a Diophantine Euqation (it does not determine $x,y$ uniquely. ) \

Remakrs: \

1. Note that ($dagger$) cannot be solved unless $n$ is a multiple of the HCF $h$ of $a,b$ since $h divides (a x + b y)$ \

2. Suppose that $n = m h$. Then $dagger$ can be solved. First solve $a x_1 + b y_1 = h$. We've already seen: set $x = m x_1$ and $y = m y_1$      
  ])


#pagebreak()

== January 21

Last time: diophantine equations \

#remark([ Solving Diophantine Equations: \

Suppose that $a,b,n in ZZ_(gt.eq 0)$. Find $x,y in ZZ$ such that $a x + b y = n$ $(dagger)$ \

Remarks: \

1. $(dagger)$ cannot be solved unless $n$ is a multiple of $h := "gcf"(a,b)$, since $h | (a x + b y)$    

2. Suppose that $n = m h$ Then $(dagger)$ can always be solved. \

First, solve $a x_1 + b y_1 = h$ \

Then set $x = m x_1, y = m y_1$ \

In fact, $(dagger)$ is solvable with $x,y in ZZ$ if and only iff $n$ is a multiple of $h$. So, if $h = 1$ then $(dagger)$ is solvable for all $n in NN$ (and also for $n in ZZ$). 

3. Suppose that $h=1$ and that $(x,y), (x', y')$ are two distinct solutions of $(dagger)$ . Then $a(x - x') + b(y - y') = n -n = 0 $. \ Therefore $a/b = (-y(y-y'))/(x - x')$ \

Since $a,b$ are coprime there exists $t in ZZ$ such that $y - y' = -a t$ and $x - x' = b t$ \ 

Additionally, any integers of the form $y = y' - a t$ and $x = x' + b t$ satisfy $(dagger)$ \

So if $h = 1$ then a general solution of  $(dagger)$ is $x = x' + b t, y = y' - a t$   

4. Now suppose that $h > 1$, and $n = m h$ so $(dagger)$ has a solution. Then $a x + b y = n = m h arrow.double.r.l a/h x + b/h y = m$. \ Since the HCF of $a/h, b/h$ is 1, we've already dealt with this case: the general solution is $x = x_0 + b/h t$, $y = y_0 - (a/h)t$ $(t in ZZ)$ where $x_0, y_0$ is a solution of  $(dagger)$ \          

])

#example([: Solve two variable diophantine equation],[Find the general solution of $69 x + 39 y = 15$ (if it exists) \


First determine if the equation is solvable: find the HCF of 69,39: \

69 = 39 times 1 + 30 \ 39 = 30 times 1 + 9 \ 30 = 9 times 3 + 3 \ 9 = 3 times 3
\ Therefore the equation is solvable, since $3 divides 15$ \

Next: $69/3 x + 39/3 y = 15 arrow.double.l.r 23 x + 13 y = 5 $ \

From the Euclidean algorithm, we obtain $3 = 30 - 9 times 3 = 4(69 - 39 times 1) - 3 times 39= 4 times 69 - 7 times 39$. Therefore $x=4, y=-7$ is a solution of $69 x + 39 y = 3$ and $23 x + 13 y = 1$. \

Then, $x_0 = 4 times 5, y_0 = -7 times 5$ is a solution of $69 x + 39 y = 15$ \ 

And a general solution of $(dagger)$ is $x = 20 + 13 t, y = -35 - 23 t$ \ ])

=== Chatper 2 Congruences

#defn([Congruent modulo m],[Suppose that $a, b in ZZ$. We say that $a$ is congruent to $b$ modulo $m$ and write $a equiv b (mod m)$ or $a equiv b (m)$ \ (Informally, "equality except for the addition of some multiple of m") \

Examples: $63 equiv 0 mod 3, 7 equiv -1 mod 8, 5^2 equiv -1 mod 13$ \

Additionally, note that $x equiv y mod 2 arrow.double.l.r$ x and y are both even or x and y are both odd        ])

#remark([If $a equiv alpha, b equiv beta$ mod $m$ then $ a+ b equiv alpha + beta mod m, \ a - b equiv alpha - beta mod m, \ a b equiv alpha beta mod m $  Proof: \

Since $a equiv alpha mod m$ and $b equiv beta mod m$ it follows that $a = alpha + k_1 m, b = beta + k_2 m$ for some integers $k_1, k_2$ hence $a + b = alpha + k_1 m + beta + k_2 m = alpha + beta + m (k_1 + k_2)$. Therefore $(a + b) - (alpha - beta)$ is divisible by $m$, and so $ a + b equiv alpha + beta mod m$ $qed$])

#remark([If $a = alpha m$, then $k a equiv k alpha m$ for any $k in ZZ$   ])

#remark([It is true that $42 equiv 12 mod 10$ however $42/6 equiv.not 12/6 mod 10$ \

However, we CAN cancel factors if they are coprime to the modulus. \

i.e. suppose that $a x equiv a y mod m$ with $a,m$ coprime then $ m divides a(x-y)$ and this implies $m divides (x-y)$ i.e. $x equiv y mod m$     

  ])


#remark([Suppose that $n = a_m dot 10^m + a_(m-1) dot 10^(m-1) + dots + a_1 dot 10 + a_0$. \ Observe that $n equiv a_0 mod 2$. Therefore $n$ is divisible by 2 if and only if $a_0$ (the last digit of $n$) is divisible by 2 \ 

Next, notice that $10 equiv 1 mod 3$. Therefore $n equiv a_m + a_(m-1) + dots + a_1 + a_0 mod 3$. In other words, the sum of the digits of $n$ is divisible by 3 if and only if $n$ is divisible by 3. \

Observe that $10 equiv 0 mod 5$ and so $n equiv a_0 mod 5$. Therefore $n equiv 0 mod 5$ iff $a_0 equiv 0 mod 5$ (i.e. $n$ is divisible by 5 if and only if the last digit of $n$ is divisible by 5  ) \

Observe that $10 equiv 1 mod 9$ (similar to 3, $n$ is divisible by 9 iff the sum of its digits is divisble by 9 ) \

Observe that $10 equiv -1 mod 11$. Hence $n equiv a_m dot (-1)^m + a_(m-1) dot (-1)^(m-1) + dots + a_1 dot (-1) + a_0$. (i.e. $n$ is divisble by 11 if and only if the alternating sum of the digits of $n$ is divisible by 11) \  ])

#remark([Notice that $7 dot 11 dot 13 = 10^3 + 1$ \ 

Any integer is congruent modulo $m$ to exactly one of the numbers ${0,1,2,dots,m-1}$. This set of numbers is called a complete set of residues modulo $m$. \

])

#remark(["Congruence modulo m" is an equivalence relation on $ZZ$ \  ])

== January 23

Notation: If $a,b in ZZ $ then we write $(a,b)$ for the HCF of $a$ and $b$ \

#defn([Linear Congruences],[A linear congruence is of the form $a x equiv b (mod m)$ $(dagger)$
  ])

#thm([],[The congruence $(dagger)$ can be solved if and only if $(a,m) divides b$  ],[

Since $(a,m) divides a$ and $(a,m) divides m$ it foolows that if $(dagger)$ is solvable, then we must have $(a,m) divides b$ \


For the converse, set $d=(a,m)$, and suupose that $d divides b$. Let $a' = a/d, b' = b/d, m' = m/d$ \

Then to solve $dagger$ it suffices to solve $a' x equiv b' (mod m') (dagger dagger)$ \

Now (due to properties of gcf) we have $(a',m')=1$, and as $x$ runs through a complete set of residues $mod m'$, so does $a' x$ (since there are $m'$ of these numbers, no two of which are congruent modulo m' ) \

Hence $(dagger dagger)$ has precisely one solution modulo $m'$ \

If $y$ is any solution of $a' x equiv b' (mod m')$, then the complete set of solutions modulo  $m$ of $(dagger)$ is given by   $x = y, x = y + m', x = y + 2m', dots, x = y + (d-1)m'$   
])

#example([],[Consider $3 x equiv 5 (mod 11)$ 

A complete set of residues mod 11 is ${0,1,2,dots,10}$ \

Another complete set of residuces is ${0,3,6,9,12,15,18,21,24,27,30}$ mod 11 \

and these are congruent modulo 11 respectively to $0,3,6,9,1,4,7,10,2,5,8$ respectively. \ The value 5 occurs when $x = 9$  

])

#example([],[

Complete set of residues of 6 is ${0,1,2,3,4,5}$ \

If we multiply this set with something coprime to 6 then ${0,5,10,15,20,25}$ is still complete set of residues \

However if we multiply by something that is not coprime to 6, such as 2, then the set ${0,2,4,6,8,10}$ is not a complete set of residues as they are confruent to ${0,2,4,0,2,4}$ (mod 6) \

recall that $a x equiv a y (mod m)$, $a$ can be canceld iff $(a,m)=1$ (from 1.6.7)   

]) 

#cor([],[The above implies that $a x equiv b (mod p)$ is solvable where $p$ is prime.],[])

#remark([The congruence $a x equiv b (mod m)$ is equivalent to the equation $a x = b + m y$ i.e. $a x - m y = b$. We have seen that this diophantine equation can be solved if any only if $b$ is a multiple of $(a,m)$]) 

#thm([Chinese Remainder],[Suppose that $n_1, dots, n_k in ZZ^+$ and that $(n_i, n_j) = 1$ for $i eq.not j$ (i.e. pairwise coprime) \ Then, for any $c_1, dots, c_k in ZZ$ there is an integer $x$ satisfying $x equiv c_j (mod n_j), 1 lt.eq j lt.eq k$ $(dagger)$ ],[

Let $n = n_1 dot n_2dots n_k$ and set $m_j = n/n_j$ for $(1 lt.eq j lt.eq k)$. Then $(m_j, n_j)=1$ and so there exists an integer $x_j$ such that $m_j x_j equiv c_j (mod n_j) (dagger)$ \ The integer $x = m_1 x_1 + dots + m_k x_k$ satisfies $x equiv c_j (mod n_j)$])

#remark([Let $x = m_1 x_1 + dots m_2 x_2 + dots + m_k x_k$ \

Consider $x$ mod $n_2$. We have $x equiv 0 + m_2 x_2 + 0 + 0 + dots + 0 (mod n_2)equiv c_2 (mod n_2)$   
 ])

 #remark([Infact, there is a unique solution to the congruence $(dagger)$ modulo $n = n_1 dots n_k$. \
 
 Proof: suppose that $x,y$ are solutions to $(dagger)$ Then we have $x equiv y (mod n_j)$ i.e. $x - y equiv 0 (mod n_j)$. \   

 Since the integers $n_j$ are pairwise coprime, this implies that $x - y equiv 0 (mod n)$ i.e. $x equiv y mod(n)$   
 
   ])

#example([],[Consider $x equiv 2 (mod 5), x equiv 3 (mod 7), x equiv 4 (mod 11)$. \

Therefore $n_1 = 5, n_2, = 7, n_3 = 11$ and $n = 5 dot 7 dot 11$ so that $m_1 = 77, m_2 = 55, m_3 = 35$  \ Hence we must solve: $77 x_1 equiv 2 (mod 5), 55 x_2 equiv 3 (mod 7), 35 x_3 equiv 4 (mod 11)$  \

Which can be simplified to $2 x_1 equiv 2 (mod 5), 6 x_2 equiv 3 (mod 7), 2 x_3 equiv 4 (mod 11)$ \

A solution is given by $x = 77 x_1 + 55 x_2 + 35 x_3$ and we can take $x_1 = 1, x_2 = 4, x_3 = 2$ which give $x = 367$   
 ]) 

#defn([Order of x],[Suppose that $m in ZZ^+$ and $x in ZZ$ with $(m,x)=1$. The order of $x (mod m)$ is the smallest positive integer $l$ satisfying $x^l equiv 1 (mod m)$ \

#example([],[the powers of $3 mod 11$ are $3,9,5,4,1,3,9,dots$. Then the order of $3 mod 11$ is 5])

#prop([$x^n equiv 1 mod(m) arrow.double.l.r n "is a multiple of" l$. Where $l$ is the order of $x mod m$.   ],[We have $n = q l + r, 0 lt.eq r lt.eq l - 1$. Therefore $x^n = x^(q l) dot x^r$ = x^r . We have that $x^r = 1$ iff $r=0$   ])

        ])

 #thm([Fremat's Little Theorem],[

Suppose that $m in Z^+$ and let $x in ZZ$ with $(m,x)=1$ . Consider the sequence $x, x^2, x^3, dots$ \

Then there exist $k,h$ with $x^k equiv x^h (mod m)$. \

Since $(x,m)=1$ this implies that $x^(h-k) equiv 1 (mod m)$  

 ],[])

 == January 28

 We finish Fermat's Little Theorem:

 #defn([Fermat's Little Theorem],[

Suppose that $m in ZZ^+$ and $x in ZZ$ with $(m,x)=1$. The order of $x mod m$ is the smallest positive integer $l$ satisfying $x^l equiv 1 (mod m)$

#prop([We have that $x^n equiv 1 (mod m)$ if and only if $n$ is a multiple of $l$   ],[])



 ])


#remark([Suppose that $p$ is a prime number. Let $1 lt.eq r lt.eq p-1$ be an integer. Recall that $vec(p,r) = (p!)/((p-r)! r!)$ \

We therefore see that $p divides vec(p,r)$ i.e. $vec(p,r) equiv 0 (mod p)$ \

Now suppose that $x,y$ are intleterninates. Then $ (x+y)^p = vec(p,1) x^(p-1)y + dot + vec(p, 1) x^(p dot r) y^r + dots + p x y^(p-1) + y^p $ $ equiv x^p + y^p (mod p) $   

Hence one can show by induction that $(x_1+x_2+dots+x_n equiv x_1^p + x_2^p + dots + x_n^p (mod p))$ 
   ])

#thm([Fermat's Little Theorem],[Suppose that $p$ is a prime number and that $x equiv.not 0 (mod p)$. Then $x^(p-1) equiv 1 (mod p)$   ],[

We have $x = 1 + 1 + dots + 1$ (x times) therefore $x^p = (1+1+dots+1)^p equiv 1^p+1^p+dots+1^p (mod p) equiv x (mod p)$. Since $(x,p)=1$ this implies that $x^(p-1) equiv 1 (mod p)$ \

Second proof: Consider the numbers $x, 2x, 3x, dots, (p-1)x$. There are $p-1$ numbers in this set and no two fo them are congruent modulo $p$. Here this set forms a complete set of non-zero residues modulo $p$, and are congruent (in some order) to $1,2,3,dots,p-1$ \

Therefore $x dot 2x dot 3x dots (p-1)x equiv 1 dot 2 dot 3 dots (p-1) (mod p)$ i.e. $x^(p-1) dot (p-1)! equiv (p-1)! (mod p)$ \ 

Since $(p, (p-1)!) = 1$, it foolows that $x^(p-1) equiv 1 (mod p)$  
])

#defn([Euler $phi.alt$ function ],[

Suppose that $m in ZZ^+$. Then $phi.alt(m)$ is defined to be the number of elements in the set $1,2,dots, m-1$ that are coprime to $m$. \

Example: suppose that $p$ is a prime. then $phi.alt(p) = p-1$  

])

#thm([Euler's],[

Suppose that $ m in ZZ^+$ and that $(x,m)=1$. Then $x^(phi.alt(m)) equiv 1$    

],[

Let $alpha_1, alpha_2, dots, alpha_(phi.alt(m))$ denote the elements of the set ${1,2,dots,m-1}$ that are coprime to $m$. \

Then the numbers $x dot alpha_1, dots, x dot alpha_(phi.alt(m))$ are congruent (in some order) to the numbers $alpha_1, dots, alpha_(phi.alt(m))$ \

In other words $x alpha_1 dots x alpha_(phi.alt(m)) equiv alpha_1 dots alpha_(phi.alt(m)) (mod m)$ \ 

i.e. $x^(phi.alt(m)) dot alpha_1 dots alpha_(phi.alt(m)) equiv alpha_1 dots alpha_(phi.alt(m)) (mod m)$. Hence $x^(phi.alt(m)) equiv 1 (mod m)$.  

])

#example([],[Take $m=20$, the positive integers less than 20 and corpime to $20$ are $1,3,7,9,11,13,17,19$ Therefore $phi.alt(m) = 8$. Note that if we multiply this set of numbers of 3 then none of the new numbers will be congruent to 20. i.e. the residues would be $3,9,1,7,13,19,11,17 (mod 20)$. \

We have $3^8 equiv 1 (mod 20)$ and (note that  $3^8 = 6561$)])


#thm([Wilson's Theofrem],[If $p$ is a prime, then $(p-1)! equiv 1 (mod p)$  ],[

Suppose that $p>3$. (the cases $p=2,3$ are clear.) \

Consider the set of integers $S = {1,2,3,dots,p-1}$ \

For each $a in S$ there exists a unique $a' in S$ such that $ a a' equiv 1 (mod p)$  \

If $a = a'$ then  we have $a^2 equiv 1 (mod p) iff a^2 - 1 equiv 0 (mod p) iff (a-1)(a+1) (mod p) equiv 0 iff a-1 equiv 0 (mod p) arrow.double a equiv 1 (mod p) "or" a + 1 equiv 0 (mod p) arrow.double a equiv -1 (mod p)$ \

So the set of integers ${2,3,dots,p-2}$ may be grouped into pairs $a, a'$ such that $a equiv.not a'$ and $a a' equiv 1 (mod p)$, Hence it follows that $ 2 dot 3 dot dots dot (p-2) equiv 1 (mod p) arrow.double 2 dot 3 dot dots dot (p-2)(p-1) equiv p-1 (mod p) equiv -1 (mod p) $ i.e. $(p-1)! equiv -1 (mod p)$     

])

#example([],[Let $p=13$ and consider the integers $2,3,dots,11$ . \

We have $2 dot 7 equiv 1 (mod 13) \ 3 dot 9 equiv 1 (mod 13) \ 4 dot 10 equiv 1 (mod 13) \ 5 dot 8 equiv 1 (mod 13) \ 6 dot 11 equiv 1 (mod 13) $ \

So $11! = (2 dot 7)(3 dot 9)(4 dot 10)(5 dot 8)(6 dot 11) equiv 1 (mod 13)$. \
Therefore $12! equiv 12 equiv -1  (mod 13)$  

 ])

 The converse of Wilson's theorem is also true: \

#thm([converse of Wilson's theorem],[

Suppose that $(n-1)! equiv -1 (mod n)$. Then $n$ is prime.  

],[

Suppose that $n$ is not prime and let $d$ be a divisor of $n$ with $1 < d< n$. Then $d divides (n-1)!$. Since $n divides {(n-1)! + 1}$  by hopothesis, it follows that $d divides {(n-1)! + 1}$ also. This in turn implies that $d divides 1$, which is a contradiction. \

Although, this is completely useless as a primarlity test

])

#thm([],[Suppose that $p$ is an odd prime. Then the quadratic congruence $x^2 + 1 equiv 0 (mod p)$ has a solution #iff $p equiv 1 (mod 4)$   ],[

Suppose that $a$ is a solution of $x^2 + 1 equiv 0 (mod p)$, so $a^2 equiv -1 (mod p)$ Since $p divides.not a$ then Fermat's little theorem implies $1 equiv a^(p-1) (mod p) equiv (a^2)^((p-1)/2) equiv (-1)^((p-1)/2) (mod p) (dagger)$ \

Now suppose that $p = 4 k + 3$ for some $k$. Then $(-1)^((p-1)/2) = (-1)^(2k + 1) = -1$ and so $(dagger)$ implies that $-1 equiv 1 (mod p)$. This implies that $p divides 2$, which is a contradiction. Hence it follows that $p$ must be of the form $4k + 1$  \

Conversely, suppose that $p = 4 k + 1$ for some $k$. \ Then $(p-1)! = 1 dot 2 dot 3 dot dots dot (p-1)/2 dot (p+1)/2 dot dots dot (p-2) dot (p-1) (*)$   \

As a side note, note that we have the congruences $p-1 equiv -1 (mod p), p-2 equiv -2 (mod p), dots, (p+1)/2 equiv -(p-1)/2 (mod p)$ \

Rearranging the factors of $(*)$ gives $(p-1)! equiv 1(-1) dot 2(-2) dot dots dot (p-1)/2 (-(p-1))/2 equiv (-1)^((p-1)/2) (1 dot 2 dots dot (p-1)/2)^2 equiv (-1)^((p-1)/2) [((p-1)/2)!]^2$ and by wilson's theorem we obtain $-1 equiv (-1)^((p-1)/2) [((p-1)/2)!]^2 equiv (1)[((p-1)/2)!]^2$ and therefore we know that $[((p-1)/2)!]^2$ is a solution to the congruence.    

])

== Jan 30 (Sara Ramirez's notes)

Arithmetical functions

#prop([Suppose $p$ is prime. Then $phi.alt(p^q) = p^(q-1) (p-1)$   ],[

Consider the set of numbers ${0,1,2,dots, p^q -1}$ The only numbers in this set that are not coprime to $p$ are those that are divisible by $p$ i.e. those of the form $p t$ for $t = 0,1,2,dots, p^(q-1) - 1$. Therefore $phi.alt(p^q) = p^q - p^(q-1) = p^(q-1) (p-1)$      

])

#defn([multiplicative function],[Let $n = p_1^a dots p_r^(q_r)$ \ Suppose that $f: ZZ^+ arrow ZZ$ is a function. $f$ is multiplicative if $f(m n) = f(m) f(n)$ whenever $(m,n) = 1$ \ Examples: $f(n) =1 $ and $f(n) = n$ are multiplicative.       ])

#prop([If $f$ is a multiplicative function and $F$ is defined by $F(n) = sum_(d divides n) f(d)$ is also multiplicative.    ],[

Suppose that $m,n in ZZ^+$ such that $(m,n) = 1$ \

Then $ F(m n) = sum_( d divides m n) f(d) = sum_(d_1 divides m, d_2 divides n) f(d_1 d_2) "since" (m,n) = 1 $ \

Recall that $f$ is multiplicative, therefore we have $F(m n) = sum_(d_1 divides m, d_2 divides n) f(d_1) f(d_2) = (sum_(d_1 divides m) f(d_1) (sum_(d_2 divides n) f(d_2)) = F(m) F(n)$   

])

#cor([$d(n), sigma(n)$ are multiplicative ],[

Recall that $d(n) = sum_(d divides n) 1$ and $sigma(n) = sum_(d divides n) d$ \

],[

  Then use the earlier examples of multiplicative functions and the above proposition.
])

#thm([$phi.alt$ is multiplicative (proof 1) ],[We can show thatthe euler function $phi.alt$ is multiplicative ],[

Suppose that $m,n in ZZ$ such that $m,n > 1$ and $(m,n) = 1$, then consider the following array of integers: \

$mat(0,1,2,3,dots, m-1; m,m+1, m+2, m+3, dots, m + (m - 1); dots.v; (n-1)m, (n-1)(m)+1, dots, dots, dots, (n-1)m + (m-1))$ \

The (cool thing) is that this array consists of $m n $ consecutive integers, and so it is a complete set of residues mod $m n$. If follows that $phi.alt(m n)$entries of this array are coprime to $m n$. The first row is a complete set of residues mod m and all the entries in any given column are congruent mod m. Therefore there are exactly $phi.alt(m)$ columns consisting of integers that are coprime to $m$. \ 

Consider such a column, It's entries are of the form $alpha, m + alpha, 2 m + alpha  + dots + (n-1)m alpha $ for some $alpha$.There are $n$ integers, no 2 of which are congruent $mod n$. Therefore there are $phi.alt(n)$ integers in each column that are coprime to $n$

Hence there are $phi.alt(m) phi.alt(n)$ leements in the array that are coprime to both m and n, and hence $m n$. Which shows that $phi.alt$ is multiplicative since i.e. $phi.alt(m n) = phi.alt(m) phi.alt (n)$  

])

#cor([],[$ mat(phi.alt(n) = n prod_(p divides n) ( 1 - 1/p)) $ ],[

Let $n$ have prime factorization $n = p_1^q_1 dots p_k^q_k$ \

Then $phi.alt(n) = phi.alt(p_1^(q_1) dots p_k^q_k) = phi.alt(p_1^q_1) dots phi.alt(p_k^q_k) = p_1^(q_1 -1) (p_1-1) dots p_k^(q_k - 1) (p_k - 1) = p_1^(q_1) (1 - 1/p_1) dots p_k^q_k (1 - 1/p_k) = n prod_(p divides n) (1 - 1/p)$ \

Note that in the third equality we use 0.9.1
]) 


== Feb 4

#thm([$phi.alt$ is multiplicative (proof 2) ],[],[


#cor([],[If $n$ is a positive integer then $phi.alt(n) = n prod_(p divides n)(1 - 1/p)$  ],[

  See the earlier proof
])

2nd proof that $phi.alt$ is multiplicative. \

Let $p_1 dots, p_k$ be distinct prime factors of $n$. Then $ n prod_(p divides n)(1 - 1/p) = n(1-1/p_1)(1-1/p_2)dots(1-1/p_k) = n- sum (n/p_1) + sum (n/(p_1 p_2)) - sum n/(p_1 p_2 p_3) + dots $ \

motivation: suppose that $n = p_1 p_2$ then $n prod_(p divides n)(1 - 1/p) = n (1- 1/p) (1 - 1/p^2) = n - n/p_1 - n/p_2 + n/(p_1 p_2)$ (take away integers that are divisible by $p_1, p_2$ and add back in integers $1 dots n$ that are divisible by $p_1 and p_2$   ) \

Now: $n = sum_(m=1)^n 1$ and note that $n/p_r$ denotes the number of integers in the set ${1,2,dots,n}$ that are divisible by $p_r$ therefore $ sum_(1 lt.eq r lt.eq k) n/p_r = sum_(m=1)^n sum_(1 lt.eq r lt.eq k, P_r divides m) 1 $  

For each integer $m$ with $1 lt.eq m lt.eq n$ let $l(m) :=$ the no. of primes in ${p_1, dots p_k}$ that divide $m$. \


Then we have $ n - sum_(1 lt.eq r lt.eq k) n/p_r + sum_(1 lt.eq s lt r lt.eq k  ) n/(p_r p_s) - sum_(1 lt.eq t lt s lt r lt.eq k) 1/(p_r p_s p_t)+ dots = \ sum_(m=1)^n (1 - sum_(r, P_r divides m) 1 + sum_(r > s, P_r, P_s divides m) 1 - dots) = sum_(m=1)^n (1 - vec(l(m),1) + vec(l(m),1) - vec(l(m),3) + dots) $ \

Let $(1 - vec(l(m),1) + vec(l(m),1) - vec(l(m),3) + dots) (star)$   \

Then if $l(m) = 0$ them $(star)$ is equal to $1$, i.e. if $(m,n) = 1$  then $(star)$ is 1. \

Also, if $l(m) > 0$ them $(star)$ is equal to $(1-1)^(l(m)) = 0$.  \

Then we have $sum_(m=1)^n [(1 - vec(l(m),1) + vec(l(m),2) - vec(l(m),3) + dots)] = sum_(m,(m,n)=1) 1 = phi.alt(n)$  \

$qed$ 
])

#thm([],[Suppose that $n>0$ then $sum_(d divides n) phi.alt(d) = n$  ],[

Proof 1: Let $S = {1,2,dots,n}$. For each $d divides n$ le $C_d = {a in S: (a,n)=d}$ Then $S = union_(d divides n) C_d$ and $C_d sect C_d' = emptyset$ if $d eq.not d'$, \

Now suppose that $a in C_d$. Then we may write $a = b d$ where $1 lt.eq b lt.eq n/d$ and $(b, n/d) = 1$. \

So, $|C_d| = |{a in S: (a,n)=d}| = |{1 lt.eq b lt.eq n/d: (b, n/d) = 1} = phi.alt(n/d)$ \

Hence $n = sum_(d divides n) |C_d| = sum_(d divides n) phi.alt(n/d) = sum_(d divides n) phi.alt(d)$ \

Proof 2: Define a function $F$ by $F(n) = sum_(d divides n) phi.alt(d)$. Then, since $phi.alt$ is multiplicative, we have that $F$ is multiplicative. \

Now suppose that $n = p^j$ where $p$ is prime. Then $F(p^j) = sum_(d divides p^j) phi.alt(d) = sum_(i=0)^j phi.alt(p^i) = 1 + (p-1) + (p^2 - p) + (p^3 - p^2) + dots + (p^j - p^(j-1)) = p_j$ \

])

#defn([$mu$ mobius function ],[

The Mobius function $mu: ZZ^+ arrow Z$ is defined by \

1 if $n = 1$ \
0 if $p^2 divides n $ for some prime $p$ \
$(-1)^r$ if $n = p_1 p_2 dots p_r$ where the $p_i$ are distinct primes. \

For example $mu(2) = 1, mu(6) = 1, mu(4) = 0$ 

])

#thm([],[The function $mu$ is multiplicative ],[

Suppose that $m,n in ZZ^+$ with $(m,n) = 1$. If either $p^2 divides m$ or $p^2 divides n$ for some $p$, them $p^2 divides m n $ and so we have $mu(m n) = 0 = mu(m) dot mu (n)$   \

Suppose therefore that $m,n$ are such that $m = p_1 dot p_r$, $n = q_1 dots q_s$ where $(p_i, q_j)$  are distinct primes. Then $mu(m n) = mu(p_1 dots p_r q_1 dots q_s) = (-1)^(r + s) = (-1)^r dot (-1)^s = mu(m) dot mu(n)$   

])

#thm([],[For each positive integer $n gt.eq 1$, we have $sum_(d divides n) mu(d) = 1 "if n=1", 0 "if n > 1"$  ],[

First observe that $sum_(d divides 1) mu(d) = mu(1) = 1$. \

Now consider the function $F$ defined by $F(n) = sum_(d divides n) mu(d)$. Since $mu$ is multiplicative, we have that $F$ is multiplicative also. Suupose that $p$ is a prime and $k gt.eq 1$. Then $ F(p^k) = sum_(d divides p^k) mu(p^k)  = mu(1) + mu(p) + mu(p^2) + dots + mu(p^k) = mu(1) + mu(p) = 1- 1 = 0 $ \

So if $n gt 1$ with $n = p_1^(k_1) dots p_r^(k_r)$ then $F(n) = F(p_1^(k_1)) dots F(P_r^(k_r))) = 0$   

])

#thm([Mobius Inversion Formula],[
Suppose that $f$ and $F$ are two (not necessarily multiplicative!) functions $f, F: ZZ^+ arrow ZZ$ related by the function $F(n) = sum_(d divides r) f(d)$. Then $f(n) = sum_(d divides n) mu(d) F(n/d) = sum_(d divides n) mu (n/d) F(d)$     
],[

Proof: compute $ sum_(d divides n) mu(d) F(n/d) = sum_(d divides n) (mu(d) sum_(c divides (n/d)) f(c) = sum_(d divides n) ( sum_(c divides (n/d)) mu(d) f(c)) (dagger) $ \

Now observe that $d divides n$ and $c divides n/d iff$ $c divides n$ and $d divides n/c$. To see this: $d divides n arrow.double n = a d, c divides n/d arrow.double alpha = c p$ and so we have $ n = alpha d = c p d arrow.double c divides d "and" d divides n/c$  \ 

Now $sum_(d divides n/c) mu(d) = 0 "if" n eq.not c, 1 "if" n = c (star)$ \

Hence  $ sum_(d divides m) (sum_(c divides n/d) mu(d) f(c)) = sum_(d divides n) (sum_(d divides n/c)f(c) mu(d)) = sum_(c divides n)(f(c) sum_(d divides n/c) mu(d)) (dagger) $ \

Now apply $star$ to the RHS of $(dagger)$ to obtain: $sum_(c divides n)(f(c) sum_(d divides n/c) mu(d) = sum_(c divides n) f(c) sum_(d divides n/c) mu(d) = f(n)$ as required.
])


