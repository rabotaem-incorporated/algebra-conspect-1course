#import "../../utils/core.typ": * 

== Делимость

#def[
    $a, b in ZZ, a | b <==> exists c in ZZ: b = a c$
]

#prop[
    + $a divides a$ --- рефлексивность
    
    + $a divides b, b divides c ==> exists c in ZZ: b = a c$ --- транзитивность
    
    + $a divides b, k in ZZ ==> k a divides k b$ 
    
    + $a divides b_1, a divides b_2 ==> a divides (b_1 plus.minus b_2)$
    
    + $plus.minus 1 divides a$
    
    + $cases(
        k a space.hair divides space.hair k b,
        k eq.not 0
    ) ==> a divides b$
]

#def[
    $a, b$ называются _ассоциированными_, если $a divides b$ и $b divides a$.
    Иногда такое отношение обозначают $a sim b$:
    $ a sim b <==> a divides b and b divides a $
]

#prop[
    + Пусть $a sim a'$, $ b sim b'$. Тогда $a divides b <==> a' divides b'$.
]