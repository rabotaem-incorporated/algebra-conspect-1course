#import "../config.typ"

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
  info: none,
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

  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }
  
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

  show "≥": "⩾"
  show "≤": "⩽"
   
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
    #align(center + bottom)[
      #text(
        size: 20pt,
        weight: "semibold",
      )[
        #info
      ]
    ]

    //#set par(justify: true)
    #outline(indent: true)
    #document_body
  ]
}

#let last_theorem = state("last_theorem", none)

#let make_theorem(th_type, th_type_plural: none, color: white, highlight_color: none, glues_to: ()) = {
  if highlight_color == none {
    highlight_color = color.lighten(25%)
  }

  (name: none, plural: false, content, glue: false) => par[
    #locate(loc => {
      let lt = last_theorem.at(loc)
      // [Value: #lt]
      let th_label = query(selector(<end-of-last-th>).before(loc), loc)
      let last_th_page = if th_label.len() > 0 { 
        th_label.last().location().page()
      } else { 
        -1
      }

      if (glue or lt in glues_to) and last_th_page == loc.page() { 
        if not config.monochrome {
          v(-0.4em)
        } else {
          v(-0.4em + 1pt)
        }
      }
    })

    #last_theorem.update(th_type)

    #let th_type = th_type
    #if plural and th_type_plural != none {
      th_type = th_type_plural
    }

    #let th_content = [
      #if name != none [
        #let name_string = if type(name) == "string" { 
          name 
        } else { 
          name.text
        }

        #if name_string.starts-with(regex("(об |о |О |Об )")) [
          #let name_string = name_string.replace("О ", "о ").replace("Об ", "об ")
          *#th_type #name_string.*  
        ] else [
          *#th_type (#name).* 
        ]
      ] else [
        *#th_type.*
      ]
      #sym.space.hair #content
      #box()<end-of-last-th>
    ]

    #let th_block = block.with(
      outset: .4em,
      inset: .4em,
      width: 100%,
      fill: if not config.monochrome { color.lighten(90%) } else { none }, 
      stroke: if not config.monochrome {
        (left: highlight_color, )
      } else {
        (
          left: highlight_color + 2pt,
          right: highlight_color + 1pt,
          top: highlight_color + 1pt,
          bottom: highlight_color + 1pt,
        )
      },
    )

    #th_block(th_content)
  ]
}

#let TODO(content) = rect(
  stroke: red + 2pt,
  fill: red.lighten(90%),
  width: 100%, inset: 0.2cm,
)[
  #text(weight: "extrabold")[TODO: ]
  #sym.space.hair 
  #if content != [] { content } else [ Дописать ]<todo-like>
]

#let th_color = if not config.monochrome { red } else { luma(20%) }
#let oth_color = if not config.monochrome { blue } else { luma(30%) }
#let def_color = if not config.monochrome { orange } else { luma(40%) }
#let proof_color = if not config.monochrome { gray } else { luma(80%) }

#let th = make_theorem("Теорема", color: th_color)
#let lemma = make_theorem("Лемма", color: th_color)
#let pr = make_theorem("Предложение", color: oth_color)
#let follow = make_theorem(
  "Следствие", color: oth_color,
  th_type_plural: "Следствия",
  glues_to: ("Теорема", "Лемма", "Доказательство")
)
#let def = make_theorem("Определение", color: def_color)
#let prop = make_theorem("Свойство", th_type_plural: "Свойства", color: oth_color)
#let props = prop.with(plural: true)
#let notice = make_theorem("Замечание", highlight_color: proof_color)
#let example = make_theorem("Пример", th_type_plural: "Примеры", 
    highlight_color: def_color.lighten(25%), glues_to: (
    "Теорема", "Лемма", "Предложение", "Следствие", 
    "Свойство", "Свойства", "Замечание", "Определение",
    "Доказательство", "Обозначение",
))
#let examples = example.with(plural: true)
#let exercise = make_theorem("Упражнение", highlight_color: proof_color)
#let denote = make_theorem("Обозначение", color: def_color)

#let proof = make_theorem("Доказательство", highlight_color: proof_color, 
  glues_to: (
    "Теорема", "Лемма", "Предложение", "Следствие", 
    "Свойство", "Свойства", "Замечание"
  )
)

#let proof-left-to-the-reader = proof.with[Доказательство остается читателю в качестве упражнения. <todo-like> ]

#import "shortcuts.typ": *

#let ticket(name, step-fn: none, post-step-fn: none) = if config.enable-ticket-references {
  let ticket-counter = counter("ticket")

  let width = 0.7cm
  let offset = 0.5cm
  let color = if not config.monochrome { blue.lighten(60%) } else { gray }

  if step-fn != none {
    ticket-counter.update(step-fn)
  } else {
    ticket-counter.step()
  }
  
  block(above: 0.2cm, below: 0.2cm, 
    rect(stroke: none, width: 100%, par[
      #align(end, text(size: 0.75em, fill: color.darken(30%))[
        Билет #ticket-counter.display();.
        #name.
      ])

      #v(-0.7em)

      #line(length: 100% + width + offset, stroke: (
        paint: color,
        dash: "dashed"
      ))
      
      #place(dy: -1cm)[#hide(name)<ticket>]

      #link(<ticket-reference>, place(
        dx: offset,
        end,
      )[
        #place(polygon(
          fill: color.lighten(70%),
          stroke: color + 1pt,
          (0pt, 0pt),
          (0pt, width),
          (width * 0.5, width * 1.5),
          (width, width),
          (width, 0pt),
        ))

        #place(dy: width * 0.15, block.with(width: width)(
          align(text(fill: color.darken(30%), weight: "bold")[
            #text(size: 1.5em, ticket-counter.display())
            #move(dy: -1.6em, text(size: 0.5em)[билет])
          ], center)
        ))
      ])
    ]
  ))

  if post-step-fn != none {
    ticket-counter.update(post-step-fn)
  }
}
