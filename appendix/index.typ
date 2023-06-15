#import "../config.typ"

#set heading(numbering: (..numbers) => {
    let numbers = numbers.pos()
    if numbers.len() < 2 {
        none
    } else {
        numbering("A.", numbers.at(1))
    }
})

#let includes-at-least-something = config.enable-ticket-references

#if includes-at-least-something {
    [= Приложение]

    if config.enable-ticket-references {
        include "ticket-ref.typ"
    }
}
