#import "../../utils/core.typ": *
== Расширение полей

#def[
    Пусть $f in K[x]$. Расширение $L fg K$ называется полем разложения $f$ над $K$, если
    + $f$ раскладывается в $L[x]$ на линейные множители
    + $L = K(a_1, ..., a_n)$, где $a_1, ..., a_n$ --- корни $f$ в $L$.
]

#example[
    + $CC fg RR$ --- поле разложения $x^2 + 1$
    + $QQ(root(4, 2))$ --- *не* поле разложения $x^4 - 2$ над $QQ$
    + $QQ(root(4, 2), i)$ --- поле разложения $x^4 - 2$
]

#pr[
    Пусть $f in K[x]$. Тогда существует поле разложния над $K$.
]

#proof[
    Индукция по $d = deg f$
    + $d = 1 ==> K$ --- поле разложения $f$
    + $d > 1$ $g divides f, g$ --- неприводим. $L = K(a), Irr a = g$. В $L$ $g(a) = 0 ==> f(a) = 0 ==> f = (f - a)f_1$. \
    Степень $f_1 = d-1 ==> exists M fg L$, где $M$ --- поле разложения $f_1$. Тогда заметим, что $M fg K$ --- поле разложения $f$.
    Пусть $a_2, ..., a_c$ --- все корни $f_1$ в $M$
    $
        cases(M = L(a_2, ..., a_c), L = K(a)) ==> M = K(a_1, a_2, ..., a_c)
    $
]

#notice[
    Поле разложения единственно с точностью до изоморфизма.
]

#proof[
    Без доказательства.
]

#pr[
    Пусть $L fg K$ --- расширение. Тогда два условия эквивалентны:
    + $L fg K$ --- конечно.
    + $L = K(a_1, ..., a_n)$, $a_1, ..., a_n$ --- алгебраичны над $K$
]

#proof[
    - "$1 ==> 2$": $a_1, ..., a_n$ --- базис $L$ над $K$. Тогда $K(a_1, ..., a_n) = L$.
    
    - "$2 ==> 1$": Индукция по $n$:
        Пусть мы знаем, что $[L' : K] < oo$, где $L' = K(a_1, ..., a_(n-1))$. По индукционному предположению оно конечно. Заметим, что $L = L'(a_n)$, $a_n$ --- алгебраичен над $K ==> a_n$ алгебраичен над $L'$. Поэтому $[L : K] = [L : L'] dot [L' dot K] < oo$.
]

#follow[
    Пусть $L fg K$ --- любое расширение, $a, b in L$, $a, b$ --- алгебраические над $K$. Тогда 
    $ a+b, a b $ --- алгебраичны над $K$.
]

#proof[
    Присоединим и $a$, и $b$. Это расширение конечно, значит алгебраично. И $a + b$, и $a b$ там лежат, поэтому они алгебраичны.
]
