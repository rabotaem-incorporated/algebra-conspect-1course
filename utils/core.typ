#let chapter_state = state("chapter", "")

#let notes(
  name: none,
  short-name: none,
  lector: none,
  document_body,
) = {
  set page(
    paper: "a4",
    margin: 6%,
    numbering: "1",
    number-align: right + top,
    header: [
      #chapter_state.display(it => {
        if it != "" {
          stack(
            spacing: .5em,
            [
              #it
            ],
            line(length: 100%),
          )
        }
      })
    ],
    header-ascent: 2em,
    footer: [
      #counter(page).display(it => {
        if it != 1 {
          stack(
            spacing: .5em,
            line(length: 100%),
            [
              #short-name
              #h(1fr)
              #it   
            ]
          )
        }
      })
    ]
  )
  
  set text(
    lang: "ru",
    region: "ru",
    size: 12pt,
  )

  set heading(
    numbering: "1.1.1.",
  )
  
  set enum(
    numbering: "1.a)",
  )

  show heading.where(level: 1): it => {
    chapter_state.update(it.body.text)
    [
      #pagebreak(weak: true) 
      #it
    ]
  }

  show heading.where(level: 2): it => {
    [
      #it
      #v(1em)
    ]
  }
   
  [
    #align(center + horizon)[
      #text(
         size: 30pt
      )[
        *#name*
      ]
      #if lector != none {
        v(
          5%,
          weak: true,
        )
        text(
          size: 20pt,
        )[
          Лектор: #lector
        ]
      }
    ]

    //#set par(justify: true)
    #outline(indent: true)
    #document_body
  ]
}

#let make_theorem(type, color: white) = {
  (name: none, content) => [
    #block(
      outset: .4em,
      inset: .4em,
      width: 100%,
      fill: color.lighten(90%), 
      stroke: (
        left: 2pt + color.lighten(25%),
      )
    )[  
      #if name != none [
        *#type: #name.*
      ] else [
        *#type.*
      ]
      #sym.space.hair #content
    ]
  ]
}

#let th_color = red
#let oth_color = blue
#let def_color = orange

#let th = make_theorem("Теорема", color: th_color)
#let lemma = make_theorem("Лемма", color: oth_color)
#let props = make_theorem("Предложение", color: oth_color)
#let follow = make_theorem("Следствие", color: oth_color)
#let proof = make_theorem("Доказательство")
#let def = make_theorem("Определение", color: def_color)
#let prop = make_theorem("Свойство", color: oth_color)
#let notice = make_theorem("Замечание")
#let example = make_theorem("Пример")
#let examples = make_theorem("Примеры")
#let exercise = make_theorem("Упражнение")

#let iff = math.limits(sym.arrow.l.r.double.long)
#let imply = math.limits(sym.arrow.r.double.long)
#let since = math.limits(sym.arrow.l.double.long)

#let sgn = math.op("sgn")
#let mul = math.dot.op
#let det(..a) = {set math.mat(delim: "|"); math.mat(..a)}
#let empty = sym.nothing.rev
#let Lin = math.op("Lin")
#let Dim = math.op("dim")
#let id = math.op("id")
#let GL = math.op("GL")
#let quad = sym.space.quad
#let sq(char, ..args) = {
    if args.pos().len() == 0 { 
        $char_1, ..., char_n$
    } else if args.pos().len() == 1 {
        $char_1, ..., char_#{args.pos().at(0)}$
    }
}
#let rk = math.op("rk")
#let hat(x) = math.accent(x, "^")
#let Hom = math.op("Hom")
#let Ker = math.op("Ker")
#let Im = math.op("Im")
#let Id = math.op("Id")
#let Aa = math.cal($A$)
#let End = math.op("End")
#let maps = sym.arrow.long.bar

#import "shortcuts.typ": *

