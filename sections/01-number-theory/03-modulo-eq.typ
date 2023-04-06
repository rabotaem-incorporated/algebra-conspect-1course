#import "../../utils/core.typ": *

== Сравнение по модулю

#def[
    Пусть $a, b, m in ZZ$. Говорят, что
    $
        a equiv(m) b & space.quad <==> \
        a ident_m b & space.quad <==> \
        a ident b space.third (mod m) & space.quad <==> space.quad m divides (a - b)
    $
]

#prop[
    + $equiv(m)$ --- рефлексивно

    + $equiv(m)$ --- симметрично

    + $equiv(m)$ --- транзитивно

    + $a equiv(m) b$, $d divides m ==> a equiv(d) b$

    + $a equiv(m) b$, $ k in ZZ ==> k a equiv(k m) k b$

    + $a equiv(m) b$, $k in ZZ ==> k a equiv(m) k b$ (ослабленная версия предыдущего свойства)

    + $a_1 equiv(m) b_1$, $a_2 equiv(m) b_2 ==> a_1 plus.minus a_2 equiv(m) b_1 plus.minus b_2$

    + $a_1 equiv(m) b_1$, $a_2 equiv(m) b_2 ==> a_1 a_2 equiv(m) b_1 b_2$
]

#notice[
    Сравнение по модулю --- отношение эквивалентности.    
]
