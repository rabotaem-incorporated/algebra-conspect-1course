#import "../../utils/core.typ": *

== Функция Эйлера

#props[
    Пусть $m in NN, space  a in ZZ$, тогда $[a]_m in (factor(ZZ, m ZZ))^* <==> a bot m$
]

#proof[
    
    $[a]_m in (factor(ZZ, m ZZ))^* <==> exists [b]_m: space [a]_m dot.c [b]_m = [1]_m <==>$
    
    $exists b in ZZ: space a b equiv(m) 1 <==>$
    
    $exists b, c in ZZ: space a b = 1 + m c <==>$
    
    $exists b, c in ZZ: space a b - m c = 1 <==> gcd(a, m) = 1 <==> a bot m$
]

#follow[
    $factor(ZZ, m ZZ)$ --- поле $<==> m$ --- простое число.
]

#proof[

    $m = 1: space (factor(ZZ, 1 ZZ)) = {overline(0)}$
    
    $m$ --- простое: $space.quad gcd(a, m) = 1, space.quad forall a in {1, 2, ..., m-1} ==>$
    
    $(factor(ZZ, m ZZ))^* = {overline(1), overline(2), ..., overline(m-1)}$
    
    $m$ --- составное: $space.quad m = a b, space 2 <= a < m$
    
    $gcd(a, m) eq.not 1 ==> overline(a) in.not (factor(ZZ, m ZZ))^*$
]

#def[
    $\F_(n)$ --- поле из $n$ элементов. Называется _конечным полем_ или _полем Галуа_.
]

#props[    
    $\F_(n)$ --- поле из $n$ элементов $<==> n = p^r, space  p in PP, space  r in ZZ_(+)$.

    $p$ --- характеристика $\F_(n)$.
]

#proof[
    Без доказательства.
]

#def[    
    Пусть $m in NN: space phi(n) = |(factor(ZZ, m ZZ))^*|$

    Функция $phi times NN -> NN$ --- _функция Эйлера_.
]

#props[    
    Пусть $p in PP, space r in NN$.

    Тогда $phi(p^r) = p^r - p^(r-1)$.
]

#proof[
    $phi(p^r) = |{a divides 0 <= a < p^r, space (a, p^r) = 1}| = $

    $p^r -  |{a divides 0 <= a < p^r, space (a, p) eq.not 1}| = $
    
    $p^r - |{a divides 0 <= a < p^r, space p divides a}| = p^r - p^(r-1)$
]

#props[ 
    Мультипликативность функции Эйлера. 
    
    Пусть $m, n in NN, space  m bot n$.

    Тогда $phi(m n) = phi(m) dot.c phi(n)$.
]

#proof[
    Построим отображение $lambda: (factor(ZZ, m n ZZ))^* -> (factor(ZZ, m ZZ))^* times (factor(ZZ, n ZZ))^*$:
    
    $[a]_(m n) = A in (factor(ZZ, m n ZZ))^* |-> ([a]_m, [a]_n)$
    
    $[a]_(m n) in (factor(ZZ, m n ZZ))^* ==> a bot m n  ==> 
    cases(
        a bot m,
        a bot n
    ) ==>
    cases(
        [a]_m in (factor(ZZ, m ZZ))^*,
        [a]_n in (factor(ZZ, n ZZ))^*
    )$

    Проверка корректности:

    $[a]_(m n) = [a']_(m n) ==> a equiv(m n) a' ==>
    cases(
        a equiv(m) a',
        a equiv(n) a'
    ) ==>
    cases(
        [a]_m = [a']_m,
        [a]_n = [a']_n
    ) ==> 
    ([a]_m, [a]_n) = ([a']_m, [a']_n)$

    Проверим что $lambda$ --- биекция:

    Инъективность:

    $lambda([a]_(m n)) = lambda([b]_(m n)) ==>
    cases(
        [a]_m = [b]_m,
        [a]_n = [b]_n
    )
    limits(==>)^(m bot n) a equiv(m n) b ==> [a]_(m n) = [b]_(m n)$

    Сюръективность:

    Рассмотрим $([b]_m, [c]_n) in (factor(ZZ, m ZZ))^* times (factor(ZZ, n ZZ))^*$.

    $m bot n limits(==>)^("КТО") exists a:
    cases(
        a equiv(m) b,
        a equiv(n) c
    )$

    $cases(
        b bot m ==> a bot m,
        c bot n ==> a bot n
    ) ==> a bot m n ==> [a]_(m n) in (factor(ZZ, m n ZZ))^*$

    $lambda([a]_(m n)) = ([a]_m, [a]_n) = ([b]_m, [c]_n) ==> lambda$ --- биекция.

    $lambda$ --- биекция $==> |(factor(ZZ, m n ZZ))^*| = |(factor(ZZ, m ZZ))^* times (factor(ZZ, n ZZ))^*| ==> phi(m n) = phi(m) dot.c phi(n)$
]

#follow[    
    Пусть $m_1, ..., m_k$ --- попарно взаимно простые числа.

    Тогда $phi(limits(product)_(i=1)^k m_i) = limits(product)_(i=1)^k phi(m_i)$.
]

#proof[
    Индукция по $k$.

    "База": $k = 1 ==> phi(m_1) = phi(m_1)$
    
    "Переход": $n-1 -> n$
    
    $(m_n, m_1) = ... = (m_n, m_(n-1)) = 1 ==> (m_1, ..., m_n) = 1 ==>$
    
    $phi(m_1 ... m_n) = phi(m_1 ... m_(n-1)) phi(m_n) = phi(m_1) ... phi(m_(n-1)) phi(m_n)$
]

#follow[    
    Пусть $n = p_1^(r_1), ..., p_s^(r_s)$ --- разложение числа $n$ на простые множители.
    
    $==> phi(n) = limits(product)_(i=1)^s (p_i^(r_i) - p_i^(r_i-1))$
]

#proof[
    По следствию: $phi(n) = phi(limits(product)_(i=1)^s p_i^(r_i)) = limits(product)_(i=1)^s phi(p_i^(r_i)) = limits(product)_(i=1)^s (p_i^(r_i) - p_i^(r_i-1))$
]

#lemma[ 
    Пусть $R$ --- ассоциативное кольцо с единицей.
    +   $a, b in R^* ==> a b in R^*$
    
    +   $a in R^*, space  x,y in R ==> cases(
            a x = a y ==> x = y,
            x a = y a ==> x = y
        )$
]

#proof[
    +   $a'$ --- обратный к $a$ элемент, $b'$ --- обратный к $b$ элемент.
    
        $(a b)(b' a') = a (b b') a' = a a' = 1$
        
        $(b' a) (a b) = b' (a a') b = b b' = 1$
    
    +   $a'$ --- обратный к $a$ элемент.
    
        $a x = a y ==> a' a x = a' a y ==> x = y$
        
        $x a = y a ==> x a a' = y a a' ==> x = y$
]

#th(name: "Теорема Эйлера")[
    Пусть $m in NN, space  a in ZZ, space  a bot m ==> a^(phi(m)) equiv(m) 1$.
]

#proof[

    $(factor(ZZ, m ZZ))^* = {A_1, A_2, ..., A_(phi(m))}$
    
    $[a]_m, A_j in (factor(ZZ, m ZZ))^* limits(==>)^("1 из леммы") [a]_m A_j in (factor(ZZ, m ZZ))^*$, тогда 
    
    $[a]_m A_1, ..., [a]_m A_(phi(m))$ --- различные элементы, иначе $[a]_m A_j = [a]_m A_k limits(==>)^("2 из леммы") A_j = A_k$
    
    ${[a]_m A_1, ..., [a]_m A_(phi(m))} = (factor(ZZ, m ZZ))^* ==>$
    
    $[a]_m A_1 dot.c ... dot.c [a]_m A_(phi(m)) = A_1 A_2 ... A_(phi(m)) ==>$
    
    $[a]_m^(phi(m)) A_1 A_2 ... A_(phi(m)) = [1]_m A_1 A_2 ... A_(phi(m)) limits(==>)^("2 из леммы")$
    
    $[a]_m^(phi(m)) = [1]_m ==> [a^(phi(m))]_m = [1]_m ==> a^(phi(m)) equiv(m) 1$
]

#th(name: "Малая теорема Ферма")[
    Пусть $p in PP, space  a in ZZ ==> a^p equiv(p) a$
]

#proof[

    $(a, p) = 1 ==> a^(p-1) equiv(p) 1 ==> a^(p-1) dot.c a equiv(p) 1 dot.c a ==> a^p equiv(p) a$

    $(a, p) eq.not 1 ==> a equiv(p) 0 ==> cases(
        a^p equiv(p) 0,
        a equiv(p) 0
    ) ==> a^p equiv(p) a$
]

#th(name: "Теорема Вильсона")[
    $p in PP ==> (p-1)! equiv(p) -1$
]

#proof[
    В $(factor(ZZ, p ZZ))^* : overline((p-1)!) = overline(1) dot.c overline(2) dot.c ... dot.c overline(p-1) = limits(product)_(A in (factor(ZZ, p ZZ))^*) A = $
    
    $( limits(product)_(A^2 = overline(1)) A ) dot.c ( limits(product)_(A^2 eq.not overline(1)) A ) = ( limits(product)_(A^2 = overline(1)) A ) dot.c ( A_1 dot.c A_1' dot.c ... ) = ( limits(product)_(A^2 = overline(1)) A ) dot.c overline(1) = limits(product)_(A^2 = overline(1)) A$
    
    Рассмотрим каждый элемент:

    $A^2 = overline(1) <==> A^2 - overline(1)^2 = overline(0) <==> (A - overline(1))(A + overline(1)) = overline(0) limits(<==>)^((factor(ZZ, p ZZ)) "--- ОЦ") A - overline(1) = overline(0) " или " A + overline(1) = overline(0)$
    
    Тогда, если:
    $ cases(
        p = 2\, space &"то" space limits(product)_(A^2 = overline(1)) A = overline(1) = overline(-1),
        p eq.not 2\, space &"то" space limits(product)_(A^2 = overline(1)) A = overline(1) dot.c overline(-1) = overline(-1)
    ) $
]
