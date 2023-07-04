#import "../../utils/core.typ": *

== Алгебраически замкнутые поля. Каноническое разложение над $CC$ и над $RR$.

#def[
    Поле $K$ называется _алгебраически замкнутым_, если любой $f in K[x]$ имеет корень в $K$.
]

#th(name: [Основная теорема алгебры.])[
    $CC$ алгебраически замкнуто.
]

#proof[
     Не будет в курсе.

     Идея доказательства:

     $f = a_n x^n + ... + a_1x + a_0, space z in CC, space f(z) = 0$.

     $r > max\{abs(a_0), ..., abs(a_n)\}$.

     $f(r(cos(phi) + i sin(phi))) = r^n (cos(n phi) + i sin(n phi)) + g(r(cos(phi) + i sin(phi)))$.

     $abs(g(r(cos(phi) + i sin(phi)))) < r^(n - 1)(abs(a_(n - 1)) + ... + abs(a_1) + abs(a_0)) < r^n$.

     $==> Delta arg f(r(cos(phi) + i sin(phi))) = 2 pi n$.

     $D = \{z in CC divides abs(z) <= r\}$

     $limits(==>)^("Топология") f(D)$ --- односвязная область.

     $==> 0 in f(D) ==> exists z space f(z) = 0$.
]

#notice[ 
    Любое поле можно вложить в алгебраически замкнутое поле. 
    
    Всегда есть минимальное такое поле.

    Для $QQ$ это поле алгебраических чисел.

    Алгебраическое число --- комплексный корень многочлена над $QQ$.
]

#pr[
    $K$ --- алгебраически замкнутое поле, $f in K[x]$.

    Тогда $f$ --- неприводим $<==> deg f = 1$.
]

#proof[
    Все многочлены степени $1$ неприводимы.

    $deg f eq.not 1 ==> exists x in K: f(x) = 0$

    $limits(==>)^("Т. Безу") (x - c) divides f ==>$ он приводим

    Таким образом если $f in K[x], space deg f >= 1$, то его каноническое разложение имеет вид: 
    $
        f = c_0 limits(product)_(i = 1)^n (x - c_i)^(d_i),
    $ 
    где $c_i in K, space d_i in ZZ_+$.
]

#pr[
    $f in RR[x], space a in CC$ --- его корень.

    Тогда $overline(a)$ --- корень $f$ той же кратности.
]

#proof[
    
    Пусть $l$ --- кратность корня $a$.

    В $CC[x]$ имеем $f = (x - a)^l g, quad g in CC[x], space g(a) eq.not 0$.

    Пусть $g = b_n x^n + ... + b_1 x + b_0$.

    Рассмотрим $overline(g) = overline(b_n) x^n + ... + overline(b_1) x + overline(b_0)$.

    Тогда $f = overline(f) = overline((x - a)^l) overline(g) = (x - overline(a))^l overline(g) ==> f(overline(a)) = 0$

    $0 eq.not g(a) = overline(overline(g)(overline(a))) ==> (x - overline(a)) divides.not overline(g)$

    $==> overline(a)$ --- корень $f$ кратности $l$

    $==>$ все корни разбиваются на пары сопряженных, тогда каноническое разложение в $CC[x]$ имеет вид:
    $ 
        f = r_0(limits(product)_(i = 1)^n (x - r_i)^(d_i)) dot (limits(product)_(i = 1)^m ((x - c_i)(x - overline(c_i)))^(p_i)), 
    $
    где $r_i in RR, space d_i in Z_+, space c_i,overline(c_i) in CC, space p_i in ZZ_+$.
    $ 
        <==> f = r_0(limits(product)_(i = 1)^n (x - r_i)^(d_i)) dot (limits(product)_(i = 1)^m B_i^(p_i)), 
    $
    $B_i$ --- квадратичные многочлены, неприводимые в $RR$.

    $B_i = (x - c_i)(x - overline(c_i)) = x^2 - (c_i + overline(c_i))x + c_i overline(c_i) = x^2 - 2 Re c_i x + abs(c_i)^2 in RR[x]$
]

#pr[
    Унитарные неприводимые многочлены в $RR$ --- это:

    1. $x - a, quad a in RR$

    2. $x^2 + a x + b, quad a, b in RR, space  b^2 - 4a c < 0$
]

#proof[
    С многочленами степени 1 и 2 все ясно.

    Если степень многочлена больше 2, то справедливо разложение по предыдущему предложению значит он приводим.
]


