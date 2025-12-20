#import "@preview/ergo:0.1.1": *

#import "@local/superTemplate:0.3.0": *
#import math_mod:*
#import pstat_mod:*
#import cs_mod: *

#show: ergo-init.with(colors: "gruvbox-dark", headers: "classic")
#let title = "math111a hw1"
#let author = "jc"
#let date = datetime.today()
#show: assignment.with(title, author, date)

#problem([Let $m $ and $n $ be *coprime* positive integers. Prove that the function $ ZZ \/m n ZZ arrow ZZ slash m ZZ times ZZ slash n ZZ $ $ a mod m n  arrow.r.bar (a mod m, a mod n) $ is well defined and bijective. (This result is commonly known as the Chinese Remainder Theorem). ],[

Well defined: suppose that $a equiv b mod m n$ then according to the funciton definition: $ a mod m n arrow.r.bar (a mod m, a mod n) \ b mod m n arrow.r.bar (b mod m, b mod n) $     

Since $a equiv b mod m n $ then we have $m n divides a - b$ so that $m divides a - b $ and $n divides a - b$ so that $a equiv b mod m$ and $ a equiv b mod n$ and the funcition is well defined (the output does not depend on the choice of representative for $a mod m n$)  

\

Injective: Suppose that $(a mod m, a mod n) = (b mod m, b mod n)$ then $a equiv b mod m$ and $a equiv b mod n arrow.double m divides a-b$ and $n divides a - b$

Since $m,n$ are coprime then their LCM $m n$  must divide $a-b$ i.e. $a equiv b mod m n$  (see problem 2 in the reference)

Surjective: Note that $ZZ slash m n ZZ$ has $m n$ elements. Also note that $|ZZ slash m ZZ| = m$ and $|ZZ slash n ZZ| = n$ so that $ZZ slash m ZZ times ZZ slash n ZZ$ also has $m n $ elements. Since the domain and codomain have the same cardinality we can conclude that the function is surjective.

$qed$ 

References:

https://web.math.ucsb.edu/~marcosreyes/teaching/Fall2021-8/Math_8_Quiz_5_Solutions.pdf


])

#problem([

Which of the following sets are closed under the given operation?

1. ${0,4,8,12}$ under addition modulo 16 
2. ${0,4,8,12}$ under addition modulo 15 
3. ${1,4,7,13}$ under multiplication modulo 15

4. ${1,4,5,7}$ under multiplication modulo 9 

],[

1. This set is closed since we are adding two integers of the form $4 n$ where $n in {0,1,2,3}$ and then taking the remainder modulo 16, which is another multiple of 4

2. Not closed since $4+12 mod 15 = 1 in.not {0,4,8,12}$

3. Closed since all possible multiplications between elements result in another element in the set

4. Not closed since $4*5 mod 9 = 2 in.not {1,4,5,7}$  

])
#problem([

1. Let $n $ and $a $ be positive integers and $gcd(n,a)=d$. Show tha tthe equation $a x mod n = 1$ has a solution iff $d=1$. (Essentially what this excercise says is that an integers $a $ has a multiplicative inverse modulo $n $ iff $a $ and $n $ are coprime.)  

2. Define $(ZZ slash n ZZ)^times$ to be the set of all positive integers less than $n $ and relatively prime to $n $. List out all the elements of $(ZZ slash 20 ZZ)^times$

3. The set $(ZZ slash n Z)^times $ is a group under multiplication modulo $n $ (no need to prove this). Find the inverse of the elements 2,7, and 8 in $(ZZ slash 9 ZZ)^times$ 


],[

1.

$arrow.double.r$  Suppose that $a x equiv 1 (mod n)$ then $n | a x - 1 arrow.double.r a x - 1 = k n arrow.double a x - k n = 1$ for some $k in ZZ$

Since $a,n$ are positive, we can apply Bezout's identity directly: by assumption there exist integers $x$ and $-k$ such that the above holds and conclude that $gcd(n,a)=1$ 

$arrow.double.l$ Suppose that $gcd(n,a)=1$ then by Euler's theorem we have that $a^(phi.alt(n)) equiv 1 (mod n)$ and so $a$ has the multiplicative inverse $a^(phi(n)-1)$ (denoted $x$ in the problem statement)  

2. $(ZZ slash 20 ZZ)^times = {1, 3, 7, 9, 11, 13, 17, 19}$ 

3. The inverses are 5,4, and 8 respectively

Since the modulus is small, we can brute force find these but in general the extended euclidian algorithm can be used


Sources: https://en.wikipedia.org/wiki/Euler%27s_theorem

https://proofwiki.org/wiki/B%C3%A9zout%27s_Identity

])
#pagebreak()
#problem(breakable: true, [

Let $G = {z in CC | z^n = 1 "for some" n in ZZ^plus}$

1. prove that $G$ is a group under multiplication. This group is often called the group of roots of unity in $CC$.

2. prove that $G$ is not a group under addition 

],[

The group of roots of unity $G$ is also equal to $ G = {cos((2 k pi) / n) + i sin ((2 k pi)/n) : k in {0,1,dots,n-1}} $

For $k = 0$ we have $cos(0) + i sin(0) = 1  = (cos((2 pi)/n) + i sin ((2 pi)/n))^0$  

For $k=1 $ we have $cos((2 pi)/n) + i sin ((2 pi)/n)$

For $k=2$ we have $cos ((2 dot 2  pi)/n) + i sin ((2 dot 2 pi)/n) = (cos((2 pi)/n) + i sin ((2 pi)/n))^2 $ by De Moivre's formula

Then for $k = n-1$ we obtain $(cos((2 pi)/n) + i sin ((2 pi)/n))^(n-1)$  

If we let $r = cos((2 pi)/n) + i sin ((2 pi)/n)$ then we can write $G = {r^0, r^1, r^2, dots, r^(n-1)}$ 


1. 
Closure: let $k_1, k_2 in {0,1,dots,n-1}$ and consider the value $r^(k_1) r^(k_2)$  

Since $r in CC$ we have that $r^(k_1) r^(k_2) = r^(k_1 + k_2)$ and we consider three cases: \

$k_1 + k_2 <  n:$ then clearly $r^(k_1) r^(k_2) in G$ \
$k_1 + k_2 = n:$ then $r^(k_1 + k_2) = r^n = (cos((2pi)/n)+i sin ((2 pi)/n))^n = cos(2 pi) + i sin (2 pi) = 1 + i(0) = 1 in G$ \
$k_1 + k_2 > n:$  by the divison theorem $k_1+k_2 = n q + t$ where $0 lt.eq t lt n$ and so we obtain $ r^(k_1 + k_2) = r^(n q + t) = (r^(n))^q r^(t) = (1)^q r^t = r^t in G $

Associativity: let $r^(k_1), r^(k_2), r^(k_3) in G$ where $k_1, k_2, k_3 in {0,1, dots, n-1}$ then $(r^(k_1) r^(k_2)) r^(k_3) = r^(k_1) (r^(k_2) r^(k_3))$ by assosciativty of complex numbers   

Identity: the identity is the element $r^0 = 1 in G$. Then by identity property of complex numbers then for any $a in G$ we will have that $a dot 1 = a = 1 dot a$    

Inverse: the inverse of an element $r^k$ where $k in {0,1,dots,n-1}$ is $r^(n-k)$ since $r^k r^(n-k) = r^(k + n - k) = r^(n) = 1 in G$

Therefore all group properties hold under complex multiplication. $qed$ 

2. Consider $r^0 + r^0 = 1 + 1 = 2$ and that no $n in ZZ^+$ can satisfy $2^n = 1$. Therefore $G$ is not closed under addition and also not a group under addition $qed$    

Sources: \
https://en.wikipedia.org/wiki/Root_of_unity#Group_of_all_roots_of_unity \
https://en.wikipedia.org/wiki/De_Moivre's_formula


])
#problem([

Let $G = {a + b sqrt(2) in RR | a,b in QQ}$

1. Prove that $G $ is a group under addition

2. Prove that the nonzero elements of $G $ form a group under multiplication

],[

Let $x = a + b sqrt(2)$,$y = c + d sqrt(2)$, and $z = e + f sqrt(2)$ where $a,b,c,d,e,f in QQ$ and $x,y,z in G$  be arbitrary elements in $G$ 

1. Closure: let $x,y$ be any two elements in $G$ then we have that $ x+y=a+b sqrt(2) + c + d sqrt(2) = (a+b) + (c+d) sqrt(2) in G $    

Associativity: $(x + y) + z = (a + b sqrt(2) + c + d sqrt(2)) + e + f sqrt(2) = a + b sqrt(2) + (c + d sqrt(2) + e + f sqrt(2)) = x + (y + z)$ by associativty of addition in the real numbers

Identity: The identity element is $e = 0 + 0 sqrt(2) = 0$. It follows that for any element $x in G$ that \ $x+e=x=e+x$ 

Inverse: the inverse of any element $x = a + b sqrt(2) in G$ denoted $x^(-1)$ is $-a-b sqrt(2)$ and it is clear that for any $x in G$ that we have $x + x^(-1) = a + b sqrt(2) - a - b sqrt(2) = 0 = e = 0 = -a - b sqrt(2) + a + b sqrt(2) = x^(-1) + x$ following the usual rules for addition of real numbers

Since all the group properties hold then $G$ is a group $qed$  

2. Closure: let $x,y$ be any two elements in $G$ then $ x y = (a+b sqrt(2)) (c + d sqrt(2)) = a c + sqrt(2) a d + sqrt(2) b c + 2 b d = (a c + 2 b d) + ((a d + b c) sqrt(2)) in G $

Associativity: $ (x y) z = ((a + b sqrt(2))(c + d sqrt(2))) (e + f sqrt(2)) = a c + sqrt(2) a d + sqrt(2) b c + 2 b d ( e + f sqrt(2)) = \ e a c + sqrt(2) a c f + sqrt(2) e a d + 2 a d f + sqrt(2) e b c + 2 b c f + 2 e b d  + 2 sqrt(2) b d f $ 

$ x (y z) =  (a + b sqrt(2))((c + d sqrt(2)) (e + f sqrt(2))) = (a + b sqrt(2)) e c + sqrt(2) c f + sqrt(2) e d + 2 d f = \ e a c + sqrt(2) a c f + sqrt(2) e a d + 2 a d f + sqrt(2) e b c + 2 b c f + 2 e b d  + 2 sqrt(2) b d f $ 

and so both sides are equal

Identity: the identity is $e = 1 + 0 sqrt(2) = 1$. Then since any $ x in G$ is a real number it follows that $ x e = x (1) =  x = 1 (x) =  e x $  

Inverse: 0 cannot have an inverse since $r(0) = 0 eq.not e$ for any $r in RR$.

For non-zero elements of $G$ the inverse $x^(-1)$ for an arbitrary $x in G$ is $1/(a+b sqrt(2))$  Then $x x^(-1) = 1 = x^(-1) x$    

We can check that the claimed $x^(-1)$ is in fact an element in $G$ : $ 1/(a+b sqrt(2)) = 1/(a+b sqrt(2)) dot (a-b sqrt(2))/(a-b sqrt(2)) = (a-b sqrt(2))/(a^2-2 b^2) = (a/(a^2-2b^2))+((-b)/(a^2-2b^2)) sqrt(2) in G $   

Since all group properties hold if we exclude 0, $G$ is a group under mutltiplication $qed$  

])
#problem([

Let $x $ and $y $ be elements of a group $G $.\  Prove that $ x y = y x iff y^(-1) x y = x iff x^(-1) y^(-1) x y = 1$
],[

We can prove this statement in three parts (let $1$ by the identity element of $G$  )

1. $x y = y x arrow.double y^(-1) x y = x$ \

Left multiply both sides by $y^(-1)$ : $y^(-1) ( x y) = y^(-1) ( y x) arrow.double y^(-1) x y = (y^(-1) y) x= 1 x = x $ by associativity and existence of inverse in groups

2. $y^(-1) x y = x arrow.double x^(-1) y^(-1) x y = 1$

Left multiply both sides by $x^(-1)$: $x^(-1) (y^(-1) x y) = x^(-1) x arrow.double x^(-1) y^(-1) x y = 1$  

3. $x^(-1) y^(-1) x y = 1 arrow.double x y = y x$

$ x (x^(-1) y^(-1) x y) = x (1) &wide "left multiply by " x \

  y^(-1) x y = x &wide "associativity, inverse, identity properties" \

  y (y^(-1) x y) = y (x) &wide"left multiply by y" \

  x y = y x &wide"associativity, inverse, identity properties"

 $  

$qed$ 

])