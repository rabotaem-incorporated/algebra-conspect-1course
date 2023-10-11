#import "../../utils/core.typ": *

== Матрица перехода. Координаты

#ticket(step-fn: x => x + 2)[Координаты вектора. Изменение координат при замене базиса]

#def[
    Пусть $E = sq(e) = V$ --- базис $V$. _Координатами_ $v in V$ называется набор скаляров $alpha_1, ..., alpha_n$ такой, что 
    $ v = alpha_1 e_1 + ... + alpha_n e_n = (sq(e)) vec(alpha_1, dots.v, alpha_n). $
    Координаты вектора $v$ обычно записывают столбцом и обозначают $[v]_E$.
]

#def[
    Пусть $E = (sq(e))$ --- базис. Тогда если $F = (sq(f))$ --- другой базис, то 
    $ M_(E -> F) = ([f_1]_E, ..., [f_n]_E) in M_n (K). $
    Такая матрица называется _матрицей перехода_ от базиса $E$ к базису $F$.

    $ E M_(E -> F) = F. $
]

#example[
    Чтобы разобраться что к чему, посмотрим на пример. Пусть $V = RR[x]_(<=3)$. Пусть базисы
    $ 
        E &= (& x^2 + x + 1, && 2x, &&  x - 1&), \
        F &= (&     x^2 + 2, &&  x, && 2x - 2&).
    $
    Тогда в базисе $E$ вектора $F$ записываются как
    $
        [f_1]_E = [x^2 + 2]_E = vec(1, 0, -1), #h(1cm)
        [f_2]_E = [x]_E = vec(0, 1/2, 0), #h(1cm)
        [f_3]_E = [2x - 2]_E = vec(0, 0, 2).
    $
    Получаем матрицу перехода
    $
        M_(E -> F) = mat(1, 0, 0; 0, 1/2, 0; -1, 0, 2).
    $
    Нетрудно убедиться, что 
    $
        E M_(E -> F) = (x^2 + x + 1, 2x, x - 1) dot mat(1, 0, 0; 0, 1/2, 0; -1, 0, 2) =
        (x^2 + 2, x, 2x - 2) = F.
    $
    Что при этом происходит с координатами? Пусть имеется какой-то вектор $v$, например, $v = 2x^2$. Тогда
    $
        v = F [v]_F = E M_(E -> F) [v]_F = E [v]_E,
    $
    откуда $[v]_E = M_(E -> F) [v]_F$, хотя стрелка показывает в обратную сторону. В этом примере
    $
        [2x^2]_E = vec(2, -2, 2) = M_(E -> F) [v]_F = mat(1, 0, 0; 0, 1/2, 0; -1, 0, 2) vec(2, -4, 2).
    $
    Как выяснится через секунду, это домножение на обратную матрицу.
]

#ticket(step-fn: x => x - 1, post-step-fn: x => x + 1)[Свойства матриц перехода между базисами]

#pr[
    + $M_(E -> F) in GL_n (K)$, $M_(E -> F)^(-1) = M_(F -> E)$
    + Если $E, F, G$ --- базисы $V$, то $M_(E -> F)M_(F -> G) = M_(E -> G).$
]

#proof[
    2. Распишем $F$ и $G$:
    $ cases(F = E M_(E -> F), G = F M_(F -> G)) ==> \
    G = (E M_(E -> F)) M_(F -> G) = E (M_(E -> F) M_(F -> G)) = E M_(E -> G) $

    $E$ --- базис, следовательно $M_(E -> G) = M_(E -> F) M_(F -> G)$

    1. Следует из 2:
    $ cases(M_(E -> F)M_(F -> E) = M_(E -> E) = E_n, M_(F -> E)M_(E -> F) = M_(F -> F) = E_n) ==> M_(E -> F)^(-1) = M_(F -> E). $
]
