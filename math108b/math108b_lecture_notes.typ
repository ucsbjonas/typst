#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#let title = "math108b lecture notes"
#let author = "Alice Bob"

#show: notes.with(title, author)
// classic classic original color scheme
#env_headers.update("classic")
#env_colors.update("classic")
= January 7

#remark([Expectations for this class \

  Read, write, think, discuss math in a rigorous way \

  Notations and their importance \

  John Von Neumann: in mathematics you don't understand things, you just get used to them \

  Some applications: eigenvalues $arrow$ google search (page rank)\

  Start with chapter 6, inner product spaces (go back to eignstuff later) \

  Review chapter 3 about product space, quotient space, dual space ])

== Inner products and Norms (chapter 6A)\

Inner products encode information about angles between vectors.\

#remark(
  [Notation: $(RR^n, beta)$. Where $beta$ is a basis for $RR^n$. \

    Standard ordered basis $e_i = (0,dots, 0, 1, 0, dots, 0)$ \

    $[v]_beta$ (recall this coordinate vecotr notation) \

    $v_1$ can be unique written as $v_1 = x_1 e_1 + dots + x_n e_n$ then $[v_1]_beta = vec(x_1, x_2, dots.v, x_n)$

    If $v_2 = y_1 e_1 + dots + y_n e_n$ then the inner product $angle.l v_1, v_2 angle.r$ is defined as \

    $angle.l v_1, v_2 angle.r = x_1 y_1 + dots + x_n y_n$ or in general as a function: $angle.l , angle.r : RR^n times RR^n arrow RR$
  ],
)

#prop(
  [Some properties we can immediately see based on 1.1.1 \

    1. $angle.l v,v angle.r gt.eq 0$, with equality only if $v = 0$ (zero vector)
    2. $angle.l , u angle.r: RR^n arrow RR$ maps $v in V arrow angle.l v, u angle.r$ for some fixed $u in V$ is a linear map
      from $V$ to $RR$ \
    3. $angle.l u, v angle.r = angle.l v, u angle.r$

  ],
  [

    Claim: the linear map defined in ii) is a linear map \
    Proof: excercise

  ],
)

#defn([Norm], [The norm of a vector $v$ is defined as $||v|| = sqrt(angle.l v \, v angle.r)$ \

  Note that $||v||^2 = angle.l v,v angle.r$ \

  The norm is a map $|| ||: RR^n arrow RR$ which maps $v in RR^n arrow || v ||$ \

])

#prop(
  [Norm properties \ 1. $||v|| gt.eq 0$ since $angle.l v,v angle.r gt.eq 0$ \ 2. || || is NOT a linear map.],
  [\ 2. To be linear, we expect $||v_1 + v_2|| = ||v_1|| + ||v_2||$. But interpretation of norms as lengths of vectors
    disproves this. \ ],
)

#defn(
  [Inner Product],
  [

    An inner product is a function with two input vectors and one output scalar defined as $ angle.l , angle.r: V times V arrow FF $

    Properties of inner products: \

    \ 1. positivity $angle.l v, v angle.r gt.eq 0$ (equality only when $v$ is zero vector) \ 2. additivity in first slot: $angle.l v_1 + v_2, u angle.r = angle.l v_1, u angle.r + angle.l v_2, u angle.r$ \ 3.
    homogenity in first slot $angle.l lambda v, u angle.r = lambda angle.l v, u angle.r$ \ 4. conjugate symmetry: $angle.l u, v angle.r = overline(angle.l v \, u angle.r)$

  ],
)

#remark(
  [

    Combining properties 2 and 3 from 1.1.5 we can see that $angle.l , u angle.r$ is a linear map. \

    The fact that these properties it is in the first slot is by convention (if defined in other slots, it will not be
    considered the standard inner product) \

    For example we can define in the second slot: \

  ],
)

#remark(
  [

    Recall that for any real $x$, $x = overline(x)$ so that $angle.l v, u angle.r = overline(angle.l v \, u angle.r) = angle.l u, v angle.r$],
)

#remark(
  [The difference between definitions of inner products in 1.1.1 and 1.1.5 is that the first one tells you the computation
    and the latter is more general. The inner product defined in 1.1.1 is often called the dot product.],
)

#remark([We choose a definition of inner product (called the standard inner product) for $RR^n$ by the usual definition. \

For example, for $RR^2$ has standard inner product $x_1 y_1 + x_2 y_2$.  \

])

#example([Weighted Inner Product],[

Define the weighted inner product $angle.l v_1, v_2 angle.r_w$ to be $3 x_1 x_2 + y_1 y_2$ \

excercise: verify properties 1-4 in 1.1.5

Two methods: kernel-method, and filter-method which have applications in ML and signal processing

])

#example([Not an Inner Product],[

  The inner product in $RR^2$ defined by $angle.l v_1, v_2 angle.r = 2 x_1 x_2 + (-1) y_1 y_2$ is not an inner product since this definition would violate property 1 \

  As a concrete example, if $v_1 = vec(0,1)$ then $angle.l v_1, v_2, angle.r = -1 lt.eq 0$
])

#example([application amazon/netflix], [in the lecture notes]) \

#remark([The fourth property from 1.1.5 comes from consideration of complex numbers. \

let $v_1 = a + b i$ \

in the lecture notes

])

#example([LADR example 6.3],[

  Consider the vector space $V = P([0,1])$ be polynmials defined on [0,1] with degree $n$. \

  Recall the bijection $RR^n tilde.equiv P_(n-1)([0,1])$ \

  Some possible definitions of inner products include \

  $angle.l f, g angle.r = int_0^1 f(x) g(x) dx$ \ (we can see immediately that the positivity conditions (condition 1) is satisified)\

  or \

  $angle.l f,g angle.r _e = int_0^1 f(x) g(x) e^(-x) dx$ \ ("kernel function")

])

#defn([Induced Norm], [

The induced norm $||v|| = sqrt(angle.l v\, v angle.r)$ \

Remark: once $angle.l dot, dot angle.r$ is defined, $|dot|$ is fixed. \

Recall that the norm is a function map. In function notation: $|| dot || : V arrow RR$ 

])

#defn([Properties of Norm], [

Recall from 1.1.4 that 
  1. $|| v || gt.eq 0$ with equality only if $v = 0$ \

  2. $|| dot ||$ is NOT linear

And now note that (let $||$ denote the absolute value )

  3. $|| lambda u || = |lambda| ||u||$ but $|| lambda u || eq.not lambda ||u||$
])

#thm([Triangle Inequality],[$||u + v|| lt.eq ||u|| + ||v||$ (for $RR$  ) ],[

$ || u + v || = sqrt(angle.l u + v \, u + v angle.r) arrow.double \ || u + v ||^2 =  angle.l u + v \, u + v angle.r = angle.l u,u angle.r +angle.l u,v angle.r +angle.l v,u angle.r+ angle.l v,v angle.r = 

||u||^2 + ||v||^2 + 2 angle.l u, v angle.r \

$

Note that $(||u|| + ||v||)^2 = ||u||^2 + 2 ||u|| ||v|| + ||v||^2$. \

Therefore we want to show that $2 angle.l u, v angle.r lt.eq 2 ||u|| ||v||$ \

Considering only $u, v in RR^2$ then we know that $angle.l v, u angle.r = ||u|| dot ||v|| cos theta lt.eq ||u|| ||v||$ \

We will revisit this later to prove in general for any vector space.

])

#defn([More general definition of norm],[Norm of $V$ is a function: $V arrow FF$ if it satisifes 

1. $||v|| gt.eq 0$ with equality only if $v = 0$ \

2. $||v_1 + v_2|| lt.eq ||v_1|| + ||v_2||$ for every $v_1, v_2 in V$ \

3. $||lambda v|| = |lambda| ||v||$ for every $lambda in FF, v in V$ 

 ])


 #defn([Different norms], [

Let $v = (x,y) in RR^2$ \

$||v||_1 = |x| + |y|$ \

$||v||_2 = sqrt(x^2 + y^2)$ \

$||v||_"max" = ||v||_infty = "max" {|x|, |y|}$ \

different norms perfer different "features" \

$||v||_1$  treats each coordinate "equally" \

$||v||_2$ treates each coordinate "equally" BUT prefers large coordinates \

For example it is true that $x > y > 1$ means that $||(x+1, y)||_2 gt.eq ||(x, y+1)||_2$

 ])

 #remark([All norms are equivalent to eachother in finite dimensional v.s. but not all equivalent in infinite dimensional v.s. \
 
 We say that two norms $||v||_1, ||v||_2$ are equivalent if there exists $c_1, c_2$ constanst it holds that $ c_1 ||v||_1 lt.eq ||v||_2 lt.eq c_2 ||v||_2 $ \

 So, \

 This means that for the 1 and 2 norms in $RR^2$ that we need to find some universal $c_1, c_2$ (not depends on choice of $v$) such that \

 $ c_1(|x| + |y|) lt.eq sqrt(x^2 + y^2)$  and $sqrt(x^2 + y+2) lt.eq c_2 (|x| + |y|)$ \

 Proof for this case:

 Let $c_1 = 1/2, c_2 = 2$. We would like to show that \

 $(|x| + |y|)/2 lt.eq sqrt(x^2 + y^2)$ and $sqrt(x^2 + y^2) lt.eq 2(|x| + |y|)$ \

 Continued in lecture notes


 ])

 == Jan 16 (recorded lecture) \

#remark([Last time\


1. Define mechanism (algorithm) such as $x dot y = x_1 y_1 + dots + x_n y_n$ \

then prove properties: $angle.l dot, y angle.r$ is linear, $angle.l x, x angle.r gt.eq 0$ with equality if and only if $x = 0$, conjugate symmetry, +more properties (textbook section 6 and homework) \

2. Define inner-product by (which satisfies) axioms \

Examples include standard inner-product and weighted inner-product \

After doing this definition, this introduces a norm associated with the defined inner product \

For example for the standard inner-product $angle.l dot, dot angle.r$ then $||x||^2 = angle.l x, x angle.r$ ("standard norm") \

For weighted norm $angle.l dot, dot angle.r_w = x_1 w_1 y_1 + dots + x_n w_n y_n$ then $||x||^2_w = angle.l x, x angle.r_w$ \

We then can prove properties about the norm such as $||x|| gt.eq 0$ with equality if and only if $x = 0$, $||x+y|| lt.eq ||x|| + ||y||$ (triangle inequality), and $||lambda x|| = |lambda| dot ||x||$ \

3. Define norm by norm axioms \

this means we will "lost algorithm to compute norm", though we can later introduce a computation method such as the 1 norm, 2 norm, infinity norm, etc. \

here, norm is not necessarily induced from inner-product \

]) 

#prop([given a norm $||dot||$, it is not always possible to define the particular kind of inner-product, $angle.l dot,dot angle.r$ such that $||v||^2 = angle.l v, v angle.r$  ],[])

#thm([Parallelogram equality],[Given an inner product $angle.l dot, dot angle.r$ if the norm $||dot||$ is induced from $angle.l dot, dot angle.r$ then the norm satisfies the following: $ ||u + v||^2 + ||u-v||^2 = 2(||u||^2 + ||v||^2) $ Remark: this has strong geometric meaning (reference the picture above 6.21 in LADR-4)],[

$angle.l u+v, u+v angle.r + angle.l u-v, u-v angle.r = angle.l u, u+v angle.r + angle.l v, u+v angle.r + angle.l u, u-v angle.r + angle.l -v, u-v angle.r = angle.l u, u angle.r + angle.l u, v angle.r + angle.l v, u angle.r + angle.l v, v angle.r + angle.l u, u angle.r + angle.l u, -v angle.r + angle.l -v, -v angle.r + angle.l -v, u angle.r = 2 ||u||^2 + 2||v||&2$ \ ])

#cor([],[Given a norm $||dot||$ if it satisfies the triangle inequality for any $u,v in V$ then the norm is induced from some inner-product ],[

(not given)

  Remark: (hw) $||dot||_1$ cannot be induced by any inner-product. \

  
])

#remark([Recall: given an inner product we showed that the induced norm satisfies the triangle inequality, but only in $RR^2$ (today we prove a more general version) \

Recall: a norm defined by axioms satisfies the triangle inequality automatically \
 ]) \

#defn([Orthogonal],[$u, v in V$ are orthogonal to each other if $angle.l u, v angle.r = 0$  ])

#thm([Pythagorean Theorem], [Let $u,v$ be orthogonal then the following is true: $ ||u+v||^2 = ||u||^2 + ||v||^2 $  ], [

$angle.l u+v, u+v angle.r = angle.l u,u angle.r + angle.l u, v angle.r + angle.l v, u angle.r + angle.l v,v angle.r = ||u||^2 + ||v||^2$ \

Which is very nice as it only requires definition of inner product, norm, and orthogonal

]) 

#thm([Orthogonal decomposition],[Given $u,v in V, v eq.not 0$ then $u = c v + w$ where $c v$ is parallel to $v$ and $w$ is normal to $v$ i.e. $angle.l w, v angle.r =  0$  \

In fact we can explicitly compute $c$ and $w$ by $c = (angle.l u, v angle.r)/(||v||^2)$ and $w = u - (angle.l u, v angle.r) / (||v||^2) v$],[

Definte $w = u - c v$ then $ 0 = angle.l w,v angle.r = angle.l u - c v, v angle.r = angle.l u, v angle.r - c ||v||^2 arrow.double c = (angle.l u, v angle.r)/(||v||^2) $ and the computation for $w$ follows (plug in $c$ )    
])

#thm([Cauchy - Schwarz Inequality],[For $u,v in V$ then $|angle.l u, v angle.r| lt.eq ||u|| ||v||$. \ Note that $||dot||$ must be induced from an inner-product],[

Note that

$ u = (angle.l u, v angle.r)/(||v||^2) v + w $ then by Pythagorean theorem since $v,w$ , 
$ ||u||^2 = ||(angle.l u, v angle.r)/(||v||^2) v||^2 + ||w||^2 = (|u+v|^2)/(||v||^2) + ||w||^2 gt.eq  (|u+v|^2)/(||v||^2) $ Then rearrange the far left and far right, take square root, done. Additionally note that $ ||(angle.l u, v angle.r)/(||v||^2) v ||^2 = angle.l  (angle.l u, v angle.r)/(||v||^2) v, (angle.l u, v angle.r)/(||v||^2) v angle.r = ((angle.l u, v angle.r)/(||v||^2))^2 ||v||^2 = (|u+v|^2)/(||v||^2) $ 
])

== January 21 "From Inner-Product to Orthonormal"

#defn([Orthonormal Vectors],[

Set of vectors, denoted ${e_j}^n_(i=1)$ \

1. Must be orthogonal $angle.l e_i, e_j angle.r = 0$ for $i eq.not j$ 

2. Normalized: $angle.l e_i, e_i angle.r = ||e_i||^2 = 1 = ||e_i||$ 

])

#example([Orthonormal Sets],[standard basis in $RR^3$ is orthonormal \ the set ${(1/sqrt(3),1/sqrt(3),1/sqrt(3)),(1/sqrt(2), -1/sqrt(2), 0)} $ is orthonormal ])

#cor([],[If a list of vectors are orthonormal, then that list of vectors are linearly independent],[

Let ${e_i}^n_(i=1)$ be orthonormal. \

Proof is in the notes, and the book

])

#defn([Orthonormal basis],[A list of vectors is orthonormal basis if they are orthonormal, and they are a basis for $V$  \ Recall that a basis is linearly independent and spans $V$ \ Also recall that for finite dimensional vector spaces that if the number of orthonormal vectors is equal to $dim(V)$ then those vectors are a bssis (linear independence lemma) \
  ])

#remark([Let $V$ be a vector space with dimension $n$. Let ${e_i}_(i=1)^n$ be an orthonormal basis and ${v_i}_(i=1)^n$ be a basis (for $V$). \

The benefits of orthnormal basis: easy to verify that a list is orthonormal basis \

Another benefit is writing any arbitrary vector in $V$ as a linear combination of the orthonormal basis (LADR 6.29). This is also called "projecting onto the list of vectors" i.e. if you have a vector $v = a_1 e_1 + dots + a_n e_n = b_1 v_1 + dots + b_n v_n$ then $a_i = angle.l v, e_i angle.r = angle.l a_i e_i + dots + a_n e_n, e_i angle.r  = a_i angle.l e_i, e_i angle.r$. In contrast, to compute $b_1, dots, b_n$ we need to solve the big system of linear equations. Computationally, the running time is $O(n) "and" O(n^3)$ if use gaussian elimination and $O(n), O(n^2)$ space respectively \ ])

#prop([If $v = a_1 e_1 + dots + a_n e_n$ then $||v||_2^2 = |a_1|^2 + dots |a_n|^2$ (LADR 6.30b)  ],[By the pythagorean theorem (prove this yourself) ])

#thm([],[Any linearly independent list can be turn into an orthnormal list, where both lists have the same span],[By the Grahm-Schmidt procedure (LADR 6.32)])

#remark([Applicationof orthonormal bases: discretization of wave function (such as the recording of a voice). \ Lengdre polynmoials])

== January 23

#thm([],[Every finite-dimensional inner product space has an orthonormal basis.
\ Suppose 𝑉 is finite-dimensional. Then every orthonormal list of vectors in 𝑉
can be extended to an orthonormal basis of 𝑉.
],[See LADR 6.35 and 6.36])

#defn([Linear Functional],[A linear functional on $V$ is a linear map from $V "to" FF$. Denote the space of linear functions as $L(V, FF)$   ])

#remark([1. Range is a "number" \ 2. $L(V, W) arrow L(V, FF) $ if we set $W = FF$ \ 3. $||dot||: V arrow RR$ is in general not linear \ 4. $angle.l v,u angle.r$: fix $u$ choose $v in V$, then this inner product is a linear functional (recall that it will be linear in the first (as well as second in the real case) slots)]) \

#example([],[Define the map $phi.alt: P_2([-1,1]) arrow RR$ where $P(x) = int_(-1)^1 p(x) cos(pi x )dx$ \

Excercise: show that $phi.alt$ is linear. \

Note that $phi.alt(p) =^"def" $ (continued in lecture notes)])

#thm([Riesz Representation Theorem],[Given a finite-dimensional inner product space $V$. Let $phi.alt$ be a linear functional on $V$. Then there exist a unique element $u in V$ such that $phi.alt(v) = angle.l v, u angle.r$ for any $v in V$ \ We say that $u$ is the representatin of $phi.alt$ in $V$.        ],[

Find a $u$ that satisfies the theorem, and prove that $u$ is unique. \

Assume ${e_i}_(i=1)^n$ is an orthonormal basis of $V$. \

Let $v = angle.l v, e_1 angle.r e_1 + dots + angle.l v, e_n angle.r e_n$ \

Then $phi.alt(v) = phi.alt(angle.l v, e_1 angle.r e_1 + dots + angle.l v, e_n angle.r e_n) = angle.l v, e_1 angle.r phi.alt(e_1) + dots + angle.l v, e_n angle.r phi.alt(e_n) =  angle.l v, overline(phi.alt(e_1))e_1 angle.r + dots + angle.l v, overline(phi.alt(e_n)) e_n angle.r = angle.l v, u angle.r $ \

If we define $u = overline(phi.alt(e_1)) e_1 + dots + overline(phi.alt(e_n)) e_n in V$ \

Excercise: prove that $u$ is unique. \

Let $u_1, u_2$ and $u_1 eq.not u_2$ \

Consider $u_1 - u_2 = 0$ and find a contradiction (hint: in the book) 


])
#remark([$u_(phi.alt)$ is the representation of $phi.alt$, $u_(phi)$ is representation of linear functional $phi$, etc. \

Note the following bijection: $L(V, FF) tilde.equiv V$. In other words $phi.alt in L(V, FF) arrow.l.r u_(phi.alt)$ is a one to one map. It follows that for f.d.v.s that $dim(L(V, FF)) = dim(V)$ \

For a fixed $phi.alt$, its represenation $u_(phi.alt)$ is uniform regardless of input $v$   

])
#example([possibilities of Riesz Rep Theorem],[

consider $f(x): RR^n arrow RR arrow.l.r u = (x_1, x_2, dots, x_n)$ \

Another example: consider the previous linear functioal $phi.alt(p)$: \

$phi.alt(p) = int_(-1)^1 p(x) cos(pi x) dx arrow.l.r q in P_2([-1, 1])$ \

Then recall that $u_(phi.alt) = phi.alt(e_1)e_1 + phi.alt(e_2)e_2 + phi.alt(e_3)e_3 in P_2([-1,1])$ where ${e_1, e_2 e_3}$ form an ON basis. \

Using grahm schmidt we convert ${1, x, x^2} arrow {sqrt(1/2), sqrt(3/2)x, sqrt(45/8)(x^2 - 1/3)}$ \

And compute that $u_(phi.alt) = - 45/(2pi^2) (x^2 - 1/3)$ \

Then $phi.alt(p) = angle.l p, cos(pi x) angle.r = angle.l p(x), -45/(2 pi^2)(x^2 - 1/3) angle.r$ \

In fact, we have $cos(pi x) = u_(phi.alt) + w(x)$ such that $w(x)$ is orthogonal to the orthonormal basis ${e_1, e_2, e_3}$  \

i.e. that $int_(-1)^1 e_i (x) w(x) = 0$ for $e_1 = 1, e_2 = x, e_3 = x^2$ \

Recall that the definition of inner product over the space of $P_2([-1,1])$ is $angle.l p_1(x), p_2(x) angle.r = int_(-1)^1 p_1 (x) p_2 (x) dx$ \

Note that $angle.l cos(pi x), e_1 angle.r = angle.l u_(phi.alt) + w(x), e_1 angle.r = angle.l u_(phi.alt), e_1 angle.r + angle.l w(x), e_1 angle.r = angle.l u_(phi.alt), e_1 angle.r $ and since $w(x)$ is orthogonal we can simply remove $w(x)$ from $cos(pi x)$ and still obtain the same vector in $P_2([-1,1])$ (expand to all $e_i$ )    


])

#remark([

Remark: the Riesz Rep theorem can be generalized to infinite-dimensional space

 ])

== January 28

#remark([Midterm 1

LADR 6A, 6B (no upper triangular matrix parts e.g. schur's theorem) \

inner products, norm, orthogonality, orthonormal bases, gram-schmidt

Some reminders: \

Some inner products are defined explicitly (such as the dot product) \

Recall different norms: $||u||_1, ||u||_2, ||u||_("max")$  \

Examples of norm squared include $||f||^2 = int_(-1)^1 f^2 dx$ or $||f||^2 = int_(-infty)^infty f^2 e^(-x/2) dx$ and etc. \

Recall the 4 axioms of inner product (5 in textbook) and 3 axioms of norms \

Cauchy-Schwarz, parallelogram, triangle, pythagorean, etc. \

Review linearity, injectivity, surjectivity \

compute gram schmidt by hand (!) \

compute Riesz represenation by hand (!) \

other review: some integration (calculation), basis, dimension, linear independence \

true false, proof, computation

])

#remark([
Riesz represenation: questions for future lectures (not on final): 

Recall that our construction for the "representation" of a linear functional depends on the choice of orthonormal basis \

For the same functional, its representation varies depending on the choice of $V$ 
])

We now turn to section (3E) product/quotient space and (6C) (orthogonal complements) \

#note([

The inner product $angle.l dot \, dot angle.r: V times V arrow FF $ has a domain $V times V$, where $V times V$ is a product space   

])

#prop([The product space $V_1 times dots times V_n$ is a vector space.\ Where we define $V_1 times dots times V_n = {(v_1, v_2, dots, v_n): v_i in V_i}$. \

And for this set, vector addition and scalar multiplication is coordinate wise / distributes to each coordinate as usual. \
  ],[

We need to check the vector space axioms
])

#thm([],[$dim(V_1 times dots times V_n) = dim(V_1) + dots + dim(V_n)$ ],[

In LADR 3.92 \

Remark: observe that $RR^4 = RR times RR^3 = RR^2 times RR^2$ (all of these product space are equal). i.e. $(a,b,c,d)=(a,b,c)times(d)=(a,b)times(c,d)$ \

We can consturct the basis $ (e_1, 0, dots, 0), (e_2, 0, dots, 0), dots, (e_n_1, 0, dots, 0) \ (0, f_1, dots, 0), (0, f_2, 0 dots, 0), dots, (0,f_n_2,0, dots ,0) $ \

Where e_i is a basis for $V_1$, f_i is a basis for $V_2$ etc. and their cooresponding dimensions are $n_1, n_2, dots$ \ 


Alternatively, we can consider some isomorphisms \

Consider $V_1 eq^tilde RR^(n_1), dots, V_n eq^tilde RR^(n_n)$ by LADR 3.70 \

Then we can try to see if $V_1 times dots times V_n$ is isomphic to $RR^(n_1) times dots times RR^(n_n) = RR^(n_1 + dots + n_n)$  
])


#defn([Orthogonal complement], [

Let $U, V$ be vecor spaces such that $U subset.eq V$ Denote the orthogonal complement of $U$ to be $U^perp$ defined by  

$ U^perp = {v in V: angle.l v, u angle.r = 0 (forall u in U)} $ \

Properties (LADR 6.48) \

$U^perp$ is a subspace (note that $0 in U^perp$) \

${0}^perp = V$ \

$V^perp = {0}$ \

$U sect U^perp subset.eq {0}$. In particular if $U$ is a subspace then $U + U^perp = U plus.circle U^perp$ is a direct sum. Recall that sum of $U, V$ is a direct sum iff $U sect V = {0}$ \

If $U, W$ are subsets of $V$ with $U subset.eq W$ then $W^perp subset.eq U^perp$ \


])

#example([Orthogonal complement (has potential issues)],[

  Consider the z axis (represented by U) \

Let $U = {k(0,0,1): k in RR}$ then the orthogonal complement is $U^perp = {v in RR^3: v_1 dot 0 + v_2 dot 0 + v_3 dot k = 0} = {vec(v_1, v_2, 0): v_1, v_2 in RR}$ (i.e. the complement is the x-y plane) 

])

== Feb 4

#note([Midterm 1\ 

Median 14.4/18 \

Mean 13.82/18 \

SD 3.7/18 \

reflection: present in lecture earn 2.4/18 extra, OH earn 1.6/18 extra \

midterm 1 bonus: present between feb 4 and feb 13 in lectures, feb 4 and feb 20 in OH \

if not selected for lectures, can present in office hours \

])

Continuation of LADR 6.C + 3.E

#prop([If $U, W$ are subsets of $V$ with $U subset.eq W$ then $U^perp supset.eq W^perp$  \

],[


WTS: if $v in W^perp$ show that $v in U^perp$ \

According the definition of orthogonal complement, the equivalent statements are that for any $w in W$, $angle.l v, w angle.r = 0$ and for any $u in U$, $angle.l v, u angle.r = 0$ \

Note that for any $u in U$, since $U subset.eq W$, $u in W$. Given $v in W^perp, angle.l v, w angle.r = 0 $ for any $w in W$, so $angle.l v, u angle.r = 0$ since $ u in W forall u$        

])

#thm([Decomposite Vector Space],[

Given a subspace (finite dim) $U$ of vector space $V$ we can decompose $V$ as follows: $ V = U plus.circle U^perp $ (We call $U$ the "main part" and $U^perp$ the "residue" part)   

],[

Let an orthonormal basis of $U$ be ${e_1, e_2, dots, e_m}$  (guaranteed to exist by gram-schmidt) \

First we should prove that $V = U plus.circle U^perp$ by showing that each $v in V$ can be written as a sum of an element from $U$ and and an element from $U^perp$ \

Define $v = angle.l v, e_1 angle.r e_1 + dots + angle.l v, e_m angle.r e_m + v - angle.l v, e_1 angle.r e_1 - dots - angle.l v, e_m angle.r e_m $ \

Consider the inner product $angle.l w, e_k angle.r = angle.l v, e_k angle.r - angle.l v, e_k angle.r = 0$ \

Thus we know that $w$ is orthogonal to every vector in $span(e_1, dots, e_m)$  which shows that $w in U^perp$  \

Second, we can not that $U sect U^perp = {0}$ and therefore the sum is a direct sum 

])

#cor([],[if $V$ is f.d.v.s. and $U$  is a subspace of $V$ then $ dim(U)+dim(U^perp) = dim(V) $   ],[

Follows from the direct sum properties (LADR 3.94)

])

#example([Orthogonal Complement],[

Let $U = {vec(x,y,z): x,y in RR}$ (note that this is a subset, not a subspace)\

Let the orthogonal complement be $U^perp = {v = vec(a,b,c): angle.l v, u angle.r = a x + b y + 2 c = 0 forall x,y in RR}$ \

Since $a=b=c=0$ by necessity then $U^perp = {(0,0,0)}$ \

Note that we cannot compute $dim(RR^3) = dim(U) + dim(U^perp)$ since $U$ is only a subset (not a subspace) 

"Affine space?" (TODO)
])

#example([Orthogonal Complement],[

The orthogonal complement of the xy plane is the z axis \

Call them $W, W^perp$ respectively then $W = {vec(x,y,0): x,y in RR}$ and $W^perp = {vec(0,0,k): k in RR}$ \

Then $dim(RR^3)+ dim(W) + dim(W^perp) = 2 + 1 = 3$ 

])

#thm([],[(LADR 6.52) If $U$ is a finite-dim subspace of $V$ then $U = (U^perp)^perp $   ],[

1. First, let $u in U$ then for all $w in U^perp$ we have $angle.l u, w angle.r = 0$. Since each $u$ is orthogonal to any element in $U^perp$, it follows that $u in (U^perp)^perp$ and therefore $U subset.eq (U^perp)^perp$  \

2. Second, let $v in (U^perp)^perp $ then $v = u + w$ where $u in U, w in U^perp$ (since $V = U plus.circle U^perp$ ) \

First observe that $u in U arrow.double u in (U^perp)^perp$ and therefore $v - u in (U^perp)^perp$ \

Next observe that $v - u = w in U^perp$ \

Hence $v - u in U^perp sect (U^perp)^perp arrow.double v - u = 0 arrow.double v = u arrow.double v in U$. Therefore $(U^perp)^perp subset.eq U$ \

Since we have proven both inclusions the claim follows.


])

#defn([Orthogonal projection of V onto a subspace U],[

Define the orthogonal projection of $V$ onto a subspace $U$ by $P_U: V arrow V$ which maps $v in V arrow u in U$ where $v = u + w$ such that $u in U, w in U^perp$ \

Note that $P_U (u)=u$ ($u$ is already in $U$). In particular, $U = {k u: u in V, k in FF}$ \

An explicit formula is $P_U (v) = (angle.l v, u angle.r)/(angle.l u, u angle.r) u$ (note the connection to the orthogonal decomposition) 


])

== Feb 6

#note([
Last Time: orthogonal projection

Given a subspace $U subset.eq V$, $v = u + w$ (vectors), $V = U plus.circle U^perp$ (for vector spaces) \

where $u in U, w in U^perp$ \

We have the map $P_U: V arrow V$ which maps $v arrow u = P_U (v)$    ])

#note([Orthogonal Projection is one type of projection. In general, we can have more general projections onto some subspace. \ 

It's just that in orthogonal projection, the projection must be done such that it is orthogonal to the subspace being projected onto
])

#defn([Projection],[

Consider $P: V arrow V$, then $P$ is a projection if $P (P(v)) = P(v)$ i.e. $P^2 = P$     ("two consecutive operations equivalent to one operation") \

])

#defn([Orthogonal Projection],[

$P$ is an orthogonal projection if $ cases(P^2 = P, (angle.l P(v), u angle.r = angle.l v, P(u) angle.r) ("this is not true in the case of general projection")) $   

A geometric interpretation is $angle.l v, P(u) angle.r = ||v|| dot cos theta ||P(u)|| = ||P(v)|| dot ||P(u)|| = angle.l P(v), u angle.r$ 

])

#remark([LADR 6.57 lists some properties of orthogonal projection (some properties also hold for general projections) 

One strategy to prove these definitions might be to let $v = P_U (v) + w$ with $P_U (v) perp w$ then this implies that $angle.l P_U (v), v - P_U (v) angle.r = angle.l P_U (v), w angle.r = 0$ (see the definition of orthogonal projection)  

])

#prop([$||P_U (v)|| lt.eq ||v||$ ],[

Note the pythagorean theorem: $||P_U (v)||^2 + ||v - P_U (v)||^2 = ||v||^2$    

])

#prop([Let $U = span{e_1, e_2, dots, e_n}$ be an orthonormal basis. Then $P_U (v) = angle.l v, e_1 angle.r e_1 + dots + angle.l v, e_n angle.r e_n$  ],[

  Not given in lecture (but should be obvious considering the representation of elements in vector space with respect to orthonormal bases)
])

#thm([],[Let $U$ be a subspace of $V$, for any $v in V$ then $ ||v - P_U (v)|| = min_(u in U) || v - u|| lt.eq ||v-u|| "for any" u in U $  

#remark([

$"dist"(v, u) = min_(u in U) ||v-u||$ and $P_U (v) = "argmin"_(u in U) ||v - u||$  

])

  ],[


$ ||v - P_U (v)||^2 lt.eq ||v - P_U (v)||^2 + ||P_U (v) - u ||^2 = ||v - P_U (v) + P_U (v) - u||^2 = ||v-u||^2 $ (LADR 6.61)
])

#notation([

$P_U:$ orthogonal projection onto a subspace $U$ \

$P_C:$ orthogonal projection onto a closed convex subset $C$ (which is a generalization of $P_U$ )  \

Such $P_C$ is fundamental in convex analysis/optimization 

])

#defn([$P_C$],[

define $P_C$ to be $ P_C = argmin_(y in C) ||y - x|| = argmin_(y in C) ||y-x||^2 $ We can also write $P_C (x) = argmin_(y in C) 1/2 ||y-x||^2$ for cleaner derivatives

])

#prob([

Example Problem: Given $x = (x_1, x_2, dots, x_n)$ \


(i) find $min ||y-x||^2 "s.t." y in RR^n_(gt.eq 0)$ \

(ii) find $min ||y-x||^2 "s.t." y in "unit ball i.e." ||y|| lt.eq 1$ 

],[

\ 

We can reformulate the problem: $C = {y in RR^n: y "subject to constraint"}$ \

Then the constrained optimization problem becomes $"dist"(x,c)$ = optimal obj value. \

In other words $P_C (x)$ = minimizer solution (follows from previous theorem) \

Therefore we would like to study operators such as $P_C: V arrow V$ \

Examples of possible $C$ might be $C = {k u: k in RR} = span(u)$ (note that $P_C (v) = (angle.l v, u angle.r)/(angle.l u, u angle.r) u$ )  or \ $C = {||y|| lt.eq 1}$ (note that here, $ P_C(x) = {x "if" ||x|| lt.eq 1; x/(||x||) "if" ||x|| > 1} $ ) (either pick the point itself is in the ball, or normalize the vector to length 1) 

])

#theorem([Orthogonal Projection characterization],[

Given a closed convex subset $C $, for every $x in V$: $ z = P_C (x) iff angle.l y - z, x - z angle.r = ||y-z|| dot ||x-z|| cos theta lt.eq 0$ for any $y in C $  \

In other words, the angle between $y-z $ and $x - z $  is greater than $90 $ degrees 

],[])