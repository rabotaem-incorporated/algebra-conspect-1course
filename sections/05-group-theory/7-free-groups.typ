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
    Пусть $F$ --- свободная группа со свободным образом $f_1, ..., f_k$, аналогично $F'$ --- свободная группа со свободным образом $f_1', ..., f_k'$.
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
        Обратную операцию назовем _сокращением_.
    + Будем говорить, что $omega sim omega'$, если $omega$ можно получить из $omega'$ конечным числом вставок и сокращений.
]

#notice[
    $sim$ --- отношение эквивалентности на $W$. Тогда $F = W fg sim$.\ 
    Назовем пустое слово $Lambda$. Таким образом $Lambda = [] = [x_i x_i'] = ...$
]

#notice[
    Умножение введем следующим образом:
    $
        F times F &--> F \
        ([w], [w']) &maps [w w']
    $
    То есть умножение --- конкатенация двух слов. Нетрудно увидеть, что оно определено корректно.
]

#pr[
    $(F, dot)$ --- группа
]

#proof[
    + Ассоциативность 
        $
            (w_1 w_2) w_3 = w_1(w_2 w_3) = w_1 w_2 w_3
        $
    + $Lambda$ --- нейтральный элемент
    + Обратный элемент:
        $
            cases(
                [x_j] dot [x_j'] = [x_j x_j'] = Lambda,
                [x_j'] dot [x_j] = [x_j' x_j] = Lambda
            ) ==> [x_j], [x_j'] space #[--- обратимые(?)] \
            [a_1 ... a_n]^(-1) =  ([a_1] dot ... dot [a_n])^(-1) = [a_n]^(-1) dot ... dot [a_1]^(-1)
        $
]

#notice[
    В каждом классе есть ровно одно несократимое слово.
]

#denote[
    $f_j = [x_j]$, $j = 1, ..., k$.
]

#pr[
    $F$ --- свободная группа с $k$ образующими: $f_1, ..., f_k$.
]

#proof[
    $G$ --- группа; $g_1, ..., g_k in G$. Необходимо проверить существование. Построим отображение
    $
        phi: F &--> G: \ 
        [x_j] &maps g_j \
        [x_j'] &maps g_j^(-1) \
        [a_1 ... a_n] &maps phi([a_1]) ... phi([a_n])
    $

    Проверка корректности:
    - Пусть мы сделали вставку $L R ~~> L x_j x_j' R$ или $L x_j' x_j R$ 
    $
        phi([L x_j x_j' R]) = underbrace(..., phi(L)) = phi([x_j]) phi([x_j']) = underbrace(..., phi(R)) = phi([L R])
    $
]
 
#notice(name: "пояснение (никто не в курсе что тут происходит, но это относится к доказательству)")[
    #todo("разобраться")
    $
        Phi: W &--> G\
        x_j &maps g_j\
        x_j' &maps g_j^(-1)\ 
        a_1 ... a_n &maps Phi(a_1) ... Phi(a_n)
    $

    $
        w &~~> w'\
        Phi(w) &= Phi(w')
    $
    // что-то проверяем
    $
        Phi(x_j) Phi(x_j') = g_j g_j' = e\
        w sim w' ==> Phi(w) = Phi(w')
    $
    
    #import "../../utils/cd/cd.typ": *
    
    #align(center)[#commutative_diagram(
        node((0, 0), $W$),
        node((0, 1), $W fg ~$),
        node((1, 1), $G$),
        arr((0, 0), (0, 1), $$),
        arr((0, 0), (1, 1), $Phi$),
        arr((0, 1), (1, 1), $phi$, "dashed"),
    )]

    
    $
        exists! phi: F --> G: phi([w]) = Phi(w) space forall w in W \
        \
        phi(f_j) = phi([x_j]) = Phi(x_j) = g_j\
        Phi(w_1 w_2) = Phi(w_1) Phi(w_2) space forall w_1, w_2 in W ==> \
        ==> phi([w_1])phi([w_2]) = phi([w_1][w_2])
    $  // тут видимо существование доказывают

    // тут единственность
    $
        phi_1, phi_2: F --> G space #[ --- гомоморфизм] \
        phi_1(f_j) = phi_2(f_j) = g_j
    $
    Но $ 
        forall h in F: h = [...] = f_(i_1)^(plus.minus 1) ... f_(i_n)^(plus.minus 1) ==> \
        phi_1(h_1) = phi_1(f_(i_1))^(plus.minus 1) ... space phi_1(f_(i_n))^(plus.minus 1) = phi_2(f_(i_1))^(plus.minus 1) ... space phi_2(f_(i_n))^(plus.minus 1) = phi_2(h)
    $
]

#notice[
    Видим, что $gen(f_1, ..., f_k) = F$.
]

#follow[
    Пусть $G = gen(g_1, ..., g_k)$, F --- свободная группа с $k$ свободными образующими. Тогда $G iso F fg H$ для некоторых $H nsubg F$.
]

#proof[
    $
        exists phi: F &--> G #[--- гомоморфизм]\
        f_k &maps g_k
    $

    $g_1, ..., g_k in Im phi < G ==> Im phi supset gen(g_1, ..., g_k) = G$, то есть $Im phi = G$.

    По теореме о гомоморфизме 
    $
        G = Im phi &iso F fg H \
        H &= ker phi
    $
]

// опасно, не раскомментировать
// это просто пример следствия, ну ладно, пофиг
// #examples[
//     + Возьмем $ZZ times ZZ = gen((1, 0), (0, 1))$ и $D_5 = gen(R, S)$ (группа симметрий пятиугольника)
//          $G = gen(x, y) = x^(alpha_1) y^(beta_1) ... x^(alpha_s) y^(beta_s)$
// ] 
// тяжело.....

// анекдот:
// сидят две блондинки в поезде, разговаривают.
// Зашла речь про авиакатастрофы. Тут одна говорит:
// - что мы все про самолеты, да про самолеты. С поездами тоже аварии бывают. Вот например однажды в поезд самолет врезался
