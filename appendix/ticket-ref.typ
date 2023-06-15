#import "../utils/core.typ"

== Ссылки на билеты <ticket-reference>

#locate(loc => enum(
    numbering: "1.",
    ..query(selector(<ticket>), loc)
        .map(ticket-name-label => {
            let ticket-location = ticket-name-label.location()

            enum.item(
                counter("ticket").at(ticket-location).first(),
                link(ticket-location)[
                    #ticket-name-label.body.children.join()
                    #box(width: 1fr, repeat[.])
                    #ticket-location.page()
                ]
            )
        })
))

TODO: this
