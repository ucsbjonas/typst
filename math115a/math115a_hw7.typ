#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math115A hw7"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)

#env_headers.update("classic")
#env_colors.update("bw")

https://www.youtube.com/watch?v=m-puDTc02sE

#prob([

Find the index of 5 relative to each of the primitive roots of 13. [Hint: Recall that 2 is a primitive root modulo 13. To find the other primitive roots, use the the table that was written down in class.]

],[
\
The primitive roots of 13 are 2,6,7,11 and $phi.alt(13) = 12$  \

Then the index of 5 relative to 2 modulo 13 is the smallest $k$ such that $5 equiv 2^k (mod 13)$ \



])
#prob([

Find a primitive root modulo 11, and construct a table of indices relative to this primitive root. Use your table to solve the following congruences: \

(a) $7x^3 equiv 3 (mod 11)$ 

(b) $3x^4 equiv 5 (mod 11)$

(c) $x^8 equiv 10 (mod 11)$ 

],[])
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

],[])
#prob([Find the remainder when $3^24 dot 5^13 $ is divided by 17. [Hint: use the theory of indices]],[])

#prob([Show that the congruence $x^3 equiv 3 (mod 19)$ has no solutions, while the congruence $x^3 equiv 11 (mod 19)$ has three distinct 
solutions.  ],[])

#prob([Granville, Exercise 8.1.1 \

(a) Prove that 337 is not a square (that is, the square of an integer) by
reducing it mod 5

(b) Prove that 391 is not a square by reducing it mod 7

(c) Prove that there do not exist integers $x $ and $y $ for which $x^2 - 3y^2 = - 1$, by reducing any solution mod 3. 

],[])