#import "../../utils/core.typ": *

== Построение поля комплексных чисел

#def[
    $CC = RR times RR = \{(a, b) divides a, b in RR\}$
]

#def[
    - Сложение на $CC$: $(a_1, b_1) + (a_2, b_2) = (a_1 + a_2, b_1 + b_2)$

    - Умножение на $CC$: $(a_1, b_1) dot (a_2, b_2) = (a_1 a_2 - b_1 b_2, a_1 b_2 + a_2 b_1)$
]

#pr[
    $(CC, +, dot)$ --- поле.
]

#proof[
    - Коммутативность сложения: #[
        $
            &(a, a') + (b, b') =\
            &(a + b, a' + b') =\
            &(b + a, b' + a') =
            &(b, b') + (a, a')
        $
    ]

    - Ассоциативность сложения: #[
        $ 
            &((a, a') + (b, b')) + (c, c') =\ 
            &(a + b + c, a' + b' + c') =\
            &(a + (b + c), a' + (b' + c')) =\
            &(a, a') + ((b, b') + (c, c')) 
        $
    ] 

    - $(0, 0)$ --- нейтральный элемент сложения.

    - $(-a, -b)$ --- обратный элемент к $(a, b)$.

    - Коммутативность умножения: #[
        $
            &(a, a') dot (b, b') =\
            &(a b - a' b', a b' + a' b) =\ 
            &(b a - b' a', b a' + b' a) =\ 
            &(b, b') dot (a, a') 
        $
    ]

    - Ассоциативность умножения: #[
        $
            &((a, a') dot (b, b')) dot (c, c') =\ 
            &(a b - a' b', a b' + a' b) dot (c, c') =\ 
            &(c (a b - a' b') - c' (a b' + a' b), c (a b' + a' b) + c' (a b - a' b')) =\ 
            &(c a b - c a' b' - c' a b' - c' a' b, c a b' + c a' b + c' a b - c' a' b') =\ 
            &(a b c - a' b' c - a b' c' - a' b c', a b c' + a b' c + a b c' - a' b' c')
        $
        $
            &(a, a') dot ((b, b') dot (c, c')) =\ 
            &(a, a') dot (b c - b' c', b c' + b' c) =\ 
            &(a (b c - b'c') - a' (b c' + b' c), a (b c' + b' c) + a' (b c - b' c')) =\ 
            &(a b c - a' b' c - a b' c' - a' b c', a b c' + a b' c + a b c' - a' b' c')
        $

        Как видно, выражения совпадают.
    ]

    - Дистрибутивность: #[
        Проверим правую, левая проверяется аналогично:
        $
            &((a, a') + (b, b')) dot (c, c') =\ 
            &(a + b, a' + b') dot (c, c') =\ 
            &((a c + b c) - (a' c' + b' c'), (a' c + b' c) + (a c' + b c')) =\ 
            &(a c - a' c', a' c + a c') + (b c - b' c', b' c + b c') =\ 
            &(a, a') dot (c, c') + (b, b') dot (c, c')
        $
    ]
    - $(1, 0)$ --- нейтральный элемент умножения.

    - $(a, b) z_1 z_2 = (1, 0): space z_1 = (a, -b), space z_2 = (1)/(a^2 + b^2)$
]

#def[
    $CC$ --- поле комплексных чисел.
]

#def[
    $c in CC$ --- комплексное число.
]

#pr[    
    $RR' = \{(a, 0) divides a in RR\}$, тогда:
    
    $RR'$ замкнуто относительно сложения, вычитания, умножения, содержит единицу, то есть является подкольцом поля $CC ==> RR'$ --- само является кольцом относительно сложения, умножения, ограниченных на $RR'$. 
    
    Тогда существует отображение $phi: space RR -> RR'$, где $a maps (a, 0)$, и $phi(a)$ --- изоморфизм колец, 
    
    то есть $phi$ --- биекция и $display(cases(
        phi(a + b) = phi(a) + phi(b),
        phi(a b) = phi(a) phi(b)
    ))$.

    Отождествим $(a, 0)$ с вещественным числом $a$.
]

Давайте наконец-то определим комплексное число.

$(a, 0) dot (0, 1) = (0, a)$
    
$(a, b) = (a, 0) + (0, b) = (a, 0) + (b, 0) dot (0, 1) = a + b dot (0, 1) = a + b i$

#def[    
    $z = a + b i$ --- _комплексное число_.

    $a = \Re(z)$, $b = \Im(z)$ --- _действительная_ и _мнимая_ части комплексного числа $z$.
    
    В геометрическом виде это вектор $z = (a, b)$.
]

#def[
    Пусть $z = a + b i$ --- комплексное число, тогда $overline(z) = a - b i$ --- _сопряженное_ к $z$.
]

*Отступление про отображения*

#def[
    $id_M: M -> M, space x maps x$ --- тождественное отображение на $M$.
]

#def[    
    Пусть $alpha: M -> N, space beta: N -> P$ --- отображения
    
    Тогда $alpha compose beta: M -> P, space x maps alpha(beta(x))$ --- композиция отображений.
]

#def[    
    Пусть $alpha: M -> N$ --- отображение

    Отображение $beta: N -> M$ --- обратное к $alpha$, если $beta compose alpha = id_M$.
]

#pr[
    У отображения $alpha: M -> N$ есть обратное отображение, если и только если $alpha$ --- биекция.
]

#proof[
    "$arrow.r.double$":
    
    Инъективность:
    
    $beta compose alpha = id_M, space alpha(x) = alpha(y) ==> beta(alpha(x)) = beta(alpha(y)) ==> x = y$
    
    Сюръективность:
    
    $y in N, space y = alpha(beta(y)) in \Im(alpha)$ ($\Im$ это прообраз)
    
    "$arrow.l.double$":
    
    Пусть $alpha$ --- биекция, назовем $beta: N -> M$ --- обратным, если $forall y in N alpha^(-1)(y) = \{x\}, space x in M$
    
    Положим $beta(y) = x, space alpha compose beta = id_N, space beta compose alpha = id_M$
]

*Продолжение*

#def[
    Автоморфизм --- изоморфизм на себя.
]

#pr[
    $sigma: CC -> CC, space z maps overline(z)$ --- автоморфизм.
]

#proof[
    $sigma$ --- биекция, т.к. $sigma compose sigma = id_(CC)$
    
    $sigma(z_1 + z_2) = sigma(z_1) + sigma(z_2)$ --- очевидно
    
    $sigma(z_1 z_2) = sigma(z_1) sigma(z_2)$
    
    $sigma(1) = 1$ --- очевидно
    
    $z_1 = a_1 + b_1i, space z_2 = a_2 + b_2i$
    
    $sigma(z_1 z_2) = overline(a_1 a_2 - b_1 b_2 + i(a_1 b_2 + a_2 b_1)) = a_1 a_2 - b_1 b_2 + i(a_1 b_2 + a_2 b_1)$
    
    $sigma(z_1) sigma(z_2) = overline((a_1 - i b_1) (a_2 - i b_2)) = a_1 a_2 - b_1 b_2 + i(a_1 b_2 + a_2 b_1)$
]