#import "../../utils/core.typ": *

== Корни из комплексных чисел

Рассмотрим уравнение $z^n = w, space n in NN, space w in CC$.

#th[    
    Пусть $n in NN, space w in CC$

    + Если $w = 0$, То уравнение $z^n = w$ имеет единственный корень $z = 0$.
        
    + Если $w eq.not 0$, То уравнение $z^n = w$ имеет ровно $n$ различных корней: $
         z_k = root(n, r) (cos(phi + 2 pi k)/(n) + i sin(phi + 2 pi k)/(n)), space k = 0, 1, ..., n-1
    $
]

#proof[
    + $w = 0 ==> z = 0$

    + #[
        $w eq.not 0 ==> display(cases(
            w = r (cos phi + i sin phi) : quad r > 0\, space phi in RR,
            z = p (cos alpha + i sin alpha) : quad p > 0\, space alpha in RR
        ))$
    
        $z^n = w <==> p^n (cos n alpha + i sin n alpha) = r (cos phi + i sin phi) <==>$

        $display(cases(
            p^n = r,
            n alpha = phi + 2 pi k\, space k in ZZ
         )) <==> display(cases(
            p = root(n, r),
            alpha = (phi + 2 pi k)/(n)\, space k in ZZ
        ))$
    
        $z^n = w <==> z = underbrace(root(n, r) (cos(phi + 2 pi k)/(n) + i sin(phi + 2 pi k)/(n)), z_k), space k in ZZ$
    
        При каких $k, space l: space z_k = z_l$?
    
        $z_k = z_l <==> (phi + 2 pi k)/(n) = (phi + 2 pi l)/(n) + 2 pi s, space s in ZZ <==>$ 
        
        $(k)/(n) = (l)/(n) + s, space s in ZZ <==> k = l + n s, space s in ZZ <==> $
        
        $k equiv_(n) l <==> z in \{z_0, z_1, ..., z_(n-1)\}$
    ]
]

*Изображение на окружности*

#align(center)[
    #image("../../images/roots.svg", width: 40%)
]

Комплексные корни образуют правильный $n$-угольник на окружности.

#lemma[    
    Пусть $z_0, z_1, ..., z_(n - 1)$ --- все корни $z^n = w, space n > 1$

    Тогда $z_0 + z_1 + ... + z_(n - 1) = 0$
]

#proof[
    Заметим, что $z_k = z_(k - 1) underbrace((cos(2 pi)/(n) + i sin(2 pi)/(n) ), xi)$, тогда $z_k = z_0 dot xi^k$.

    Обозначим $S = z_0 + z_1 + ... + z_(n - 1)$, значит $xi dot S = z_1 + z_2 + ... + underbrace(z_n, = z_0) = S ==> xi S = S ==> (xi - 1) S = 0$

    Из того что $n > 1 ==> xi eq.not 1$, а значит $(xi - 1) S = 0 ==> S = 0$
]

#def[    
    _Группа_ --- это множество $G$ с операцией $*: G times G -> G$ такая, что:
    
    + $*$ --- ассоциативна: $(a * b) * c = a * (b * c)$
    + Существует нейтральный элемент $e in G$ такой, что $a * e = e * a = a$ для любого $a in G$
    + У любого элемента $a in G$ существует обратный элемент $a^(-1) in G$ такой, что $a space * space a^(-1) = a^(-1) * a = e$
]

#examples[
    + $(ZZ, +)$
    + $((factor(ZZ, n ZZ))^*, dot)$
    + Если $R$ --- ассоциативное кольцо с $1$, то $R^* = \{r divides exists s in R : r s = s r = 1\}$ --- группа относительно умножения.
]

#pr[
    $mu_n = \{z in CC divides z^n = 1\} = \{underbrace(cos (2 pi k)/(n) + i sin (2 pi k)/(n), xi_k) divides k = 0, 1, ..., n-1\}$ --- группа относительно умножения.
]

#proof[
    - Ассоциативность --- так как есть ассоциативность в $CC$
    
    - $1 in mu_n space (1 = xi_0)$
    
    - $xi_k dot xi_(-k) = (cos(2 pi k)/(n) + i sin(2 pi k)/(n)) (cos(2 pi (-k))/(n) + i sin(2 pi (-k))/(n)) = 1$
]

#lemma[
    $xi_k = xi_1^k$
]

#proof[
    $(1 dot cos(2 pi k)/(n) + 1 dot i sin(2 pi)/(n))^k = 1^k dot (cos(2 pi k)/(n) + i sin(2 pi k)/(n))$ (по формуле Муавра)
]

#def[    
    $G$ --- группа с операцией $*$, $g in G, space n in ZZ$, тогда:

    $g^n = display(cases(
        g space * space g space * space ... space * space g\, & n > 0,
        e\, & n = 0,
        g^(-1) * g^(-1) * space ... space * g^(-1)\, & n < 0
    ))$
]

#def[    
    Группа $G$ называется _циклической_, если $exists g in G : space G = \{g^n divides n in ZZ\}$

    Пишут: $G = angle.l g angle.r$
]

#def[
    $g$ --- _образующий элемент_ группы $G$
]

#examples[
    - $ZZ = angle.l 1 angle.r = angle.l -1 angle.r$ (по сложению) $g^n = display(cases(
        1 + 1 + ... + 1 & n > 0,
        0 & n = 0,
        -1 + -1 + ... + -1 quad & n < 0
    ))$

    - $factor(ZZ, 5 ZZ) = angle.l overline(1) angle.r = angle.l overline(2) angle.r = angle.l overline(3) angle.r = angle.l overline(4) angle.r$ (по сложению)
    
    - $factor(ZZ, 6 ZZ) = angle.l overline(1) angle.r = angle.l overline(5) angle.r$ (по сложению)
    
    - $(factor(ZZ, 5 ZZ))^* = angle.l overline(2) angle.r = angle.l overline(3) angle.r$ (по умножению)
    
    - $(factor(ZZ, 8 ZZ))^*$ --- не циклическая группа $g^2 = e ==> g^(2 k) = e, space g^(2 k + 1) = g$
]

#def[    
    $G$ --- группа, $g in G$

    Если $forall n in NN: g^n eq.not e$, то говорят, что $g$ --- _бесконечный порядок_

    Если $exists n in NN: g^n = e$, то минимальное такое $n$ называют _порядком_ $g$ (пишут: $ord g = n$)
]

#example[
    $factor(ZZ, 5 ZZ)$

    $ord overline(1) = 1$

    $ord overline(2) = 4$
    
    $ord overline(3) = 4$
    
    $ord overline(4) = 2$
]

#pr[    
    Пусть $G$ --- конечная группа, $abs(G) = n, space g in G$.

    Тогда: $G = angle.l g angle.r <==> ord g = n$
]

#proof[\
    "$arrow.r.double$":

    $exists k, space l in \{0, 1, ..., n\}, space k eq.not l: space g^k = g^l$

    $k < l$: $g^(-k) dot g^k = g^(-k) dot g^l = g^(l - k) = e$

    $0 < l - k <= n$

    Таким образом, порядок $g$ не превосходит $n$

    Предположим, $ord g = m < n$

    $G = \{ g^k divides k in ZZ \} = \{ g^(m q + r) divides q in ZZ, space 0 <= r < m \} = \{g^0, g^1, ..., g^(m-1)\}$ --- противоречие, так как $abs(G) <= m < n$, а мы знаем что $abs(G) = n$.

    "$arrow.l.double$":

    $ord g = n$

    $==> g^0, g^1, g^2, ..., g^(n - 1)$ --- попарно различны

    $==> \{g^0, g^1, ..., g^(n - 1)\} = G$

    $==> G = angle.l g angle.r$
]

#def[
    _Первообразным корнем_ из $1$ степени $n$ называется такой элемент $z in CC^*$, что $ord z = n$
]

#example[
    $mu_6 = \{1, xi_1, xi_2, xi_3, xi_4, xi_5\}$
    
    $ord 1 = 1$, $ord xi_1 = 6$, $ord xi_2 = 3$, $ord xi_3 = 2$, $ord xi_4 = 3$, $ord xi_5 = 6$

    $xi_2$ --- первообразный корень из $1$ степени $3$
]