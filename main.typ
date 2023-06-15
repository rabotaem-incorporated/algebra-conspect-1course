#import "utils/core.typ": notes
#import "config.typ"

#show: notes.with(
  name: "Конспект лекций по алгебре за второй семестр",
  short-name: "Алгебра",
  lector: "Игорь Борисович Жуков",
)

#if config.enable-chapters-from-sem1 {
  include "sections/01-number-theory/!sec.typ"
  if config.enable-unfinished-chapters {
    include "sections/02-complex-numbers/!sec.typ"
    include "sections/03-polynomials/!sec.typ"
  }
}

#include "sections/04-linear-algebra/!sec.typ"
#include "sections/05-group-theory/!sec.typ"
#include "sections/06-field-theory/!sec.typ"

#include "appendix/index.typ"
