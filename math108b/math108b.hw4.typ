#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math108B hw4"
#let author = "Jonas Chen"
#let date = datetime(year: 1000, month: 10, day: 10)
#show: assignment.with(title, author, date)

#env_headers.update("classic")
#env_colors.update("bw")

#prob([

On textbook, we actually never define the dimension for a subset which is not a
subspace. In addition, the isomorphism to identify two subspaces is an invertible
linear map. Now, we relax these definitions.

We say the dimension of  ausbset $S$ is the dimension of a subspace $U$ if there is a subspace $U subset V$ and an injective and surjective map between $S$ and $U$. \

Use this definition, to prove that the dimension of the subet $S = {(x,y,2) in RR^3: x, y in RR}$ is two. 

],[

\ Let $V = RR^3$ and $U subset V = RR^2$. Let $s = (x,y,2) in S$ and define the consider map $M: S arrow U$ by $M(s) arrow (x,y)$ \ 

Injective: let $s, s' in S$ and $s = (x_1, y_1,2), s'=(x_2, y_2,2)$  then  if $M(s) = M(s') arrow.double (x_1, y_1) = (x_2, y_2) arrow.double x_1 = x_2, y_1 = y_2 arrow.double s = s'$ \

Surjective: let $s$ be an element in the range of $M$ and $(x,y,2) in S$ . Then $s = (x,y) = M((x,y,2))$ \

Since we have an injective and surjective map between $S$ and $U$ then the dimesnions of $S$ is the dimension of $U$ i.e. 2    

])
#prob([

Construct an example of a subset $S$ to conject that whether $S subset (S^perp)^perp$ is true or $(S^perp)^perp subset S$ is true. And prove your findings for arbitrary subset $S$ in a vector space $V$.     

],[
 consider  $S, S^perp, (S^perp)^perp$ where $S = {vec(1,0,0)}$ and $S^perp = {vec(0,x,y): x,y in RR}$ and $(S^perp)^perp = {vec(z,0,0): z in RR}$ then clearly, $S subset (S^perp)^perp and (S^perp)^perp subset.not S$ (Note that $S, S^perp, (S^perp)^perp$ is a subset of $RR^3$)     \

In general: \


1. let $u in S$ then for all $w in S^perp$ we have $angle.l u, w angle.r = 0$. Since each $u$ is orthogonal to any element in $S^perp$, it follows that $u in (S^perp)^perp$ and therefore $S subset (S^perp)^perp$  \

2. Second, let $v in (S^perp)^perp $

Since $S$ is a subset and not a subspace, we do not know if $S + S^perp$ form a direct sum of $V$ and it is also not guaranteed that $S union S^perp = V$ . Although it is clear that $v in.not S^perp$ it is possible that $v in.not S$ since $V$ may be a union of $S union S^perp union S_0 $ for some $S_0 subset V$ 

We can conclude that in general, $(S^perp)^perp subset.not S$ 

])

#pagebreak()
#defn([Orthogonal projection of V onto a subspace U],[

Define the orthogonal projection of $V$ onto a subspace $U$ by $P_U: V arrow V$ which maps $v in V arrow u in U$ where $v = u + w$ such that $u in U, w in U^perp$ \
])
#prob([

Let $P_U$ be the orthogonal projection operator onto the subspace $U$ in a vector space $V $. Prove that $P_U (u) = u $ for any $u in U $ and $P_U (w)=0$ for any $w in U^perp$    

],[

\ If $u in U$ then $u = u + 0$ where $0 in U^perp$. Then by definition $P_U (u) = u$ \ 

If $w in U^perp$ then $w = 0 + w$ where $0 in U$. Then by definition $P_U (w) = 0$     

]) #pagebreak()

#defn([Projection],[

Consider $P: V arrow V$, then $P$ is a projection if $P (P(v)) = P(v)$ i.e. $P^2 = P$     ("two consecutive operations equivalent to one operation") \

])
#prob([

Define a new projection operator from $RR^2$ onto the subspace $U={(x,y) in RR^2: y = x}$ that is different from the ones in class. In class, we define the horizontal projection as $P_U^h ((x,y)) = (x,x)$ and (also define) the orthogonal projection. You need to express it in an explicit formula $P_U ((x,y))$ and prove it is a projection by definition.    

],[

\ Note that $U$ can be thought of as $span{vec(1,1)}$  \

The projection of one vector onto another is defined in $RR^2$ with standard dot product as  $(a dot b)/(b dot b) b$ where $a$ is projected onto $b$. Here we are trying to project $a=(x,y)$ onto $b=(1,1)$ so $(x,y) dot (1,1) = x + y$ and $(1,1) dot (1,1) = 2$. Therefore,       

we can define $P_U ((x,y)) = ((x+y)/2, (x+y)/2)$ since $P_U (P_U (x,y)) = P_U ((x+y)/2, (x+y)/2) = ((2(x+y))/4, (2(x+y))/4) = ((x+y)/2, (x+y)/2) = P_U (x,y)$  

]) #pagebreak()

#prob([

Construct an example of a vector $u, v in RR^2$ such that $angle.l v, P_U^h (u) angle.r eq.not angle.l P_U^h (v), u angle.r$, where $P_U^h (v)$ is the horizontal projection defined in class and in (4).  

],[

  \ Let the inner product be the dot product (standard for $RR^n$ )

Let $ v = (1,0), u = (0,1)$ Then $P_U^h (v) = (1,1) "and" P_U^h (u) = (0,0)$ however $(1,1)dot (0,0) eq.not (1,1) dot (0,1)$     

])
#pagebreak()

#prob([

Suppose that $V_1, V_2, V_3$ are subspaces of $V$. Define a linear map $T: V_1 times V_2 times V_3 arrow V_1 + V_2 + V_3$ (recall $V_1+V_2+V_3$ ) is still a subspace of $V$ by $ T(v_1, v_2, v_3) = v_1 + v_2 + v_3 $ for $v_i in V_i$      \

(i) prove $T$ is surjective \
(ii) Prove that if $V_1 + V_2 + V_3$ is indeed a direct sum, then $T$ is injective.   

],[
\
(i) Let $x$ be an element in the range of $T$ i.e. $x in V_1 + V_2 + V_3$. By the definition of sums of subspaces (LADR 1.36) we know that $x = v_1 + v_2 + v_3$ where $v_i in V_i$. Take $z = (v_1, v_2, v_3)$ then $T(z) = x$ for all $x.$ Therefore any $x$ can be generated by $z = (v_1, v_2, v_3)$ through $T$       

(ii) Suppose that $V_1 + V_2 + V_3$ is a direct sum. Then $V_1 sect V_2 sect V_3 = {0}$ (LADR 1.46). Although we could use this fact, it may be more concise to argue that since each element of $V_1 + V_2 + V_3$ can be written in exactly one way as $v_1 + v_2 + v_3$. Therefore each $(v_1, v_2, v_3) in V_1 times V_2 times V_3$ will map to a unique $v_1 + v_2 + v_3 in V_1 + V_2 + V_3$, hence $T$ is injective. $qed$

Alternatively, assume $x eq.not 0 in V_1 times V_2 times V_3$ and try to show that $T(x) = 0 = v_1 + v_2 + v_3$. Therefore at least one $v_i eq.not 0$, and it follows that the other $v_i$ must add to its additive inverse. However, the additive inverse of $v_i eq.not 0$ is also in $V_i$ which contradicts $V_1 sect V_2 sect V_3 = {0}$. Therefore $x = 0$ in order for $T(x) = 0$ $therefore null(T) = {0}$ and $T$ is injective.  

]) #pagebreak()

#note([In class, given a closed convex set $C$ in a vector space $V$ equipped with an induced norm $||dot||$, we define the orthogonal projection $P_C: V arrow V$ that maps a vector $x in V$ to a vector $y^* in C$ by $ P_C (x) = y^* = argmin_(y in C) ||x-y|| $        ])

#thm([orthogonal projection characterization],[
Given a closed convex subset $C$ of $V$, for every $x in V$ we have $ z = P_C (x) arrow.double.l.r angle.l y-z, x-z angle.r lt.eq 0 forall y in C $     

],[])

#prob([

Use the characterization theorem for the orthogonal projection to show that for a given cloased convex set $C$, for any $x,y in V$ we have $ ||P_C (x) - P_C (y)|| lt.eq ||x-y|| $   

],[

\ By the projection characterization theorem we have that \

$angle.l x - P_C (x), P_C (y) - P_C (x) angle.r lt.eq 0$ since $P_C (y) in C$ and additionally, \

$angle.l y - P_C (y), P_C (x) - P_C (y) angle.r lt.eq 0$ since $P_C (x)in C$ \ 

Factoring $-1$ from the second inequality gives \

$angle.l P_C (y) - y, P_C (y) - P_C (x) angle.r lt.eq 0$ and then we can use linearity (first slot) of inner products to obtain from the first equation: \

$angle.l x - y - P_C (x) + P_C (y), P_C (y) - P_C (x) angle.r lt.eq 0$ and apply linearity again to obtain \

$angle.l x - y, P_C (y) - P_C (x) angle.r + ||P_C (y) - P_C (x)||^2 lt.eq 0$ \

$ ||P_C (y) - P_C (x)||^2 lt.eq - angle.l x - y, P_C (y) - P_C (x) angle.r$ \


$ ||P_C (y) - P_C (x)||^2 lt.eq  angle.l -x + y, P_C (y) - P_C (x) angle.r$ and by Cauchy-Schwarz \

$ ||P_C (y) - P_C (x)||^2 lt.eq  angle.l -x + y, P_C (y) - P_C (x) angle.r lt.eq ||-x + y|| ||P_C (y) - P_C (x)||$ \ 

Then dividing both sides by $||P_C (y) - P_C (x)||$ and multiplying by -1  proves the desired result.




])
#prob([

If one interprets the norm $||x-y||$ as the distance between $x$ and $y$, interpret the meaning of the above inequality.   

],[\ The orthogonal projection map is a contraction. (of the vector connecting $x$ and $y$  )])