#import "config.typ"
#import "utils/core.typ": *

#set heading(numbering: (..numbers) => {
    let numbers = numbers.pos()
    if numbers.len() < 2 {
        none
    } else {
        numbering("A.", numbers.at(1))
    }
})

= Приложение

== TODO-шки и упражнения

Все это, по хорошему, надо дописать/доделать/улучшить.

#locate(loc => {
    let todos = query(selector(<todo-like>), loc)

    list(..todos.map(el => {
        link(el.location(), el)
        box(width: 1fr, repeat[.])
        link(el.location())[#el.location().page()]
    }))
})

#if config.enable-ticket-references [
    == Ссылки на билеты <ticket-reference>

    Обращаю внимание, что границы билетов расставлены субъективным образом. Если хотите исправить, просто сделайте PR. #text(weight: "bold")[Точные границы того, что входит в билет, а что нет, нужно узнать на консультации.] А, она уже была. Ну, удачи!

    #locate(loc => enum(
        numbering: "1.",
        ..query(selector(<ticket>), loc)
            .sorted(key: ticket-name-label => {
                counter("ticket").at(ticket-name-label.location()).first()
            }).map(ticket-name-label => {
                let ticket-location = ticket-name-label.location()

                enum.item(
                    counter("ticket").at(ticket-location).first(),
                    [
                        #link(ticket-location, ticket-name-label.body)
                        #box(width: 1fr, repeat[.])
                        #link(ticket-location)[#ticket-location.page()]
                    ]
                )
            })
    ))
]
