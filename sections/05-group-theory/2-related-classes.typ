#import "../../utils/core.typ": *

== Смежные классы

#ticket(step-fn: x => x + 2)[Левые и правые смежные классы. Индекс подгруппы]

#denote[
    Пусть $H < G$.

    Будем писать $g_1 sim g_2$ для $g_1, g_2 in G$, если $g_2 = g_1 h$, где $h in H$. Равносильно, если $g_1^(-1) g_2 in H$.
]

#lemma[
    $sim$ --- отношение эквивалентности на $G$
]

#proof[
    + $g = g e, e in H$
    + $g_2 = g_1 mul h ==> g_1 = g_2 mul h^(-1), h^(-1) in H$
    + $g_2 = g_1 h, space g_3 = g_2 h', space h, h' in H$. Тогда
        $g_3 = g_1 underbrace(h h', in H)$
]

#def[
    Класс эквивалентности по $sim$, содержащий элемент $g in G$ называется _левым смежным классом $g$ по подгруппе $H$_, или _левым классом смежности $g$ по подгруппе $H$_:
    $ {g' bar g' sim g} = {g h bar h in H} = g H $

    Аналогично определяются правые смежные классы.
    Множество левых смежных классов $G$ по $H$: $G fg H$,
    множество правых смежных классов $G$ по $H$: $G \\ H$.
]

#example[
    Пусть $G = S_3$, $H = gen((1 2)) = {e, (1 2)}$.

    $
        G fg H = { e H, (1 3)H, (2 3)H } = { H, {(1 3), (1 2 3)}, {(2 3), (1 3 2)} } \
        H \\ G = { H e, H(1 3), H(2 3) } = { H, {(1 3), (1 3 2)}, {(2 3), (1 2 3)} }
    $
]

#def[
    _Индексом_ подгруппы $G$ называют $(G : H) = abs(G fg H)$
]

#example[
    + $(S_3 : gen((1 2))) = 3$.
    + $(ZZ : n ZZ) = n$, для $n in NN$.
]

#pr[
    Существует биекция:
    $
        G fg H &limits(-->)^(alpha) H \\ G \
        M &maps M^(-1) 
    $
    Это означает, что $abs(G fg H) = abs(H \\ G)$, поэтому "левый" и "правый" индексы подгруппы --- одно и тоже.
]

#proof[
    $M = g H$
    $ M^(-1) = {(g h)^(-1) bar h in H} = {h^(-1)g^(-1) bar h in H} = H^(-1)g^(-1) = H g^(-1) $
    
    Рассмотрим отображение $beta$:
    $ 
        H \\ G &limits(-->)^(beta) G fg H\
        M &maps M^(-1)\
    $ тогда: $
        beta compose alpha = id_(G fg H), space alpha compose beta = id_(H \\ G)
    $
]

#ticket[Теорема Лагранжа и следствия из неё]

#denote[
    Если $G$ конечная группа, то будем на это указывать так: $abs(G) < oo$.
]

#th(name: [Лагранжа])[
    Пусть $abs(G) < oo$, $H < G$. Тогда 
    $
        abs(G) = abs(H) mul (G : H).
    $
]

#proof[
    $ abs(G) = limits(sum)_(M in G fg H) abs(M) = (G : H) abs(H). $
    Пояснение: $ M = g H, space H &--> g H space #[--- биекция] \ h &maps g h $ 
    $ g h_1 = g h_2 ==> h_1 = h_2 ==> abs(M) = abs(H) $
]

#follow(plural: true)[
    + Если $abs(G) < oo$ и $H < G$, то $abs(G) dots.v abs(H)$.
    
    + Если $abs(G) < oo$ и $g in G$, то $abs(G) dots.v abs(gen(g))$.
    
    + Если $abs(G) < oo$ и $g in G$, то $g^(abs(G)) = e$.
    
    + #[
        Теорема Эйлера.

        Пусть $(a, m) = 1, m in NN, a in ZZ$. Тогда 
        $
            a^(phi(m)) equiv(m) 1.
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
        $ord(g) bar p, ord g != 1 ==> ord g = p ==> abs(gen(g)) = p ==> gen(g) = G$
    ]
]
