#import "../../utils/core.typ": *

== Элементы теории групп

#def[
    $G$ и бинарная операция $*$ на $G$:
    + $*$ ассоциативна
    + $exists e in G space forall g in G: e * g = g * e = g$
    + $forall g in G space exists k in G: g * h = h * g = e$ (обозначается $h = g^(-1)$)

    Если $*$ коммутативна, то $G$ --- _абелева_
]

#example[
    - Аддитивные группы колец $ZZ, RR, CC, K[X], M_n(R), ...$ --- абелевы по определению
    - $R$ --- ассоциативное кольцо с 1, $R^*$ --- группа обратимых элементов, $ZZ^* = {plus.minus 1}, space RR^* = RR \\ {0}$
    - $S_n$ --- симметрические группы, перестановки $n$ элементов.
    - $D(Gamma)$ --- группа симметрий, где $Gamma$ --- геометрические фигуры.
]

#lemma[
    $a, b in G$. Тогда $ exists! g in G: a mul g = b $ $ exists!h in G: h mul a = b $
]

#proof[
    $g = a^(-1)b$ --- такой элемент найдется. Проверим, что он единственный:

    $ cases(a g = b, a g' = b) ==> a g = a g' ==> a^(-1) a g = a^(-1) a g' ==> g = g'. $
]

#def[
    Пусть $G$ --- группа. Подмножество $H subset G$ называется _подгруппой_, если 
    + $e in H$
    + $forall h_1, h_2 in H space h_1 mul h_2 in H$
    + $forall h in H: h^(-1) in H$
]

#notice[
    Если $H$ --- подгруппа $G$, то на $H$ есть структура группы, то есть операция
    $
        H times H &--> H, \
        (h_1, h_2) &maps h_1 h_2.
    $
    Если задать на $H$ такую бинарную операцию, $H$ превратится в группу.
]

#def[
    Обозначают подгруппу $H$ группы $G$ как $H < G$.
]

#example[
    + ${e} < G$
    + $G < G$
    + $2ZZ < ZZ$, $NN$ --- не является подгруппой $ZZ$.
    + $ZZ < RR < CC$
    + $A_n < S_n$ --- четные перестановки
]

#def[
    Пусть $g in G, space n in ZZ$. Тогда _степенью_ $g$ является:
    $
        g^n = cases(
            underbrace(g mul ... mul g, n)\, & n in NN,
            e\, & n = 0,
            underbrace(g^(-1) mul ... mul g^(-1), abs(n))\, & n < 0
        )
    $
]

#prop[
    - $g^k mul g^l = g^(k + l)$
    
    - $(g^k)^l = g^(k l)$
]

#def[
    _Циклическая подгруппа порожденная элементом_ $g$ --- $gen(g) = {g^n bar n in NN}$.
]

#def[
    Группа называется _циклической_, если она является циклической подгруппой себя, порожденной каким-то своим элементом.
]

#def[
    _Порядком элемента_ называется наименьшее такое число $n in NN$, что $g^n = e$. Обозначается $ord g$. Если для любого $n$, $g^n != e$, говорят, что $ord g = infinity$.
]

#lemma[
    Пусть $ord(g) = d in NN$. Тогда $abs(gen(g)) = d$ и $gen(g) limits(=)^((*)) {e, g, g^2, ..., g^(d-1)}$
]

#proof[
    Пусть $h in gen(g) ==> h = g^m, space m in ZZ$
    $ m = d q + r, 0 <= r <= d-1 ==> h = g^(d q + r) = (g^d)^q mul g^r = g^r #[доказали $(*)$] $
    Предположим, $g^k = g^l, space 0<= k <= l <= d-1 ==> g^(l-k) = e$. $space 1 <= l - k <= d-1$, противоречие с $ord(g) = d$.
]

#notice[
    Если $ord g = infinity$, то все $g^k$ различны между собой.
]

#denote[
    Пусть $G$ --- группа, $A, B subset G$.
    Тогда 
    $
        A B = { a b bar a in A, b in B } \
        A^(-1) = { a^-1 bar a in A }
    $
]

#def[
    Пусть $M subset G$. _Подгруппой, порожденной $M$_ называется 
    $
        gen(M) = {g_1 ... g_n bar n >= 0; space g_i in M union M^(-1), i = 1, ..., n} 
    $
    Если в произведении $0$ множителей, оно считается равным $e$.
]

#notice[
    Подгруппа, порожденная $M$ --- действительно подргуппа.
]

#props[
    Пусть $M subset G$. Тогда 
    $
        gen(M) = limits(sect.big)_(H < G \ H > M) H
    $
]

#proof[
    + "$subset$": Пусть $H < G$, $H supset M$. Тогда $M^(-1) subset H$, значит $M union M^(-1) subset H ==> gen(M) subset H$.
    + "$supset$": $gen(M) < G, space gen(M) supset M ==>  limits(sect.big)_(H < G \ H > M) subset gen(M)$
]
