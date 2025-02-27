#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw7"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)

#let ind = $"ind"$

#env_headers.update("classic")
#env_colors.update("bw")

https://www.youtube.com/watch?v=m-puDTc02sE

#prob(breakable: true)[

Find the index of 5 relative to each of the primitive roots of 13. [Hint: Recall that 2 is a primitive root modulo 13. To find the other primitive roots, use the the table that was written down in class.]

][
\
The primitive roots of 13 are 2,6,7,11  \

Then the index of 5 relative to 2 modulo 13 is the smallest $k$ such that $5 equiv 2^k (mod 13)$ \

(a) The powers $1 dots 9$ of $2 (mod 13)$ are congruent to $2,4,8,3,6,12,11,9,5$ respectively. Therefore $ind_2(5)=  9$ \

(b) The powers $1 dots 9$ of $6 (mod 13)$ are congruent to $6,10,8,9,2,12,7,3,5$ respectively. Therefore $ind_6(5) = 9$ \

(c) The powers $1dots 3$ of $7 (mod 13)$ are congruent to $7,10,5$ respectively. Therefore $ind_7(5)=3$ \

(d) The powers $1 dots 3$ of $11 (mod 13)$ are congruent to $11,4,5$ respectively. Therefore $ind_11 (5) = 3$    

]
#prob([

Find a primitive root modulo 11, and construct a table of indices relative to this primitive root. Use your table to solve the following congruences: \

(a) $7x^3 equiv 3 (mod 11)$ 

(b) $3x^4 equiv 5 (mod 11)$

(c) $x^8 equiv 10 (mod 11)$ 

],[

\ Note that $phi.alt(11) = 10$ Also note that $2$ is a primitive root $mod 11$ since $2^10 equiv 1 (mod 11)$  (and no other powers smaller than 10 satisfy the congruence)

Taking powers of $2 (mod 11)$ we can obtain the following table: 
#table(
  columns: 11,
  [$a$], [1], [2], [3],[4],[5],[6],[7],[8],[9],[10],

  [$"ind"_2 (a)$ ],[10],[1],[8],[2],[4],[9],[7],[3],[6],[5]
)

(a)

Checking to see how many potential solutions (if there exist any) we see that $(3,10) = 1$ and $3^10 equiv 1 (mod 11)$ by fermat's little theorem. Therefore there is exactly one solution \

$ 7x^3 &equiv 3 &(mod 11) \ ind_2(7) + 3 ind_2(x) &equiv ind_2(3) &(mod 10) \ 7 + 3 ind_2(x) &equiv 8 &(mod 10) \ 3 ind_2(x) &equiv 1 &(mod 10) $ implies that $ind_2(x) equiv 7$ so that we have the solution $x equiv 7 (mod 11)$   

(b) Checking to see (how many potential) solutions there are we see that $(4,10) = 2$ and $5^5 equiv (5^2) (5^2) (5) equiv 1 (mod 11)$. Therefore there are 2 solutions \

$ 3x^4 equiv 5 (mod 11) \ ind_2(3) + 4 ind_2(x) equiv 4 (mod 10) \ 8 + 4 ind_2(x) equiv 4 (mod 10) \ 4 ind_2(x) equiv -4 equiv 6 (mod 10) $

Which implies that $ind_2(x) equiv 9$ and $ind_2(x) equiv 4 (mod 10)$ so that the solutions are $x equiv 5, x equiv 6 (mod 11)$   

(c) Checking to see how many potential solutions there could be: $(10,8) = 2$ and $10^5 equiv (100)^2 (100)^2 100 equiv 1 (mod 11)$ 

$ x^8 equiv 10 (mod 11) \ 8 ind_2(x) equiv ind_2(10) (mod 10) \ 8 ind_2(x) equiv 5 (mod 10)  $ But this is not solvable therefore the original congruence has no solution 

])
#prob([

The following is a table of indices for integers modulo 17 relative to the primitive root 3: \

#table(
  columns: 17,
  [$a$], [1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],

  [$"ind"_3 (a)$ ],[16],[14],[1],[12],[5],[15],[11],[10],[2],[3],[7],[13],[4],[9],[6],[8],
)



Use this table to solve the following congruences: \

(a) $x^12 equiv 13 (mod 17)$ \
(b) $8x^5 equiv 10 (mod 17)$ \
(c) $9x^8 equiv 8 (mod 17)$ \
(d) $7^x equiv 7 (mod 17)$  

],[

\
(a) $ x^12 equiv 13 (mod 17) \ 12 ind_2(x) equiv ind_3 (13) (mod 16) \ 12 ind_3(x) equiv 4 (mod 16) $ which means that $ind_3(x) equiv 7,3,11,15 (mod 16)$ so that we have solutions $x equiv 11,10,7,6 (mod 17)$    \

Confirming the number of solutions $(phi.alt(17),12) = 4$ and $13^4 equiv (13^2)^2 equiv 16^2 equiv 1 (mod 17)$ (has 4 solutions if solvable) \

(b) $ 8x^5 equiv 10 (mod 17) \ ind_3 (8x^5) equiv ind_3 (10) (mod 16) \ ind_3(8) + 5 ind_3(x^) equiv ind_3 (10) (mod 16) \ 10 + 5 ind_3(x) equiv 3 (mod 16) \ 5 ind_3(x) equiv -7 equiv 9 (mod 16)  $ which means that $ind_3(x) equiv 5 (mod 16)$ and the solutions is $x equiv 5 (mod 17)$   Confirming the number of solutions, we see that $(phi.alt(17),5) = 1 $ 

(c) $9x^8 equiv 8 (mod 17) arrow.double ind_3(9) + 8 ind_3(x) equiv ind_3 (8) (mod 16) arrow.double 2 + 8 ind_3(x) equiv 10 (mod 16) arrow.double 8 ind_3(x) equiv 8 (mod 16)$ so that $ind_3(x) equiv 1,3,5,7,9,11,13,15 (mod 16)$ with corresponding solutions $x equiv 3,10,5,11,14,7,12,6 (mod 17)$\ Confirming the number of solutions, $(phi.alt(17),8) = 8$ 

(d) $ 7^x equiv 7 (mod 17) \ x ind_3(7) equiv ind_3(7)(mod 16) \ x(11) equiv 11 (mod 16) $ 

And we have a solution $x equiv 1 (mod 17)$



])


#prob([Find the remainder when $3^24 dot 5^13 $ is divided by 17. [Hint: use the theory of indices]],[
\

Note that $3$ is a primitive root $mod 19$    

We sould like to solve for $x$ in the following congruence:

$ 3^24 dot 5^13 equiv x (mod 17) \ 24 ind_3(3) + 13 ind_3 (5) equiv ind_3(x) (mod 16) \ 24 + 65 equiv ind_3(x) (mod 16) \ 8 + 1 = 9 equiv ind_3(x) (mod 16) $ 

And we can see by the table in problem 3 that $3^9 equiv 14 (mod 17)$ therefore the remainder is 14


])

#pagebreak()

#prob([Show that the congruence $x^3 equiv 3 (mod 19)$ has no solutions, while the congruence $x^3 equiv 11 (mod 19)$ has three distinct 
solutions.  ],[

\ For the first congruence, $ (phi.alt(19), 3) = 3$ and $ 3^(18/3) = 3^6 equiv (3^3)^2 equiv (27)^2 equiv.not 1 (mod 19) $ therefore no solutions \

For the second congruence,
$(phi.alt(19),3) = 3$ and $ 11^6 equiv (11^3)^2 equiv (11^2 dot 11)^2 equiv (7 dot 11)^2 = (77)^2 equiv 1 (mod 19) $  therefore there are exactly $3$ distinct solutions 

])

#pagebreak()

#prob([Granville, Exercise 8.1.1 \

(a) Prove that 337 is not a square (that is, the square of an integer) by
reducing it mod 5

(b) Prove that 391 is not a square by reducing it mod 7

(c) Prove that there do not exist integers $x $ and $y $ for which $x^2 - 3y^2 = - 1$, by reducing any solution mod 3. 

],[
\
(a) $337 = 335 + 2 equiv 2 (mod 5)$ but 2 is not in the table of quadratic residues $(mod 5)$ Therefore there does not exist an $x$ such that $337 = x^2 equiv 2 (mod 5)$  

(b) $391 = (10)^3 + 91 equiv 3^3 + 7 equiv 27 + 7 equiv 34 equiv 6 (mod 7)$ but $6$ is not in the table of quadratic residues (mod 7) therefore there does not exist an $x$ such that $391 = x^2 equiv 6 (mod 7)$    

(c) 

Let $x,y in ZZ$  

First we can use two facts: \

$-3y^2 equiv 0 (mod 3)$ and 

$x^2 equiv a (mod 3) iff a = 1 + 3k$ for some integer $k$  \

The second fact is true since $a in ZZ$ is a quadratic residue $mod p$ if for $(a,p) = 1$ and it holds that $a^((p-1)\/2) equiv 1 (mod p)$ \

Here we have $(p-1)\/2 = 1$ so that $a^1 equiv 1 (mod p)$ Therefore $a$ must have the form $a = 1 + 3k$ \

Combining the above two congruence we have that $x^2 - 3y^2 equiv a$ i.e. $x^2 - 3y^2 equiv 1 + 3k - 0 (mod 3) (dagger)$ \

Let $x^2 = 1 + 3k$ then from the original equation we can obtain $y = (1 + x^2)/3$  and substituting gives $ (1 + (3k+1)^2)/3 = (3(3k^2 + 2k)+2)/3 = y $ \

But the above implies that $3 divides.not y$ which contradicts the fact that $y=(1+x^2)/3$ is an integer, therefore $y eq.not 0$ and $(dagger)$ does not hold \

the conlclusion is that for any choice of $x in ZZ$, the integer $y in ZZ$ does not exists such that $x^2 - 3y^2 = -1$ \

$qed$ 

])