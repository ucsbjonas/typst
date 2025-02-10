#import "nate_template.typ": *

#let title = "intro to modern cryptography"
#let author = "Alice Bob"

#show: notes.with(title, author)

= Appendix A: Mathematical Background

== Identities and Inequalities

#thm(
  [binomial expansion],
  [$(x+y)^n = sum_(i=0)^n binom(n, i) x^i y^(n-i)$ for $x, y in RR "and" n > 0 in ZZ$],
  [Example: $(x+y)^4 = x^4+ 4 x^3 y + 6 x^2 y^2 + 4 x y^3 + y^4$],
)

#prop(
  [A.2 For all $x gt.eq 1$ it holds that $(1 - 1/x)^x lt.eq e^(-1)$],
  [],
  [Taking the natural logarithm of both sides we obtain $ ln(1 - 1/x)^x = x ln(1 - 1/x) lt.eq -1 $ \

    Using a solver (which suggests l'hospital's rule) we can observe that \ $ lim_(x arrow infinity) x ln(1 - 1/ x) = -1 $ \

    Additionally the derivative (by the product rule) of $x ln(1 - 1/x )$ is $ ln(1 - 1/x) + 1 / (x-1) $ which is positive
    and decreasing for $x gt 1$, indicating that this function is increasing at a diminishing rate towards $-1$.],
)

#prop(
  [A.3: For all $x$ it holds that $1 - x lt.eq e^(-x)$],
  [This proof is incomplete, since I copied down the statement wrong (originally was for all $x gt.eq 1$)],
  [Taking the natural logarithm of both sides, we obtain $ ln(1-x) lt.eq -x arrow.double \ -ln(1-x) gt.eq x $ and has
    derivative $ 1/(1-x ) = d/dx -ln(1-x) $ indicating that the derivative is negative and increasing for $x gt.eq 1$
  ],
)

#prop(
  [A.4: For all $x$ with $0 lt.eq x lt.eq 1$ it holds that $ e^(-x) lt.eq 1 - (1 - 1 / e) dot x lt.eq 1 - x/2$],
  [],
  [

    Note that $ (1-1/e) dot x = x - x/e = (e x) / e - x/e = x(e - 1) / e $ and $ x(e-1)/e gt.eq x/2 equiv (e-1)/e gt.eq 1/2 equiv 0.63 dots gt.eq 0.5 $ is
    true proving the right hand side \

    For the left hand side, we can take natural log of both sides and obtain $ -x lt.eq ln(1 - 0.63 x) equiv x gt.eq ln(1 - 0.63 x) $

  ],
)

== Asymptotic Notation

#defn(
  [$O, Omega ,Theta, o, omega$],
  [Let $f(n), g(n)$ be functions from non negative integers to non negative reals, Then \

    $f(n) = O(g(n)) arrow f(n) lt.eq c dot g(n) "(upper or equal bound)" \ f(n) = Omega(g(n)) arrow f(n) gt.eq c dot g(n) "(lower or equal bound)" \ f(n) = Theta(g(n)) arrow c_1 dot g(n) lt.eq f(n) lt.eq c_2 dot g(n) "(exact bound)" \ f(n) = o(g(n)) arrow lim_(n arrow infinity) f(n) / g(n) = 0 "(strictly upper bound)"\ f(n) = omega(g(n)) arrow lim_(n arrow infinity) f(n) / g(n) = infinity "(strictly lower bound)"$],
)

== Basic Probability

#defn([basic probability], [

  Let $E$ be an event. \

  $overline(E)$ is event that $E$ does not occur. $Pr[E] = 1 - Pr[overline(E)]$ \

  Let $E_1 and E_2$ be the event that both $E_1$ and $E_2$ occur. Note that $Pr[E_1 and E_2] lt.eq Pr[E_1]$ \

  Two events are independent if $Pr[E_1 and E_2] = Pr[E_1] dot Pr[E_2] $ \

  Let $E_1 or E_2$ be the event that either $E_1$ or $E_2$ occurs. Note that $Pr[E_1 or E_2] gt.eq Pr[E_1]$ \

])

#prop([Union Bound], [$ Pr[E_1 or E_2] lt.eq Pr[E_1] + Pr[E_2] $], [
  \ Repeated application of union bound give \
  $ Pr[or_(i=1)^k E_i] lt.eq sum_(i=1)^k Pr[E_i] $
])

#defn(
  [Conditional Probability, Bayes' Theorem],
  [

    Let $Pr[E_1 | E_2]$ be the conditional prbability of $E_1 "given" E_2$ and is defined as $ Pr[E_1 | E_2] =^"def" (Pr [E_1 and E_2]) / Pr[E_2], Pr[E_2] eq.not 0 $

    Which represents the probability that event $E_1$ occurs given that event $E_2$ occured. \

    Note that $Pr[E_1 | E_2] dot Pr[E_2] = Pr[E_1 and E_2]$ which gives rise to Bayes' theorem: \

    $ Pr[E_1 | E_2] = Pr[E_1 and E_2] / Pr[E_2] = Pr[E_2 and E_1] / Pr[E_2] = (Pr[E_2 | E_1] dot Pr[E_1]) / Pr[E_2] $
  ],
)

#prop(
  [A.9: Tighter Union Bound],
  [$Pr[or_(i=1)^k E_i] lt.eq Pr[E_1] + sum_(i=2)^k Pr[E_i | overline(E_1) and dots and overline(E)_(i-1)]$],
  [By intuition],
)

#defn(
  [Expected Value of $X$],
  [

    A discrete, real valued random variable $X$ is a variable which is probabilistically assigned a value from some finite
    set $S$ of real numbers. \

    Denote the expected value of $X$ to be $Exp[X]$ \

    Then $Exp[X] =^"def" sum_(s in S) s dot Pr[X=s]$ \

    Linearity: $Exp[sum_i X_i] = sum_i Exp[X_i]$ \

    Independence: if $X_1, X_2$ are independent, then $Exp[X_i dot X_j] = Exp[X_i] dot Exp[X_j]$

  ],
)

#prop(
  [A.10: Markov's inequality],
  [Let $X$ be a non-negative random variable and $v gt 0$. Then $Pr[X gt.eq v] lt.eq (Exp[X])/v $],
  [

    For some set $S$, let $X$ take on values in set $S$. Then \
    $ Exp[X] = $
    #align(
      center,
      block[
        #set align(left)
        $ sum_(s in S) s dot Pr[X=s] $ $ gt.eq sum_(X=s in S, X lt v) 0 + sum_(X=s in S, X gt.eq v) v dot Pr[X = s] $ $
          = v dot Pr[X gt.eq v]
        $ \
      ],
    )

    By linearity of the constant $s$ and using that face that $X$ taking on some list of values is mutually exclusive. We
    replace $s$ with $v$ in the third line since $X = s gt.eq v$ preserving the inequality.

  ],
)
#defn([Variance of $X$], [

  Denote the variance of some random variable $X$ as $Var[X]$ \
  Variance measures how much $X$ deviates from its expectation, therefore \
  $ Var[X] =^"def" Exp[(X - Exp[X])^2] = Exp[X^2] - Exp[X]^2 $

  We can also "easily" show that $Var[a X + b] = a^2 Var[X]$ \

  https://www.quora.com/How-do-you-prove-the-variance-rule-V-aX-b-a-2-V-X
])

#prop(
  [Variation Bound on 0/1 random variable],
  [For a 0/1 random variable $X_i$, it holds that $ Var[X_i] lt.eq 1/4 $],
  [

    Let the probability that $X_i = 1$ be $p$. Then probability that $ X_i = 0$ is $1 - p$ \

    Using the definition of expectation, we can see that $Exp[X] = 1 p + 0(1-p) = p forall p $ and $ Var[X_i] = (1-p)^2 dot p + (0-p)^2 dot (1-p) = -p^2 + p = p (1-p) lt.eq 1/4 $ for
    all $p$

  ],
)

#prop(
  [: Chebyshev's Inequality],
  [Let $X$ be a random variable and $delta > 0$. Then: $ Pr[ |X - Exp[X]| gt.eq delta] lt.eq Var[X]/delta^2 $],
  [

    We can apply Markov's inequality:

    $
      Pr[ |X - Exp[X]| gt.eq delta] = Pr[ (X - Exp[X])^2 gt.eq delta^2] lt.eq (Exp[(X - Exp[X])^2]) / delta^2 = Var[X] / delta^2
    $
  ],
)

#remark(
  [: Pairwise Independence, Linearity of Variance in special case],
  [

    The 0/1 random variables $X_1, dots, X_m$ are pairwise independent if for every $i eq.not j$ and every $b_i, b_j in {0,1}$ it
    holds that $ Pr[X_i = b_i ∧ X_j = b_j] = Pr[X_i = b_i] · Pr[X_j = b_j ] $

    If $X_1, . . . , X_m$ are pairwise independent then $Var[
    sum_(i=1)^m X_i
    ] = sum_(i=1)^m Var[X_i]$. \

    Note that variance is not linear in general

  ],
)

#coro(
  [: A.12],
  [Let $X_1, dots, X_m$ be pairwise-independent random variables with the same expectation $mu$ and variance $sigma^2$.
    Then for every $delta gt 0$, $ Pr[ |(sum_(i=1)^m X_i)/m - mu| gt.eq delta ] lt.eq sigma^2/(delta^2 m) $],
  [In the book (this uses the fact that $Var[a X + b] = a^2 Var[X]$)],
)

#prop(
  [: A.13],
  [Fix $epsilon gt 0$ and $b in {0,1}$ and let $X_i$ be pairwise independent, 0/1 random variables for which \ $Pr[X_i = b] gt.eq 1/2 + epsilon$ for
    all $i$. Consider the process in which $m$ values $X_1, dots, X_m$ are recorded and $X$ is set to the value that occurs
    a strict majority of the time. Then $ Pr[X eq.not b] lt.eq 1/(4 epsilon^2 m) $],
  [

    Assume that $b = 1$; by symmetry (without loss of generality absolute value in the inequality below). In this case, $Exp[X_i] = 1/2 + epsilon$.
    Let $X$ denote the strict majority of the ${X_i}$ as in the proposition, and not that $X eq.not 1$ iff $sum_(i=1)^m X_i lt.eq m/2$.
    Therefore, $ Pr[X eq.not 1] = Pr[ sum_(i=1)^m lt.eq m/2] = Pr[(sum_(i=1)^m X_i)/m - 1/2 lt.eq 0] = Pr[(sum_(i=1)^m X_i)/m - (1/2 + epsilon) lt.eq -epsilon] \ lt.eq Pr[ |(sum_(i=1)^m X_i)/m - (1/2 + epsilon)| gt.eq epsilon] lt.eq 1/(4 epsilon^2 m) $ \

    Where the last line follows from the fact that $Var[X_i] lt.eq 1/4$ for all $i$ (proved in 1.3.8) and the corollary just
    proved (1.3.11).

  ],
)

#prop(
  [: A.14 (Chernoff Bound)],
  [Fix $epsilon gt 0$ and $b in {0,1}$ and let $X_i$ be pairwise independent, 0/1 random variables for which \ $Pr[X_i = b] gt.eq 1/2 + epsilon$ for
    all $i$. then the probability that their majority value is not $b$ is at most $ e^((-epsilon^2 m) \/ 2) $],
  [

    Not included, this is a tighter bound than the one in proposition A.13 (1.3.12) ],
)

== Birthday Problem

#remark(
  [: Background],
  [

    We introduce the notation $"coll"(q, N)$ which denotes the probability that there exists distinct $i, j$ such that $y_i = y_j$ where $y_1, dots, y_q$ are $q$ elements
    chosen uniformly from a set of size $N$

    If we assume that there are 365 birthdays a year, then $q = 23$ satisfies $"coll"(q, 365) gt.eq 1/2$ (only need 23
    people to have a more likely than not chance that a pair of them share the same birthday)

  ],
)

#prop(
  [: upper and lower bounds of $"coll"(q, N)$],
  [Claim: If $q lt sqrt(N)$ then the probability of collision $"coll"(q, N)$ is $Theta(q^2 / N)$ \
    Alternatively, for $q = Theta(sqrt(N))$ the probability of a collision is "constant".],
  [

    #lemma(
      [upper bound of $"coll"(q, N)$],
      [

        Fix a positive integer $N$, and suppose that $q$ elements $y_1 dots y_q$ are chosen uniformly and independently at
        random from a set of size $N$. Then $ "coll"(q, N) lt.eq q^2 / (2N) $

      ],
      [

        Note that $Pr["Coll"_(i, j)] = 1/2$ is the probability of collision for a particular distinct $y_i, y_j$ \

        Let Coll be the event that a collision occurs.

        If we apply the union bound repeatedly, we obtain $ Pr["Coll"] = Pr[or_(i eq.not j) "Coll"_(i j)] lt.eq sum_(i eq.not j) Pr["Coll"_(i j)]= vec(q, 2) dot 1/N = (q (q - 1) (q - 2)!) / (2! (q - 2)!) lt.eq q^2 / (2N) $

      ],
    )

    #lemma(
      [lower bound of $"coll"(q, n)$],
      [

        Fix a positive integer $N$, and let $q lt.eq sqrt(2N)$ as in the original claim. Then $ "coll"(q, N) gt.eq 1 - e^(-q(q-1)\/2N) gt.eq (q(q-1))/(4N) $

      ],
      [

        Let Coll be the event that there exist distinct $i, j$ such that $y_i = y_j$ \

        Let $"NoColl"_i$ be the event there is no coliision among $y_1, dots, y_i$ \

        Let $"NoColl"_q = overline("Coll")$ be the event there is no collision overall \

        Then $Pr["NoColl"_q] = Pr["NoColl"_1] · Pr["NoColl"_2 | "NoColl"_1] dots Pr["NoColl"_q | "NoColl"_(q−1)]$ \

        Note that $Pr["NoColl"_1] = 1$ ($y_1$ cannot collide with itself)\

        $"NoColl"_i$ occurs when ${y_1, dots, y_i}$ contains $i$ distinct values, so that probability that $y_(i+1)$ collides
        with this set of values is $i / N$ and prob that $y_(i+1)$ does not collides is $1 - i/N$. \

        Therefore $Pr["NoColl"_(i+1)|"NoColl"_i] = 1 - i/N$ and $Pr["NoColl"_q] = prod_(i=1)^(q-1) (1 - i/N)$ \

        By inequality A.3 we have that $1 - i/N lt.eq e^(-i/N)$ \

        Therefore $ Pr["NoColl"_q] lt.eq prod_(i=1)^(q-1) e^(-(i/N)) = e^(- sum_(i=1)^(q-1) (i/N)) = e^(-q(q-1)/(2N)) $

        Where the last equality holds according to the formula for the sum of the first $i$ natural numbers $n(n+1)/2$ \

        Recall that taking "1 minus" of both sides of the equality flips the sign, then $ Pr["Coll"] = 1 - Pr["NoColl"_q] gt.eq 1 - e^(- q(q-1)/(2N)) gt.eq (q(q-1))/(4N) $ \

        Note that by inequality A.4 we have that $e^(-x) < 1 - x/2$ for $0 lt.eq x lt.eq 1$. \

        Let $x = q(q-1)/(2N)$. Then by the initial condition that $q lt.eq sqrt(2N)$, we know that $ q(q-1)/(2N) < sqrt(2N)(sqrt(2N) - 1) = 2N - sqrt(2 N) < 1 $ so
        we can use the equality to prove the last inequality: $ e^(-x) lt.eq 1 - x/2 arrow.double e^(-(q(q-1)/(2N))) lt.eq 1 - (q(q-1))/(4N) arrow.double 1 - (e^(-(q(q-1)/(2N))) gt.eq 1-( 1 - (q(q-1))/(4N))) $

      ],
    )
    After proving the upper and lower bounds, the claim holds. ],
  breakable: true,
)

== Finite fields

(skip for now)

= Number theory

