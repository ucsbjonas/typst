#import "@local/superTemplate:0.1.3": *
#import math_mod:*
#import pstat_mod:*

#let title = "math108B hw2"
#let author = "Jonas Chen"
#let date = datetime(year: 2024, month: 1, day: 8)
#show: assignment.with(title, author, date)

#prob([Construct an example that for 1-norm $||dot||_1$ in $RR^2,$ the parallelogram equality does not hold, that is, $ ||u + v||_1^2 + ||u-v||_1^2 eq.not 2(||u||_1^2 + ||v||_1^2)$ \ As a result, 1-norm $||dot||_1$ cannot be induced from any inner-product.],[

The 1-norm $||u||_1$ for some $v = (v_1, v_2) in RR^2$ is defined as $ |v_1| + |v_2| $ Addition and subtraction of two vectors is defined as adding or subtracting component wise in $RR^2$  \

Let $u = (1,0), v = (0,1)$ \

Then $||u+v||_1^2 = ||(1,1)||_1^2 = 4$ \ 
Then $||u-v||_1^2 = ||(1,-1)||_1^2 = 4$ \
And $||u||_1^2 = 1$ \ 
And $||v||_1^2 = 1$ \

But $8 eq.not 4$ 
])
#prob([Some exercises about the Cauchy-Schwarz 

a. Prove $ ||(angle.l u, v angle.r)/(||v||^2) v||^2 = (|angle.l u,v angle.r |^2)/(||v||^2) $ \ (This is a step in the proof to the Cauchy-Schwarz Inequality)

b. In question (8) of HW1, we proved the equivalent norm in $RR^d$. Can you use the Cauchy-Schwarz inequality to find a constant $C$ such that for any $v in RR^d$, $ ||v||_1 lt.eq C ||v||_2 $    

],[

a. $ ||(angle.l u, v angle.r)/(||v||^2) v ||^2 = angle.l  (angle.l u, v angle.r)/(||v||^2) v, (angle.l u, v angle.r)/(||v||^2) v angle.r = (|(angle.l u, v angle.r)/(||v||^2)|)^2 ||v||^2 = (|angle.l u, v angle.r|^2)/(||v||^2) $ abusing the fact that $angle.l c v, c v angle.r = c overline(c) angle.l v,v angle.r = |c|^2 angle.l v,v angle.r$ \ 

and that $||dot||^2 gt.eq 0$ hence $| ||dot||^2 | = ||dot||^2$     


b. Set $n := d$. Using the cauchy schwarz inquality $ |angle.l u,v angle.r| lt.eq ||u|| ||v||$ and using the standard inner (dot) product in $RR^n$: \ $|v dot w| lt.eq ||u|| ||v||$ \

We have  $ ||v||_1 = sum_(i=1)^n |v_i| dot arrow(1) lt.eq sqrt(sum_(i=1)^n v_i^2) sqrt(sum_(i=1)^n 1^2) = sqrt(n) ||v||_2 $ which implies that $1/sqrt(n) ||v||_1 lt.eq ||v||_2$ or $||v||_1 lt.eq sqrt(n) ||v||_2 arrow.double C = sqrt(n)$ \ where $arrow(1) in RR^d$ is a vector of 1's and $v = (v_1, dots, v_n)$  
])

#prop([Orthogonal decomposition],[Given $u,v in V, v eq.not 0$ then $u = c v + w$ where $c v$ is parallel to $v$ and $w$ is normal to $v$ i.e. $angle.l w, v angle.r =  0$ \ \ In fact we can explicitly compute $c$ and $w$ by $c = (angle.l u, v angle.r)/(||v||^2)$ and $w = u - (angle.l u, v angle.r) / (||v||^2) v$]) 

#pagebreak()

#prob([Consider the space of polynomials $P([-1,1])$ on $[-1,1]$. Define its inner product by $ angle.l f,g angle.r = int_(-1)^1 f(x)g(x)dx $ \

a. Is the polynomial $f(x)=x$ orthogonal to the polynomial $g(x)=1$ \  b. Decompose the polynomial $h(x)= x^2$ into a part that is parallel to the polynomial $g(x)=1$, and a part that is orthogonal to the polynomial $g(x)$        ],[

a. Orthogonal condition: $angle.l f,g angle.r = 0$ \

Note that $f(x)g(x) = x(1) = x$ and that $angle.l f,g angle.r =int_(-1)^1 x dx = x^2/2 |^1_(-1) = 1/2-1/2=0$. Hence $f$ is orthgonal to $g$ \

b. $angle.l h, g angle.r = int_(-1)^1 x^2 = 1/3 x&^3 |^1_(-1) = 2/3$ \

$||g||^2 = angle.l g,g angle.r = int_(-1)^1 1 = x |_(-1)^1 = 2$ \

set the constant $c = 2/3 dot 1/2 = 1/3$ \

Then the component parallel to $g$ is $c g = 1/3 (1) = 1/3$ \

And the component orthogonal to $g$  is $o :=h - c g = x^2 - 1/3$ \

So that $c g + o = x^2 = h(x)$ and additionally $angle.l o, g angle.r = int_(-1)^1 (x^2 - 1/3) (1) = (1/3 x^3 -1/3 x) |_(-1)^1 = 0 $  


])


#pagebreak()
#prob([Construct an example such that Cauchy-Schwarz inequality does not hold for 1-norm. That is, you need to find two vectors $u,v in RR^d$ such that $|angle.l u, v angle.r | > ||u||_1 ||v||_1$. You can take $d=2$ for simplicity but are welcome to deal with general $d$     ],[No solution for finite dim vector spaces])

#pagebreak()
#prob([Decompose the vector $v = (3,1)$ into a part that is parallel to the vector $w=(1,2)$ and a part that is orthogonal to the vector $w$.   ],[

Assume the inner product is the dot product and norm of a vector to be l2 norm, and \ 
Let $c w$ by the component parallel to $w$ and $o$ be the component orthogonal to $w$ \   

$angle.l v, w angle.r = 3 + 2 = 5$ \
$||w||^2 = sqrt(1^2 + 2^2)^2 = sqrt(5)^2 = 5$ \
$c w = 5/5 (1,2) = (1,2)$ \
$o = (3,1)-(1,2) = (2, -1)$ \

Then $c w + o = (3,1)$. Since $c w$ is a scalar multiple of $w$, $c w$ is parallel to $w$ \

Additionally, $angle.l o, w angle.r = 2-2=0$ 

])

#thm([Gram - Schmidt Procedure (LADR 6.32)],[Suppose $v_1, dots, v_m$ is a linearly independent list of vectors in $V$. Let $f_1 = v_1$. For $k = 2, dots, m$, define $f_k$ inductively by $ f_k = v_k - (angle.l v_k, f_1 angle.r)/(||f_1||^2) f_1 - dots - (angle.l v_k, f_(k-1) angle.r)/(||f_(k-1)||^2) f_(k-1) $ For each $k=1, dots, m$ let $e_k = (f_k)/(||f_k||)$. Then $e_1, dots, e_m$ is an orthonormal list of vectors in $V$ such that $ span \(v_1, dots, v_k \) = span \(e_1, dots, e_k\) $ for each $k=1, dots, m$.            ],[])

#prob([Apply Grahm-Schmidt onto a set $S={(1,1,1),(0,1,1),(0,0,1)}$ of vectors in $RR^3$ to obtain a set of orthonormal vectors.],[

Define the inner product to be the dot product, then confirm $S$ is a linearly independent set of vectors in $RR^3$ (they are by calculator) \

Then, $f_1 = (1,1,1)$ \

$ f_2 = v_2 - (angle.l v_2, f_1 angle.r)/(||f_1||^2) f_1 = (0,1,1) - (angle.l (0,1,1),(1,1,1) angle.r)/(||(1,1,1)||^2) (1,1,1) = (0,1,1) - (2)/(3) (1,1,1) = (-2/3, 1/3,1/3) $ \ 

$ f_3 = \ v_3 - ((angle.l v_3, f_1 angle.r)/(||f_1||^2) f_1) - ((angle.l v_3, f_2 angle.r)/(||f_2||^2) f_2) = \ (0,0,1) - ((angle.l (0,0,1),(1,1,1)angle.r)/(||(1,1,1)||^2)) (1,1,1)  - ((angle.l (0,0,1),(-2/3,1/3,1/3)angle.r)/(||(-2/3,1/3,1/3)||^2)) (-2/3,1/3,1/3) = \ (0,0,1) - (1/3)(1,1,1) - (1/3 9/6= 1/2)(-2/3,1/3,1/3) = (0,0,1) - (1/3,1/3,1/3) - (-2/6,1/6,1/6) = \ (0,0,6/6) - (2/6,2/6,2/6) - (-2/6,1/6,1/6) = (0, -3/6, 3/6) $ \

Next we can normalize: $ e_1 = f_1/(||f_1||) = ((1,1,1))/(sqrt(3)) = (1/sqrt(3),1/sqrt(3),1/sqrt(3)) \ e_2 = f_2/(||f_2||) = ((-2/3,1/3,1/3))/(sqrt(2/3)) = (-2/(3 sqrt(2/3)), 1/(3 sqrt(2/3)), 1/(3 sqrt(2/3))) \ e_3 = f_3/(||f_3||) = ((0,-3/6,3/6))/(sqrt(1/2)) = (0,-3/(6 sqrt(1/2)),3/(6sqrt(1/2))) $

We can easily inspect that $(e_1, e_2, e_3)$ and orthonormal and using a calculator we know they are linearly independent, and hence form a basis for $RR^3$ \

https://www.emathhelp.net/calculators/linear-algebra/linear-independence-calculator/?i=%5B%5B1%2Fsqrt%283%29%2C-2%2F%283sqrt%282%2F3%29%29%2C0%5D%2C%5B1%2Fsqrt%283%29%2C1%2F%283sqrt%282%2F3%29%29%2C-3%2F%286sqrt%281%2F2%29%29%5D%2C%5B1%2Fsqrt%283%29%2C1%2F%283sqrt%282%2F3%29%29%2C3%2F%286sqrt%281%2F2%29%29%5D%5D \

We can further simplify the vectors to $e_1 = ((sqrt(3))/3, sqrt(3)/3, sqrt(3)/3)$ $e_2 = (-sqrt(6)/3,sqrt(6)/6, sqrt(6)/6)$ $e_3 = (0,-sqrt(2)/2, sqrt(2)/2)$   

])
#prob([Consider the space of polynomials $P((-infty, infty))$ on $(-infty, infty)$. Define its inner product by $ angle.l f,g angle.r = int_(-infty)^infty f(x)g(x)e^(-(x^2)/2) dx  $ Use the following identity $ int_(-infty)^infty x^n e^(-(x^2)/2) dx = cases(
  sqrt(2 pi)(n-1)!! "if" n "is even",
  0 "                if" n "is odd",

)  $ where $k!! = 1 dot 3 dot 5 dot dot dot k$ is the semi-factorial of an odd number $k$, and the Grahm-Schmidt on the polynomials ${1,x,x^2}$, to obtain a set of orthogonal polynomials. You do not need to normalize them.],[
  
  after gram-schmidt we obtain ${1,x,x^2-1}$ 
  
  see the attached page])

#pagebreak()

#prob([Let $T$ be a linear operator on an inner product space $V$, that is $T: V arrow V$, satisfying $ ||T(v)|| = ||v|| $ for any $v in V$. Prove that $T$ is injective.],[

Recall that $"T"$ is injective if and only if the null space of $T$ is ${0}$ \

We can try to show that if $T(v)=0$ then $v=0$ \

Assume $T(v)=0$ then $||T(v)||= ||0|| = 0 = ||v||$ by ($star$) and by definition in problem statement.  \

And since $0 = ||v||$ by $(star)$  we know that $v = 0$ and therefore the null space of $T$ is ${0}$, hence $T$ is injective. $qed$ \

$(star)$: recall from lecture that $||v|| = 0 $ only if $v=0$ \

(T is also an isometry)

])