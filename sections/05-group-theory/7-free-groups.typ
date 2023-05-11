#import "../../utils/core.typ": *

== Свободные группы

#def[
    Пусть $F$ --- группа, $f_1, f_2, ..., f_k in F$. Говорят, что $F$ --- _свободная группа_ со свободным образом $f_1, ..., f_k$, если для всякой группы $G$ и $g_1, ..., g_k in G$
    $
        exists! space phi: F --> G space #[--- гомоморфизм]\
        phi(f_i) = g_i, i = 1, ..., k
    $
]

#pr[
    Пусть $F$ --- свободная группа со свободным образом $f_1, ..., f_k$, аналогично $F'$ --- свободная группа со свободным образом $f'_1, ..., f'_k$.
    Тогда существует изоморфизм $epsilon$ такой, что
    $
        epsilon(f_i) = f_i', i = 1, ..., k
    $
]

#proof[
    Существует гомоморфизм $epsilon : F --> F', space epsilon(f_i) = f'_i$ и гомоморфизм $epsilon': F' --> F : epsilon'(f_i') = f_i$
    $
        epsilon' compose epsilon: F &--> F space (epsilon' compose epsilon)(f_i) = f_i\
        id: F &--> F space id_F(f_i) = f_i \
        ==> epsilon' compose epsilon = id_F
    $
    Аналогично $epsilon compose epsilon' = id_F$. Таким образом $epsilon$ биекция, поэтому изоморфизм.
]

#def[
    + $A = {a_1, ..., a_k, ..., a_1', ..., a_k'}$ --- _алфавит_
    + $W = {l_1...l_d bar d >= 0; l_1, ..., l_d in A}$ --- _слово_
    + _Вставкой_ назовем следующую операцию:
        $
            L R --> L a_i a_i' R&\
            L R --> L a_i' a_i R&, space (L, R in W)
        $
        Обратной операцией назовем _сокращением_.
    + Будем говорить, что $omega sim omega'$, если $omega$ можно получить из $omega'$ конечным числом вставок и сокращений.
]

