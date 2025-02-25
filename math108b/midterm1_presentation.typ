#import "@preview/slydst:0.1.3": *
#import "@local/superTemplate:0.2.0": *
#import math_mod:*
#import pstat_mod:*

#show: slides.with(
  title: "Proof of Gram–Schmidt procedure",
  authors: "Jonas Chen",
  subtitle: "math108b midterm 1 reflection",
  date: none,
  layout: "large",
  ratio: 4/3,
  title-color: none,
)

#env_headers.update("classic")
#env_colors.update("classic")

#show raw: set block(fill: silver.lighten(65%), width: 100%, inset: 1em)

// == Outline

// #outline()

// == Content

// - *Level-one headings* corresponds to new sections.
// - *Level-two headings* corresponds to new slides.
// - Blank space can be filled with *vertical spaces* like `#v(1fr)`.

// ```typst
// == Outline

// #outline()

== Statement

#thm([],[],[])

== Proof


sdfsdfsf

// #figure(image("figure.png", width: 60%), caption: "Caption")

// #v(1fr)

// #lorem(20)
// ```

// ...and longer slides are automatically numbered.

// === Subsubtitles

// Note that level-three headings do not break pages.

// = Components

// == Definitions, theorems and others

// #definition(title: "An interesting definition")[
//   #lorem(10)
// ]

// #theorem(title: "An interesting theorem", fill-header: orange.lighten(65%), radius: 0.2em)[
//   Let $p(x, y)$ a probability distribution, we have,
//   $
//     p(x, y) &= p(x) p(y | x).
//   $
// ]

// #lemma(title: "An interesting lemma")[
//   #lorem(20)
// ]

// #corollary(title: "An interesting corollary")[
//   #lorem(30)
// ]

// = Summary

// == Summary

// - Slydst provides simple static slides.
// - Slides are named according to the headings.
// - Some more components are available.