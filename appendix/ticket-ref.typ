#import "../utils/core.typ": *

== Ссылки на билеты <ticket-reference>

Обращаю внимание, что границы билетов расставлены субъективным образом, и используется предворительная (!) версия списка билетов. Если хотите исправить, просто сделайте PR. #text(weight: "bold")[Точные границы того, что входит в билет, а что нет, нужно узнать на консультациях.]

#locate(loc => enum(
    numbering: "1.",
    ..query(selector(<ticket>), loc)
        .sorted(key: ticket-name-label => {
            counter("ticket").at(ticket-name-label.location()).first()
        }).map(ticket-name-label => {
            let ticket-location = ticket-name-label.location()

            enum.item(
                counter("ticket").at(ticket-location).first(),
                link(ticket-location)[
                    #ticket-name-label.body
                    #box(width: 1fr, repeat[.])
                    #ticket-location.page()
                ]
            )
        })
))

#TODO[this]
