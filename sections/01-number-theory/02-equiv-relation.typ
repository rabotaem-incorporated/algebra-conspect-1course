#import "../../utils/core.typ": *

== Отношение эквивалентности и разбиение на классы

#def[
    Отношение эквивалентности --- бинарное отношение, 
    удовлетворяющее следующим свойствам: рефлексивность, симметричность, транзитивность.
]

#def[
    Разбиение на классы множества $M$ --- это представление $M$ в виде 
    $M = limits(union.big)_(i in I) M_i$, 
    где $M_i$ --- классы, $I$ --- индексное множество, 
    $M_i sect M_j = nothing$ при $i eq.not j$.
]

#th[
    Пусть $M = limits(union.big)_(i in I) M_i$ --- разбиение на классы.
    Введем отношение $sim$ над $M$ так, что $a sim b <==> exists i in I : a, b in M_i$.
    Тогда $sim$ --- отношение эквивалентности.
]

#proof[
    Рефлексивность и симметричность очевидны. Докажем транзитивность.
    
    $ 
        a sim b, b sim c ==> 
        exists i, j : cases(a\, b in M_i, b\, c in M_j)
    $
    
    Тогда $b in M_i sect M_j$, но так как $M_i sect M_j eq.not nothing$ при неравных $i$ и $j$,
    $i = j$. Значит $a, b, c in M_i$.
]

#th[
    Пусть $sim$ --- отношение эквивалентности на $M$. 
    Значит существует разбиение на классы $M = limits(union.big)_(i in I) M_i$ такое, 
    что $forall a, b in M: a sim b <==> exists i : a, b in M_i$.
]

#proof[
    Рассмотрим $a in M$. Назовем классом элемента $a$ множество 
    $ [a] = {b in M divides a sim b}. $
    Докажем, что для любых элементов $a$ и $b$, либо $[a] = [b]$, либо $[a] sect [b] = nothing$.

    Пусть $[a] sect [b] eq.not nothing$. Тогда 
    $
        exists x in [a] sect [b] 
        ==> cases(
            x in [a],
            x in [b]
        )
        limits(==>)^("опр. класса") cases(
            x sim a,
            x sim b
        ) 
        limits(==>)^("транзитивность" sim) a sim b. 
    $

    $
        (forall c in [a] space c sim a limits(==>)^(a sim b) c sim b) & ==> c in [b]\
        (forall c in [b] space c sim b limits(==>)^(a sim b) c sim a) & ==> c in [a]
    $

    Из $(1)$ и $(2)$ получаем $[a] = [b]$.

    Тогда искомое разбиение можно построить как
    $
        X = {[a] divides a in M}.
    $
    Действительно $forall a in M$, так как $a in [a]$, то $M = limits(union.big)_(alpha in I) M_i$,
    а так как различные классы не пересекаются (доказано выше) $forall a, b$ $[a] eq.not [b]$.
]

#def[
    Построенное множество $X$ называют _фактор-множеством_ множества $M$ 
    по отношению эквивалентности $sim$, обозначение: $factor(M, sim)$.
]

#example[
    $factor(ZZ, sim) = {[z] divides z in ZZ } = {[0], [1], [2], ...}$
]