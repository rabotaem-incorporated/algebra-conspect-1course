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

#let last_theorem = state("last_theorem", none)

#let make_theorem(th_type, color: white, highlight_color: none, glues_to: ()) = {
  
  if highlight_color == none {
    highlight_color = color.lighten(25%)
  }

  (name: none, content, glue: false) => [
    #locate(loc => {
      let lt = last_theorem.at(loc)
      // [Value: #lt]
      let th_label = query(selector(<end-of-last-th>).before(loc), loc)
      let last_th_page = if th_label.len() > 0 { 
        th_label.last().location().position().page
      } else { 
        -1
      }

      if (glue or lt in glues_to) and last_th_page == loc.position().page { 
        v(-0.4em)
      }
    })

    #last_theorem.update(th_type)

    #let th_content = [
      #if name != none [
        #let name_string = if type(name) == "string" { 
          name 
        } else { 
          name.text
        }

        #if name_string.starts-with(regex("(об |о |О |об)")) [
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
      fill: color.lighten(90%), 
      stroke: (left: highlight_color, ),
    )

    #th_block(th_content)
  ]
}

#let th_color = red
#let oth_color = blue
#let def_color = orange

#let th = make_theorem("Теорема", color: th_color)
#let lemma = make_theorem("Лемма", color: th_color)
#let props = make_theorem("Предложение", color: oth_color)
#let follow = make_theorem(
  "Следствие", color: oth_color,
  glues_to: ("Теорема", "Лемма", "Доказательство")
)
#let def = make_theorem("Определение", color: def_color)
#let prop = make_theorem("Свойство", color: oth_color)
#let propes = make_theorem("Свойства", color: oth_color)
#let notice = make_theorem("Замечание", highlight_color: gray)
#let example = make_theorem("Пример", highlight_color: gray)
#let examples = make_theorem("Примеры", highlight_color: gray)
#let exercise = make_theorem("Упражнение", highlight_color: gray)
#let denote = make_theorem("Обозначение", color: def_color)

#let proof = make_theorem("Доказательство", highlight_color: gray, 
  glues_to: (
    "Теорема", "Лемма", "Предложение", "Следствие", 
    "Свойство", "Свойства", "Замечание"
  )
)


#import "shortcuts.typ": *
