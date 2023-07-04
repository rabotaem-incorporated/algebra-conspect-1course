#import "../../config.typ"

= Линейная алгебра

#if config.enable-chapters-from-sem1 [
    #include "01-matrices.typ"
    #include "02-elementary-things.typ"
]

<tickets-div>
#counter("ticket").update(0)

#if config.enable-chapters-from-sem2 [
    #include "03-permutations-cont.typ"
    #include "04-determinants.typ"
    #include "05-determinants-more-props.typ"
    #include "06-linear-spaces.typ"
    #include "07-linear-subspaces.typ"
    #include "08-linear-dep-and-indep.typ"
    #include "09-basis.typ"
    #include "10-coords.typ"
    #include "11-rank.typ"
    #include "12-direct-sum.typ"
    #include "13-linear-mappings.typ"
    #include "14-linear-mapping-matrix.typ"
    #include "15-linear-operators.typ"
    #include "16-eigen-values-vectors.typ"
]