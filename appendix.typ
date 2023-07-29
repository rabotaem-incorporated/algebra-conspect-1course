#import "config.typ"
#import "utils/core.typ": *

#set heading(numbering: (..numbers) => {
    let numbers = numbers.pos()
    if numbers.len() < 2 {
        none
    } else if numbers.len() == 2 {
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

    Обращаю внимание, что границы билетов расставлены субъективным образом. Если хотите исправить, просто сделайте PR.

    #if config.enable-chapters-from-sem1 [
        === Первого семестра

        #locate(loc => enum(
            numbering: "1.",
            ..query(selector(<ticket>).before(<tickets-div>), loc)
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
    #if config.enable-chapters-from-sem2 [
        === Второго семестра

        #locate(loc => enum(
            numbering: "1.",
            ..query(selector(<ticket>).after(<tickets-div>), loc)
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
]
