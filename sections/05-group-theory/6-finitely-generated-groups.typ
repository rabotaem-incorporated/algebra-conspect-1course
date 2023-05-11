#import "../../utils/core.typ": *

== Конечно порожденные абелевы группы

#pr[
    Пусть $(a, b) = 1, space a, b in NN$. Тогда
    $
        ZZ fg a b ZZ iso (ZZ fg a ZZ) times (ZZ fg b ZZ)
    $
]

#proof[
    $([1]_a, [1]_b) = g, space ord(g) = a b ==> abs(gen(g)) = a b  ==> gen(g) = (ZZ fg a ZZ) times (ZZ fg b ZZ)$
]

#th[
    Пусть $G$ --- конечная абелева группа. Тогда
    $
        G iso product_(i = 1)^m(ZZ fg p_i^(l_i) ZZ), #[где $p_i$ --- простое; $l_i in N$]
    $
    Такое разложение единственно с точностью до порядка множителей.

    Иногда эту теорему переформулируют: требуют, чтобы порядок каждого множителя делил порядок следующего. Тогда разложение единственно.
]

#proof[Без доказательства]

#denote[
    $C_m <==> (ZZ fg m ZZ)$ --- циклическая группа. Иногда также обозначается $ZZ_m$, но возникает коллизия с обозначениями $p$-адических чисел.
]

#follow[
    Пусть $K$ --- поле, $G < K^*$, $abs(G) < oo$. Тогда $G$ циклическая.
]

#proof[
    Знаем, что 
    $
        G iso product_(i = 1)^m (C_(p_i^(l_i)))
    $
    Докажем, что все $p_i$ различны. Предположим противное. Не умаляя общности, можем считать $p_1 = p_2 = p$.

    $ 
        {g in G bar p g = e} supset {(overline(p^(l_1-1) a), overline(p^(l_2-1) b), 0, ..., 0) bar 0 <= a <= p-1, 0 <= b <= p - 1} \
        ==> abs({g in G bar p g = 0})_(>= p^2) = {x in G bar x^p = 1} subset {x in K bar f(x) = 0}, f = x^p - 1
    $
]

#th[
    Пусть $G$ --- конечно порожденная абелева группа. Тогда
    $
        G iso ZZ^r times  H, #[где $H$ --- конечная. При этом $r$ --- инвариант $G$],
        H iso G_"tors" = {g in G bar space ord g < oo}
    $ // O.o
    (Следовательно $G iso product_(i = 1)^r ZZ times product_(i = 1)^m C_(p_i^m_i) $)
]
