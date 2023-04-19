#let chapter_state = state("chapter", "")

#let clabel(name) = {
  [
    $$#label(name)
  ]
}

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
              @start[#short-name]
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

  set math.equation(numbering: (..nums) => "")

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
    #clabel("start")
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
        *#type (#name).*
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
#let propes = make_theorem("Свойства", color: oth_color)
#let notice = make_theorem("Замечание")
#let example = make_theorem("Пример")
#let examples = make_theorem("Примеры")
#let exercise = make_theorem("Упражнение")

#import "shortcuts.typ": *

