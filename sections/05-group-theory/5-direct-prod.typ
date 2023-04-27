#import "../../utils/core.typ": *

== Прямые произведения


#def[
    Пусть $H_1, H_2$ --- подгруппы $G$, гововрят, что $G$ расскладывается в _прямое произведение_ $H_1$ и $H_2$, если:
    + $G = H_1 H_2$
    + $H_1 sect H_2 = {e}$
    + $forall h_1 in H_1 space forall h_2 in H_2: h_1 h_2 = h_2 h_1$
]

#example[
    Рассмотрим $G = C^*$, $H_1 = TT$, $H_2 = RR^*_+$ Тогда $G$ --- прямое произведение $H_1$ и $H_2$.
]

#props[
    Условия 1 и 2 можно заменить на условие ($12$)
    $ forall g in G space exists! h_1 in H_1, space h_2 in H_2: g = h_1 h_2 $
]

#proof[
    - "$1 space \& space 2 ==> 12$": $h_1 h_2 = h_1' h_2' ==> underbrace((h_1')^(-1)h_1, in H_1) = underbrace(h_2' (h_2)^(-1), in H_2) = e$
    
    - "$12 ==> 1 space \& space 2$": Пусть $h in H_1 sect H_2$. Тогда $h = h e = e h ==> h = e.$
]
