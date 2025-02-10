// see https://github.com/gRox167/typst-assignment-template

// differentiation and integration
#let integer = int       // swapping the shorthand
#let int = sym.integral  // for these two
#let dint = $integral.double$
#let tint = $integral.triple$
#let surfint = $integral.surf$
#let volint = $integral.vol$
#let clint = $integral.cont$
#let dt = $d t$
#let dx = $d x$
#let dy = $d y$
#let dz = $d z$
#let df = $d f$
#let dg = $d g$
#let dh = $d h$
#let ds = $d s$
#let du = $d u$
#let dv = $d v$
#let dr = $d r$
#let dmu = $d mu$
#let dw = $d w$
#let dtheta = $d theta$
#let dphi = $d phi$
#let dpsi = $d psi$
#let contint1 = $int_C f(z) dz$
#let contint2 = $int_gamma f(z) dz$
#let del = $partial$
#let deriv(x, n: 1) = {
  if (n == 1) {
    $d / (d #x)$
  } else {
    $d^#n / (d^#n #x)$
  }
}
#let pderiv(x, n: 1) = {
  if (n == 1) {
    $partial / (partial #x)$
  } else {
    $partial^#n / (partial^#n #x)$
  }
}
#let grad = $gradient$
#let div(x) = $grad dot #x$
#let curl(x) = $grad times #x$
#let lapl = $laplace$

// misc
#let infty = sym.infinity
#let pm = sym.plus.minus
#let sim = sym.tilde.op
#let st = "such that"
#let fs = "for some"
#let Sps = "Suppose"
#let Spst = "Suppose that"
#let iff = "if and only if"
#let wlog = "without loss of generality"
#let Wlog = "Without loss of generality"
#let cdots = $#h(0.2em) dot #h(0.2em) dot #h(0.2em) dot #h(0.2em)$
#let Id = "Id"
#let comp = $compose$
#let propto = $prop$
#let Im = [#math.op("Im")]
#let hbar = $planck.reduce$
#let mapsto = $arrow.r.long.bar$
#let sgn = [#math.op("sgn")]
#let varphi = $phi.alt$  // latex habits
#let qed = [#v(0.2em) #h(90%) $square.big$]

// topology
#let boundary = sym.diff
#let clo(a) = $overline(#a)$

// misc analysis
#let Arg = [#math.op("Arg")]
#let Log = [#math.op("Log")]
#let argmin = [#math.arg]+[#math.min]
#let Res = math.limits(math.op("Res"))
#let vtr(arg) = math.bold(math.upright(arg))
#let conj(a) = $overline(#a)$

// rename defaults so we can have text underneath inline
#let sup = math.limits(math.op("sup"))
#let max = math.limits(math.op("max"))
#let inf = math.limits(math.op("inf"))
#let min = math.limits(math.op("min"))
#let limsup = math.limits(math.op("limsup"))
#let liminf = math.limits(math.op("liminf"))
#let prod = math.limits($product$)
#let sum = math.limits($sum$)

// linear algebra
#let proj = [#math.op("proj")]
#let null = [#math.op("null")]
#let span(..args) = {
  let joined = args.pos().map(x => $#x$).join(",")
  $"span"{ joined }$
}
#let range = [#math.op("range")]
#let ip(x, y) = $angle.l #x, #y angle.r$  // inner product
#let tr = [#math.op("tr")]  // trace
#let dsum = $plus.circle$  // direct sum
#let tp = $times.circle$  // tensor product

// stats
#let Var = [#math.op("Var")]
#let Bin = [#math.op("Bin")]
#let Exp = [#math.op("Exp")]
#let Poisson = [#math.op("Poisson")]
#let Geom = [#math.op("Geom")]

// algebra
#let eclass(a) = $overline(#a)$
#let Mod(z) = $#h(0.25em)$ + "(" + $mod$ + z + ")"
#let inv(a) = $#a^(-1)$
#let ord = [#math.op("ord")]
#let cycle(..args) = {
  let joined = args.pos().map(x => $#x$).join($space$)
  $(joined)$
}
#let cyc(a) = $angle.l #a angle.r$  // cyclic subgroup
#let normsub = $lt.tri.eq$
#let notnormsub = $lt.tri.eq.not$
#let Aut = [#math.op("Aut")]
#let Inn = [#math.op("Inn")]
#let GL = [#math.op("GL")]
#let SL = [#math.op("SL")]
#let iso = $tilde.equiv$
#let notiso = $tilde.equiv.not$
#let rcoset = $#h(0cm) \\ #h(0cm)$  // right coset

// number theory
#let lcm = [#math.op("lcm")]

// quantum mechanics
#let pli = $+ #h(0em) i$
#let nei = $- #h(0em) i$

#show link: underline

#let problem_counter = counter("problem")
#let exercise_counter = counter("exercise")

#let correction(body) = {
  text(fill: rgb("#ea4120"), weight: "semibold", body)
}

#let proof(body) = {
  [_Proof_:]; body; qed
}

#let defn(term, definition) = {
  block(
    fill: rgb("#cceeff"),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb(51, 173, 255),
    breakable: false,
    stack(
      [=== _Definition_: #term],
      pad(
        top: 12pt,
        bottom: 10pt,
        left: 12pt,
        definition
      )
    )
  )
  // figure(kind: "defn", supplement: "")[]
}

#let thm(name, statement, proof, breakable: false) = {
  let header
  if (name.has("text")) {
    header = "Theorem:"
  } else {
    header = "Theorem"
  }
  block(
    fill: rgb("#faf1fd"),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb("#6913d1"),
    breakable: breakable,
    stack(
      [=== _ #header _ #name],
      pad(
        top: 12pt,
        bottom: 20pt,
        left: 12pt,
        block(
          fill: rgb("#dfc1e6"),
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: rgb("#87739a") + 6pt
          ),
          statement
        )
      ),
      [*Proof*],
      pad(proof + qed, top: 12pt),
    )
  )
}

#let lemma(name, statement, proof) = {
  block(
    fill: rgb("#fcffcc"),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb("#abc00c"),
    breakable: false,
    stack(
      [=== _Lemma_: #name],
      pad(
        top: 12pt,
        bottom: 20pt,
        left: 12pt,
        block(
          fill: rgb("#edeb69"),
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: rgb("#b2c016") + 6pt
          ),
          statement
        )
      ),
      [*Proof*],
      pad(top: 12pt, proof + qed),
    )
  )
}

#let coro(name, statement, proof) = {
  let header
  if (name.has("text")) {
    header = "Corollary:"
  } else {
    header = "Corollary"
  }
  block(
    fill: rgb("#dedbf8"),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb("#0f0cc0"),
    breakable: false,
    stack(
      [=== _ #header _ #name],
      pad(
        top: 12pt,
        bottom: 20pt,
        left: 12pt,
        block(
          fill: rgb("#bfb6df"),
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: rgb("#4922bf") + 6pt
          ),
          statement
        )
      ),
      [*Proof*],
      pad(top: 12pt, proof + qed),
    )
  )
}

#let prop(name, statement, proof, breakable: false) = {
  block(
    fill: rgb("#fbdfdb"),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb("#e03636"),
    breakable: breakable,
    stack(
      [=== _Proposition_ #name],
      pad(
        top: 12pt,
        bottom: 20pt,
        left: 12pt,
        block(
          fill: rgb("#e1a29f"),
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: rgb("#d45345") + 6pt
          ),
          statement
        )
      ),
      [*Proof*],
      pad(top: 12pt, proof + qed),
    )
  )
}

#let instr(instructions) = {
  block(
    fill: rgb("#cceeff"),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb(51, 173, 255),
    stack(
      [== Instructions],
      pad(
        top: 12pt,
        bottom: 10pt,
        left: 12pt,
        instructions
      )
    )
  )
}

#let prob(statement, solution, breakable: false) = {
  block(
    fill: rgb(250, 255, 250),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb(31, 199, 31),
    breakable: breakable,
    stack(
      [== Problem #problem_counter.step() #context { problem_counter.display() }],
      pad(
        top: 12pt,
        bottom: 20pt,
        left: 12pt,
        block(
          fill: rgb("#abc3b0"),
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: rgb("#739a7a") + 6pt
          ),
          statement
        )
      ),
      [*Solution*],
      pad(top: 12pt, solution)
    )
  )
}

#let example(statement, solution) = {
  block(
    fill: rgb(250, 255, 250),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb(31, 199, 31),
    breakable: false,
    stack(
      [=== Example #problem_counter.step() #context { problem_counter.display() }],
      pad(
        top: 12pt,
        bottom: 20pt,
        left: 12pt,
        block(
          fill: rgb("#abc3b0"),
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: rgb("#739a7a") + 6pt
          ),
          statement
        )
      ),
      [*Solution*],
      pad(top: 12pt, solution)
    )
  )
}

#let example_ns(example, breakable: false) = {
  block(
    fill: rgb(250, 255, 250),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb(31, 199, 31),
    breakable: breakable,
    stack(
      [=== Example #problem_counter.step() #context { problem_counter.display()} ],
      pad(
        top: 12pt,
        bottom: 2pt,
        example
      )
    )
  )
}

#let remark(title, example) = {
  block(
    fill: rgb("#eee3f4"),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb("#951fc7"),
    breakable: false,
    stack(
      [=== _Remark_ #title],
      pad(
        top: 12pt,
        bottom: 2pt,
        example
      )
    )
  )
}

#let excs(statement, solution, breakable: false) = {
  block(
    fill: rgb(255, 243, 225),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb(253, 158, 10),
    breakable: breakable,
    stack(
      [=== Exercise #exercise_counter.step() #context { exercise_counter.display() }],
      pad(
        top: 12pt,
        bottom: 20pt,
        left: 12pt,
        block(
          fill: rgb("#EED08A"),
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: rgb("#C37410") + 6pt
          ),
          statement
        )
      ),
      [*Solution*],
      pad(top: 12pt, solution)
    )
  )
}

#let named_excs(name, statement, solution, breakable: false) = {
  block(
    fill: rgb(255, 243, 225),
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: rgb(253, 158, 10),
    breakable: breakable,
    stack(
      [== #name],
      pad(
        top: 12pt,
        bottom: 20pt,
        left: 12pt,
        block(
          fill: rgb("#EED08A"),
          inset: 8pt,
          radius: 2pt,
          stroke: (
            left: rgb("#C37410") + 6pt
          ),
          statement
        )
      ),
      [*Solution*],
      pad(top: 12pt, solution)
    )
  )
}

#let notes(title, author, doc) = {
  set document(title: title, author: author)
  set enum(numbering: "i)")
  set heading(numbering: "1.")
  set page(
    paper:"us-letter",
    // https://stackoverflow.com/a/78318321
    header: context {
      let selector = selector(heading).before(here())
      let level = counter(selector)
      let headings = query(selector)

      if headings.len() == 0 {
        return
      }

      let headings_shown = (1, 2)
      let heading_max_level = calc.max(..headings_shown)

      let section = level.display((..nums) => nums
        .pos()
        .slice(0, calc.min(heading_max_level, nums.pos().len()))
        .map(str)
        .join("."))

      let heading_text = headings_shown.map((i) => {
        let headings_at_this_level = headings
          .filter(h => h.level == i)

        if headings_at_this_level.len() == 0 { return none }

        headings_at_this_level
          .last()
          .body
      })
      .filter(it => it != none)
      .join([ --- ])

      let level_one_headings = query(heading.where(level: 1))
      let on_same_page = level_one_headings.find(h => h.location().page() == here().page())

      let result
      if (on_same_page == none) {
        result = false
      } else {
        result = true
      }
      if (not heading_text.has("text")) and not result {
        align(right, [* #heading_text (#section)*])
      }
    },
    footer: context {
      let page_number = counter(page).at(here()).first()
      let total_pages = counter(page).final().last()
      align(center)[Page #page_number of #total_pages]
    },
    margin: 1.75cm
  )

  align(center, text(25pt)[
    *#title*
  ])
  align(center, text(15pt)[#author])

  set heading(numbering: "1.")
  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }
  show outline.entry.where(level: 3): it => {
    if (it.body.children.at(2).has("body")) {
      let form
      if (it.body.children.at(2).fields().body.has("children")) {
        form = it.body.children.at(2).fields().body.children.at(1).text
      } else {
        form = it.body.children.at(2).fields().at("body").text
      }

      if (form.starts-with("Def")) {
        set text(blue)
        it
      } else if (form.starts-with("Theo") or form.starts-with("Coro")) {
        set text(purple)
        it
      } else {
        it
      }
    } else {
      it
    }
  }
  outline(indent: 2em)

  show heading.where(level: 1): it => [
    #pagebreak(weak: true)
    #set text(25pt)
    #it
    #v(1.2em)
  ]

  problem_counter.update(0)
  exercise_counter.update(0)
  show link: l => underline(l) //  + $#emoji.chain$

  doc
}

#let study_sheet(doc) = {
  set document()
  set page(
    paper:"us-letter",
    margin: 1cm
  )
  doc
}

#let assignment(title, author, date, doc) = {
  set document(title: title, author: author)
  set enum(numbering: "a)")
  set page(
    paper:"us-letter",
    header: context {
      if counter(page).at(here()).first() != 1 {
        align(right, [*#title* | *#author*])
      }
    },
    footer: context {
      let page_number = counter(page).at(here()).first()
      let total_pages = counter(page).final().last()
      align(center)[Page #page_number of #total_pages]
    },
    margin: 1.75cm
  )
  align(center, text(25pt)[
    *#title*
  ])
  align(center, text(15pt)[#author])
  align(center, text(15pt)[#date.display("[month repr:long] [day], [year]")])

  doc
}

// based off of https://github.com/vitto4/ttuile
#let report(title, authors, date, doc) = {

}
