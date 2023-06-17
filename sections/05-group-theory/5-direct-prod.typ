#import "../../utils/core.typ": *

== Прямые произведения

#ticket[Внутреннее прямое произведение подгрупп]

#def[
    Пусть $H_1, H_2$ --- подгруппы $G$, говоdрят, что $G$ расскладывается во _внутреннее прямое произведение_ $H_1$ и $H_2$, если:
    + $G = H_1 H_2$
    + $H_1 sect H_2 = {e}$
    + $forall h_1 in H_1 space forall h_2 in H_2: h_1 h_2 = h_2 h_1$
    Обозначается $G = H_1 times H_2$.
]

#denote[
    $TT$ --- группа комплексных чисел с модулем 1 (aka окружности с радиусом 1).
]

#example[
    Рассмотрим $G = CC^*$, $H_1 = TT$, $H_2 = RR^*_+$ Тогда $G$ --- прямое произведение $H_1$ и $H_2$.
]

#pr[
    Условия 1 и 2 можно заменить на условие ($12$)
    $ forall g in G space exists! h_1 in H_1, space h_2 in H_2: g = h_1 h_2 $
]

#proof[
    - "$1 space \& space 2 ==> 12$": $h_1 h_2 = h_1' h_2' ==> underbrace((h_1')^(-1)h_1, in H_1) = underbrace(h_2' (h_2)^(-1), in H_2) = e$
    
    - "$12 ==> 1 space \& space 2$": Пусть $h in H_1 sect H_2$. Тогда $h = h e = e h ==> h = e.$
]

#notice[
    Условие 3) можно заменить на 
    $
        cases(
            H_1 nsubg G,
            H_2 nsubg G,
        )
    $
]

#proof[
    - "$==>$": Рассмотрим $h in H_1$, $g in G$, $g = h_1 h_2$, где $h_1 in H_1$ и $h_2 in H_2$. Тогда
    $
        g h g^(-1) &= h_1 h_2 h h_2^(-1) h_1^(-1) = \
        &= h_1 h h_2 h_2^(-1) h_1 \
        &= h_1 h h_1^(-1) in H_1.
    $
 
    
    - "$<==$": Пусть $h_1 in H, h_2 in H_2$
    $
        h_1 h_2 h_1^(-1) h_2^(-1) in H_2 sect H_1 = {e}, #[где $h_1 h_2 h_1^(-1) in H_2, space h_2 h_1 ^(-1) h_2 ^(-1) in H_1$]
    $
]

#example[
    $G = CC^*, H_1 = TT, H_2 = RR_+^*$, тогда:

    $ CC^* = TT RR_+^*, TT sect RR_+^* = \{1\} $
]

#ticket[Внешнее прямое произведение групп, связь с внутренним прямым
произведением]

#def[
    Пусть $G_1, G_2$ --- группы, на их декартовом произведении $G_1 times G_2$ введем умножение:
    $(g_1, g_2) dot (g_1', g_2') = (g_1 g_1', g_2g_2')$
    
    Получили структуру группы. Она называется _внешним прямым произведением_ $G_1$ и $G_2$. 
]

#pr[
    Пусть $G$ --- внутреннее прямое произведение подгрупп $H_1$ и $H_2$. Тогда если рассмотреть 

    $
        phi: H_1 times H_2 &--> G \
        (h_1, h_2) &maps h_1 h_2
    $

    Тогда такое преобразование $phi$ --- изоморфизм.
]

#proof[
    - То, что $phi$ --- сюръекция, равносильно 
        $
            forall g: exists h_1 in H_1, h_2 in H_2: g = h_1 h_2
        $ 
    
    - $phi$ --- инъекция тогда и только тогда, когда такие $h_1$ и $h_2$ единственны.

    - Остается проверить, что $phi$ --- гомоморфизм.
        $
            phi((h_1, h_2) dot (h_1', h_2'))
            &= phi(h_1 h_1', h_2 h_2') = \
            &= h_1 h_1' h_2 h_2' = h_1 h_2 dot h_1' h_2' =\
            &= phi((h_1, h_2)) dot phi((h_1', h_2))
        $
]

#def[
    Пусть $forall g quad exists! h_1 in H_1, h_2 in H_2: g = h_1 h_2$, $H_1 nsubg G$. Тогда $G$ называется _полупрямым произведением_ $H_1$ и $H_2$.

    Обозначается $G = H_1 times.three.l H_2$, (если $H_1 nsubg G$) или $G = H_1 times.three.r H_2$, (если $H_2 nsubg G$) и $G = H_1 times H_2$, (если выполняется оба условия $<==>$ произведение прямое). 
]

#examples[
    + Рассмотрим группу ${phi : RR --> RR bar phi(x) = a x + b, a != b}$\
        В качестве $H_1$ возьмем ${phi bar phi(x) = a x} < G$, $H_2 = {phi bar phi(x) = x + b} nsubg G$
    + $G = S_n, space H_1 = A_n, space H_2 = gen((12))$
]

#notice[
    Аналогично определяются прямые произведения нескольких сомножителей.
    Стоит лишь обратить внимание на свойство 2. Достаточно, чтобы 
    $
        forall i : H_i sect H_1 ... hat(H_i) ... H_n = {e}.
    $
    Это более сильное условие, чем для пересечения каждой пары. Например, если рассмотреть подпространства $RR^2$ с базисами $vec(0, 1)$, $vec(1, 0)$ и $vec(1, 1)$, то они не будут образовывать прямое произведение.
]
