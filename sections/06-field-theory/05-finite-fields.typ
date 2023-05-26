#import "../../utils/core.typ": *
== Классификация конечных полей

#pr[
    Пусть $char F = p in PP_(>0)$. Сущесвует эндоморфизм $Phi$, который ведет себя следующим образом:
    $
        F &limits(-->)^(Phi) F \
        x &maps x^p.
    $
    Такой эндоморфизм называется _эндоморфизмом Фробениуса_.
]

#proof[
    $
        Phi(x y) = (x y)^p = x^p y^p = Phi(x) Phi(y), \
        Phi(1) = 1^p = 1, \
        Phi(x + y) = x^p + y^p + sum_(i=1)^(p-1) underbrace(C_p^i x^i y^(p-i), p divides) = x^p + y^p = Phi(x) + Phi(y).
    $
]

#notice[
    Если $F$ --- конечное, то $Phi$ --- автоморфизм.
]

#pr[
    Пусть $F$ --- поле, $abs(F) = q < oo$. Тогда $forall x in F$, $x^q = x$.
]

#proof[
    Очевидно при $x = 0$. Если $x != 0$, то $x in F^*$.

    $
        F^* - ["циклическая"] "группа порядка" q - 1 ==> x^(q-1) = 1 ==> x^q = x.
    $
]

#th[
    Пусть $q = p^n$. Тогда поле из $q$ элементов существует.
]

#proof[
    $F$ --- поле из $p$ элементов. $L fg F$ --- поле разложения $x^q - x$.
    
    Посмотрим на производную: $(x^q - x)' = q x^(q-1) - 1 = -1 ==>$ у $x^q - x$ нет кратных корней.
    $a_1, ..., a_q$ --- все корни $x^q - x$, $K = {a_1, ..., a_q}$. 
    Оказывается, что $K$ --- подполе в $L$, потому что:
    $
        a, b in K space (a+b)^q - (a+b) = a^q + b^q - a - b = 0\
        (a b)^q - a b = a^q b^q - a b = a b - a b = 0\
        (-a)^q = (-1)^q a^q = underbrace((-1), #place[даже при $p = 2$]) a = -a\
        1^q = 1\
    $
]

#lemma[
    Пусть $L fg K$ --- конечное расширение конечного поля. Тогда $L fg K$ --- простое.
]
#proof[
    $L^*$ --- циклическая, то есть $L^* = gen(theta)$. $K(theta) = L$.
]

#th[
    Пусть $K_1$ и $K_2$ --- поля и $abs(K_1) = abs(K_2) = p^n$. Тогда $K_1 iso K_2$.
]

#proof[
    По лемме, $K_1$ --- простое расширение. $K_1 = FF_p(theta_1)$. Пусть $g = Irr_FF_p theta_1$. $deg g = n$, так как $[K_1 : FF_p] = n$. $theta_1$ --- корень $x^p^n-x$, значит $g divides (x^p^n - x)$.

    В $K_2$ все элементы --- корни $x^p^n - x$, значит у него есть $p^n$ корней. Значит $x^p^n - x$ раскадывается на линейные множители в $K_2$. Получается, что $g$ раскладывается на линейные множители в $K_2$. Поэтому $exists theta_2 in K_2: g(theta_2) = 0 ==> [FF_p(theta_2) : FF_p] = n = [K_2 : FF_p] ==> FF_p(theta_2) = K_2$.
    Теперь заметим, что если $K_1 = FF_p(theta_1), K_2 = FF_p(theta_2)$ и $Irr_FF_p(theta_1) = Irr_FF_p(theta_2)$, то $K_2 iso K_1$.
]

#denote[
    $FF_q$ --- поле из $q$ элементов.
]

#th[
    + Пусть $K$ --- подполе $FF_(p^n)$. Тогда $abs(K) = p^m$, $m divides n$
    + Пусть $m divides n$. Тогда в $FF_(p^n)$ есть единственное подполе из $p^m$ элементов 
]

#proof[
    + $char K = p ==> abs(K) = p^m$ для некоторого $m in NN$\ 
        $[FF_(p^n) : K] = d ==> underbrace(abs(FF_(p^n)), p^n) = underbrace(abs(K)^d, (p^m)^d), space n = m d$
    + $m divides n ==> (p^m - 1) divides (p^n - 1) ==> (x^(p^m - 1) - 1) divides (x^(p^n - 1) - 1) ==> (x^(p^m) - x) divides (x^(p^n) - x) $
    $x^(p^n) - x$ расскладывается на линейные в $FF_(p^n) ==> x^(p^m)- x$ тоже расскладывается на линейные в $FF_(p^n)$

    Очевидно, корни разложения: $x_1, ..., x_(p^m)$, ${x_1, ..., x_(p^m)}$ --- искомое подполе.
    
    Единственность: Пусть $F_1$ и $F_2$ --- подполя $FF_(p^n)$ из $p^m$ элементов
    $ forall x in F_1 union F_2 : x^(p^m) - x = 0 ==> abs(F_1 union F_2) <= p^m ==> F_1 = F_2$
]


#example[
    #import "../../utils/cd/cd.typ": *

    #align(center)[#commutative_diagram(
        node((0, 1), $FF_4096$),
        node((1, 0), $FF_64$),
        node((1, 2), $FF_16$),
        node((2, 0), $FF_8$),
        node((2, 2), $FF_4$),
        node((3, 1), $FF_2$),
        arr((0, 1), (1, 0), $$),
        arr((0, 1), (1, 2), $$),
        arr((1, 0), (2, 0), $$),
        arr((1, 0), (2, 2), $$),
        arr((1, 2), (2, 2), $$),
        arr((2, 0), (3, 1), $$),
        arr((2, 2), (3, 1), $$)
    )]
]

== Автоморфизмы конечных полей. (без доказательств)

$
abs(A u t(FF_(p^n))) = n \
A u t(FF_(p^n)) = gen(Phi) 
$

$
Phi: FF_(p^n) &--> FF_(p^n) \

x &maps x^p \
$

$
    [L : K] = n ==> \
    abs(underbrace(A u t(L fg K), {sigma in A u t L})) <= n
$