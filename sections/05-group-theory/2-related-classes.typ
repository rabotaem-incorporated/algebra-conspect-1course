#import "../../utils/core.typ": *

== Смежные классы

#denote[
    Пусть $H < G$.

    Будем писать $g_1 ~ g_2$ для $g_1, g_2 in G$, если $g_2 = g_1 h$, где $h in H$. Равносильно, если $g_1^(-1) g_2 in H$.
]

#lemma[
    $~$ --- отношение эквивалентности на $G$
]

#proof[
    + $g = g e, e in H$
    + $g_2 = g_1 mul h ==> g_1 = g_2 mul h^(-1), h^(-1) in H$
    + $g_2 = g_1 h, space g_3 = g_2 h', space h, h' in H$. Тогда
        $g_3 = g_1 underbrace(h h', in H)$
]

#def[
    Класс эквивалентности по $~$, содержащий элемент $g in G$ называется _левым смежным классом $g$ по подгруппе $H$_, или _левым классом смежности $g$ по подгруппе $H$_:
    $ {g' bar g' ~ g} = {g h bar h in H} = g H $

    Аналогично определяются правые смежные классы.
    Множество левых смежных классов $G$ по $H$: $G \/ H$,
    множество правых смежных классов $G$ по $H$: $G \\ H$.
]

#example[
    Пусть $G = S_3$, $H = gen((1 2)) = {e, (1 2)}$.

    $
        G \/ H = { e H, (1 3)H, (2 3)H } = { H, {(1 3), (1 2 3)}, {(2 3), (1 3 2)} } \
        H \\ G = { H e, H(1 3), H(2 3) } = { H, {(1 3), (1 3 2)}, {(2 3), (1 2 3)} }
    $
]

#def[
    Индексом подгруппы $G$ называют $(G : H) = abs(G \/ H)$
]

#example[
    + $(S_3 : gen((1 2))) = 3$.
    + $(ZZ : n ZZ) = n$, для $n in NN$.
]

#props[
    Существует биекция:
    $
        G \/ H &limits(-->)^(alpha) H \\ G \
        M &maps M^(-1) 
    $
    Это означает, что $abs(G \/ H) = abs(H \\ G)$, поэтому "левый" и "правый" индексы подгруппы --- одно и тоже.
]

#proof[
    $M = g H$
    $ M^(-1) = {(g h)^(-1) bar h in H} = {h^(-1)g^(-1) bar h in H} = H^(-1)g^(-1) = H g^(-1) $
    
    Рассмотрим отображение $beta$:
    $ 
        H \\ G &limits(-->)^(beta) G \/ H
        M &maps M^(-1)

        beta compose alpha = id_(G \/ H),space alpha compose beta = id_(H \\ G)
    $
]

#th(name: [Лагранжа])[
    Пусть $abs(G) < infinity$, $H < G$. Тогда 
    $
        abs(G) = abs(H) mul (G : H).
    $
]

#proof[
    $ abs(G) = limits(sum)_(M in G \/ H) abs(M) = (G : H) abs(H) $.
    пояснение $ M = g H, space H &--> g H space #[--- биекция]\
    h &maps g h \ g h_1 = g h_2 ==> h_1 = h_2 ==> abs(M) = abs(H) $
]

#follow[
    + Если $abs(G) < infinity$ и $H < G$, то $abs(H) bar abs(G)$.
    
    + Если $abs(G) < infinity$ и $g in G$, то $ord g = abs(gen(g))$.
    
    + Если $abs(G) < infinity$ и $g in G$, то $g^(abs(G)) = e$.
    
    + #[
        Теорема Эйлера.

        Пусть $(a, m) = 1, m in NN, a in ZZ$. Тогда 
        $
            a^(phi(m)) ident 1 pmod(m).
        $
    ]

    + #[
        Пусть $abs(G) = p$ --- простое число. Тогда $G$ --- циклическая.
    ]
]

#proof[
    4. #[
        Можно рассмотреть циклическую подгруппу $gen(a)$, тогда $abs(gen(a)) = phi(m)$. По предыдущему следствию получаем то что надо.
    ]
    5. #[
        $g in G, space g != e$\
        $ord(g) bar p, ord g != 1 ==> ord g = p ==> abs(gen(g)) = p ==> gen(p) = G$
    ]
]
