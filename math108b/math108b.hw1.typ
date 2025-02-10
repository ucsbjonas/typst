#import "@local/superTemplate:0.1.3": *
#import math_mod:*
#import pstat_mod:*

#let title = "math108B hw1"
#let author = "Jonas Chen"
#let date = datetime(year: 2024, month: 1, day: 8)
#show: assignment.with(title, author, date)

#prob([For the space of real-valued polynomials $P([0,1])$ over $RR$ we define: $ angle.l f,g angle.r = int_0^1 f(x) g(x) dx $ Prove that it is indeed an inner product. (Hint, you might want to reformulate "conjugate symmetry" specifcally for the real-nuber case).],[

Let the inner product be defined as in Linear Algebra done Right (LADR) 6.2

Note that $f(x) f(x) = (f(x))^2$ is always non negative for all $x in RR$, therefore its integral must be non negative \

Suppose $angle.l f, f angle.r = int_0^1 f(x)f(x) = 0$. This implies $f(x) = 0 in P([0,1])$ (see the below link) \
Additionally, if $f(x) = 0$ then it's clear that $angle.l f, f angle.r = 0$. (due to definite integrating 0) Thus the inner product definition satisifes "definiteness" \   

Next, recall that $P([0,1])$ over $RR$ is a vector space. Therefore, distributivity holds i.e. for $f_1, f_2, g in P([0,1])$ it is true that $(f_1 + f_2) g = f_1 g + f_2 g$ \

Then $ angle.l f_1 + f_2, g angle.r = int_0^1 (f_1+f_2)(x) g(x) = int_0^1 f_1(x)g(x) + f_2(x) g(x)  \ = int_0^1 f_1(x) g(x) + int_0^1 f_2(x)g(x) = angle.l f_1, g angle.r + angle.l f_2, g angle.r $ \

Additionally, let $lambda in RR$ then $ angle.l lambda f, g angle.r = int_0^1 lambda f(x) g(x) = lambda int_0^1 f(x)g(x) = lambda angle.l f, g angle.r $ \

For conjugate symmetry, recall from lecture that for any $x in RR$ that $x = overline(x)$. Note that $f(x) in RR$ and $g(x) in RR$ (after we evaluate the polynomial) therefore $angle.l f,g angle.r = overline(angle.l f\,g angle.r)$ and  $angle.l g,f angle.r = overline(angle.l g\,f angle.r)$. \

Additionally, recall that elements in vector spaces are commutative, therefore $angle.l f, g angle.r = int_0^1 f(x)g(x)dx = int_0^1 g(x) f(x) dx =  angle.l g,f angle.r = overline(angle.l g\,f angle.r)$ as desired. $qed$ \


references: \
https://math.stackexchange.com/questions/1889443/prove-that-if-integral-of-a-squared-function-is-zero-then-function-is-zero-func



])
#prob([Propose an inner product for the space $P_2([0,1])$ of real-valued polynomials up to the second order. $ P_2([0,1]) = {a_0 + a_1 x + a_2 x^2} | a_0, a_1, a_2 in RR} $],[

Let $p(t), q(t) in P_2$ then we propose the following inner product: \

$ angle.l p(t), q(t) angle.r = p(0)q(0) + p(1)q(1) + p(2)q(2) $ \

Verifying the inner product properties: \

1. $angle.l p(t), q(t) angle.r = p(0)q(0) + p(1)q(1) + p(2)q(2) = q(0)p(0) + q(1)p(1) + q(2)p(2) = angle.l q(t), p(t) angle.r$ (recall from problem 1 this is sufficient for conjugate symmetry since we are dealing with real vector space) \

2. next, let $ r(t) in P_2 $ then $angle.l p(t) + r(t), q(t) angle.r = \ (p(0)+r(0)) q(0) + (p(1)+r(1))q(1) + (p(2)+r(2))q(2) = $ \ $(p(0)q(0) + p(1)q(1) + p(2)q(2)) + (r(0)q(0)+r(1)q(1)+r(2)q(2)) = angle.l p(t), q(t) angle.r + angle.l r(t), q(t) angle.r$ \

3. next let $c in RR$ then $ angle.l c p(t), q(t) = (c p(0))q(0) + (c p(1))q(1) +(c p(2))q(2) = $ $ c(p(0)q(0)+p(1)q(1)+p(2)q(2)) = $ $ c angle.l p(t), q(t) angle.r $ 

4. next, $angle.l p(t), p(t) angle.r = p(0)p(0)+p(1)p(1)+p(2)p(2)= p(0)^2+p(1)^2+p(2)^2 gt.eq 0$. \

$p(0)=p(1)=p(2)=0 arrow.double angle.l p(t), p(t) angle.r = 0$ \

And if $angle.l p(t), p(t) angle.r = 0$ then $p(t)$ has three distinct zeroes, but this can only happen if $p(t) = 0$ for all $t in [0,1]$. Therefore $angle.l p(t), p(t) angle.r = 0  arrow.double.l.r p(t) = 0$ $qed$ \

Took directly from https://youtu.be/RqEOv38uv1I?si=NtHxuedW2jxia4II



])
#prob([Note that the inner product $angle.l dot, dot angle.r$ defined in 6.3 in the textbook only restricts that the first slot if linear, given a fixed second slot. That is, $angle.l dot, u angle.r$ is linear for a fixed $u in V$. \

For a vector space $V$ over the real numbers $RR$, and associated with an inner product $angle.l dot, dot, angle.r : V times V arrow RR$. Prove that the second slot is also linaer, given a fixed first slot $v in V$. That is, $angle.l v, dot angle.r$ is a linear map. 
 ],[

We know from https://math.libretexts.org/Bookshelves/Linear_Algebra/A_First_Course_in_Linear_Algebra_(Kuttler)/06%3A_Complex_Numbers/6.01%3A_Complex_Numbers (and previous classes) that the following two properties hold for all complex numbers $z_1, z_2$: $ overline(z_1 + z_2)=  overline(z_1) + overline(z_2) \ overline(z_1 dot z_2) = overline(z_1) dot overline(z_2) $ \

We would like to show the following: Let $v in V$ be fixed and let $w, w_1, w_2 in V$ and $lambda in RR$. Then \
$angle.l v, w_1 + w_2 angle.r = angle.l v, w_1 angle.r + angle.l v, w_2 angle.r$ and $angle.l v, lambda w angle.r = lambda angle.l v, w angle.r$ \

Firstly, $ angle.l v, w_1 + w_2 angle.r = overline(angle.l v \, w_1 + w_2 angle.r) = angle.l w_1 + w_2, v angle.r = angle.l w_1, v angle.r + angle.l w_2, v angle.r = overline(angle.l w_1 \, v angle.r) + overline(angle.l w_2 \, v angle.r) = angle.l v, w_1 angle.r + angle.l v, w_2 angle.r $ \

Secondly, $angle.l v, lambda w angle.r = overline(angle.l v \, lambda w angle.r) = angle.l lambda w, v angle.r = lambda angle.l w, v angle.r = lambda overline(angle.l w \, v angle.r) = lambda angle.l v, w angle.r$ \

In both parts we exploit the fact that if $v, w$ have all real entries then $angle.l v, w angle.r = overline(angle.l v \, w angle.r)$ similar to problem 1$qed$

 ])
#prob([For an induced norm $||dot||$ associated with a vector space $V$ over the complex numbers $CC$, prove that $||lambda v|| = |lambda| ||v||$ for any $lambda in CC$ and $v in V$. Recall that if $lambda = a + b i in CC$, then $|lambda| = sqrt(a^2 + b^2)$ ],[

$||lambda v||^2 = angle.l lambda v, lambda v angle.r = lambda angle.l v, lambda v angle.r = lambda overline(lambda) angle.l v, v angle.r = |lambda|^2 ||v||^2$, then take the square root of both sides to obtain the desired result. This is taken from LADR 6.9 and works for both $FF = CC$ and $FF = RR$ $qed$\

The square root operation should work out here since the norm $||v|| = sqrt(angle.l v \, v angle.r) = sqrt(overline(v) dot v) in RR$ for complex vector spaces, and for completeness $|lambda| in RR$. (since $a,b in RR$ ) \

Alternatively, for $v in V(CC)$ we have $||v|| = sqrt(|v_1|^2 + dots + |v_n|^2) in RR$ where $v = (v_1, dots, v_n)$ and $|v_i| = sqrt(a_i^2 + b_i^2)$ where $v_i = a_i + b_i$ and $a_i, b_i in RR$ \

https://math.stackexchange.com/questions/1670156/norm-of-complex-vector

])
#prob([Explain why the following are not inner products for the given spaces. 

1. $angle.l (a,b),(c,d)angle.r = a c - b d$ for $RR^2$ \

2. $angle.l A, B angle.r = "tr"(A+B)$ on the space of $n$ by $n$ matrices $RR^(n times n)$
],[

Consider the following counterexamples for each part: \

a. let $a = 2$ $b = 3$ $c = 2$ $d = 3$ then $angle.l(2,3)(2,3)angle.r = 4 - 9 = -5 < 0$ which violates positivity

b. let $A in RR^(n times n)$ have all of its diagonal entries be -1. Then $angle.l A, A angle.r = tr(A + A)$ but $A + A$ will now have -2 in all its diagonal entries. Therefore the trace is $(-2)n < 0$ which also violates positivity     

])
#prob([

In class, for $RR^2$ with the standard inner product, we show that the induced norm $||v||^2 = angle.l v, v angle.r$ satisfies $||u + v|| lt.eq ||u|| + ||v||$, by showing that $angle.l u, v angle.r lt.eq |u|| ||v||$ for any $u, v in RR^2$. \

In the recorded video, we will show that the above holds for any induced norm $||v||^2 = angle.l v,v angle.r$ for a general inner product space $(V, angle.l dot, dot angle.r)$ \

State your reason that one does not have to show $||u+v|| lt.eq ||u|| + ||v||$ if the norm $||dot||$ is the general norm defined via axioms.

],[

The property that $||u+v|| lt.eq ||u|| + ||v||$ (triangle equality) must hold given any general norm $||dot||$. \

However, if we define an arbitrary inner product which then induces a norm then we must show that the norm has all the properties of a general norm including the triangle equality

])
#prob([For the vector space $(RR^2, ||dot||)$ with an unspecified norm $||dot||$, its unit ball (which is a subset of $RR^2$) is defined by: $ B_(|| ||) = { v in RR^2 : ||v|| lt.eq 1} $ Draw a picture for $B_1, B_2, B_("max")$ when we pick the norm $||dot||_1, ||dot||_2, ||dot||_("max")$ respectively.],[

For any arbitrary point $p  in RR^2$  \

$B_1$ is a "unit diamond" centered at $p$  \

$B_2$ is the unit circle centered at $p$  \

$B_"max"$ is the unit square (lines are parallel to axes) centered at $p$  \

see attached (the attached uses (0,0) as origin)

])
#prob([Prove that $||dot||_1$ and $||dot||_2$ are equivalent in $RR^d$, that is, for any $v in RR^d$, htere exists some constants, $C_1, C_2$ sich that $ C_1 ||v||_1 lt.eq ||v||_2 lt.eq C_2||v||_1 $],[

Pick $C_1 lt.eq (||v||_2) / (||v||_1)$ and $C_2 gt.eq (||v||_2) / (||v||_1)$ then since $||v||_1$ and $||v||_2$ are explicitly defined $C_1, C_2$ must exist. \

However, if the constants $C_1, C_2$ cannot depend on $v$. Then set $n := d$  we can try to prove the inequality $ 1/sqrt(n) ||v||_1 lt.eq ||v||_2 lt.eq sqrt(n) ||v||_1 $ using the cauchy schwarz inquality $ |angle.l u,v angle.r| lt.eq ||u|| ||v||$ or using the standard inner (dot) product in $RR^n$: \ $|v dot w| lt.eq ||u|| ||v||$ \

Firstly, note that  $ ||v||_1 = sum_(i=1)^n |v_i| dot 1 lt.eq sqrt(sum_(i=1)^n v_i^2) sqrt(sum_(i=1)^n 1^2) = sqrt(n) ||v||_2 $ which implies that $1/sqrt(n) ||v||_1 lt.eq ||v_2||$ \

Next note that if $ ||v||_2 = sqrt(sum_(i=1)^n v_i^2) lt.eq sqrt(n) sum_(i=1)^n |v_i| = sqrt(n) ||v||_1 $ and taking the square of both sides gives $ sum_(i=1)^n v_i^2 lt.eq n sum_(i=1)^n v_i^2 $  which implies that $||v||_2 lt.eq sqrt(n) ||v||_1$  \

Therefore the claim holds if we set $C_1 = 1/sqrt(n), C_2 = sqrt(n)$ where $n = d$ $qed$ \

The following was helpful: https://math.stackexchange.com/questions/1426471/in-the-proof-that-l1-norm-and-l2-norm-are-equivalent

])