#import "../../utils/core.typ": *

== Сравнение по модулю

#def[
    Пусть $a, b, m in ZZ$. Говорят, что
    $
        a equiv_(m) b & space.quad <==> \
        a scripts(equiv)_m b & space.quad <==> \
        a equiv b space.third (mod m) & space.quad <==> space.quad m divides (a - b)
    $
]

#prop[
    + $equiv_(m)$ --- рефлексивно

    + $equiv_(m)$ --- симметрично

    + $equiv_(m)$ --- транзитивно

    + $a equiv_(m) b$, $d divides m ==> a equiv_(d) b$

    + $a equiv_(m) b$, $ k in ZZ ==> k a equiv_(k m) k b$

    + $a equiv_(m) b$, $k in ZZ ==> k a equiv_(m) k b$ (ослабленная версия предыдущего свойства)

    + $a_1 equiv_(m) b_1$, $a_2 equiv_(m) b_2 ==> a_1 plus.minus a_2 equiv_(m) b_1 plus.minus b_2$

    + $a_1 equiv_(m) b_1$, $a_2 equiv_(m) b_2 ==> a_1 a_2 equiv_(m) b_1 b_2$
]

#notice[
    Сравнение по модулю --- отношение эквивалентности.    
]
