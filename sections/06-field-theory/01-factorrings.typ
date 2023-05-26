#import "../../utils/core.typ": *

== Факторкольца и гомоморфизмы колец

#notice[
    $R$ --- кольцо (ассоциативное, коммутативное, с единицей)\
    $I$ --- идеал, то есть $I$ подгруппа в $R$ и $R I subset I$

    $R fg I$ --- факторгруппа, причем $(a + I) (b + I) = a b + I$. Покажем корректность умножения.

    $
        a' in a + I, b' in b + I, <==> \
        a' = a + lambda, lambda in I, b' = b + mu, mu in I. \

        a' b' = a b + lambda b + a mu + lambda mu in a b + I.
    $
    
    Заметим, что $R fg I$ --- кольцo.
]

#def[
    Такие кольца называют _факторкольцами_ по идеалу $I$. Обозначается $R fg I$.
]

#pr[
    $R$ --- область главных идеалов, $p in R$, $p != 0$. Тогда $R fg (p)$ --- поле тогда и только тогда, когда $p$ неприводимый.
]

#proof[
    - "$==>$": 
    + $p in R^* ==> (p) = R ==> R fg (p) = {0}$ --- не поле. 
    + $p = a b ==>$ в $R fg (p)$
    $
        overline(a b) = overline(0)\
        overline(a) dot overline(b) ==> cases(delim: "[", overline(a) = 0, overline(b) = 0) ==> cases(delim: "[", p divides a\, space a = p c, p divides b)\
        p = p c b, space c b = 1, space b in R^*
    $
    - "$<==$": Пусть $p$ --- неприводим. Требуется доказать следующие утверждения:
        + В $R fg (p)$ выполнено $0 != 1$.
            $ 0 = 1 ==> 1 in 0 + (p) = (p) ==> p in R^* $
        + $overline(a) != 0 ==> overline(a) in (R fg (p))^*$
            $ 
                p divides.not a &==> (p, a) = 1 ==> \
                &==> p b + a c = 1 "для некоторых" b, c in R ==> \
                &==> 0 overline(b) + overline(a) overline(c) = 1 ==> \
                &==> overline(a) in (R fg (p))^*
            $
]

#notice[
    $R fg I$ --- поле $<==>$ $I$ --- максимальный идеал в $R$ (максимальный идеал - всякий идеал, не содержащийся ни в каком другом идеале)
]

#example[
    + $RR[x] fg (x^2 + 1) = CC$
    + $QQ[x] fg (x^3 - 2)$
    + $FF_2[x] fg (x^2 + x + 1)$
]

#def[
    Пусть $R$, $S$ --- кольца. $f: R --> S$ --- гомоморфизм колец, если
    + $f(a + b) = f(a) + f(b)$.
    + $f(a b) = f(a) f(b)$.
    + $f(1_R) = 1_S$.
]

#th(name: "О гомоморфизме для колец")[
    Пусть $phi: R --> S$ --- гомоморфизм колец. Тогда:
    + $Ker phi$ --- идеал в $R$,
    + $Im phi$ --- подкольцо в $S$,
    + Существует изоморфизм
        $
            R fg Ker phi  &-->  Im phi\
            r + Ker phi &maps phi(r)
        $
]

#let ol = math.overline

#proof[
    Знаем, что существует изоморфизм групп, действующий как в пункте 3.

    Надо проверить, что такой изоморфизм сохраняет умножение:
    $
        ol(phi)(ol(a) ol(b)) = ol(phi)(ol(a b)) = phi(a b) = phi(a) phi(b) = ol(phi)(ol(a)) ol(phi)(ol(b)), \
        ol(phi)(ol(1_R)) = phi(1_R) = 1_S = 1_(Im phi).
    $
]

#follow[
    Пусть $F$ --- поле, $R$ --- ненулевое кольцо. $phi: F --> R$ --- гомоморфизм. Тогда $phi$ инъективен.
]

#proof[
    $R != 0 ==> 1_R != 0_R$\
    Рассмотрим $Ker phi$ --- идеал в $F$, но в поле есть всего 2 идеала. Поэтому либо $Ker phi = 0$, либо $Ker phi = F$.
    Если $Ker phi = F$, то $phi(1_F) = 0_R$, но она должна переходить в $1_R$, поэтому этот случай не реализуется. Из $Ker phi = 0$ следует инъективность.
]

#notice[
    Так $phi$ --- всегда инъекция, о _"гомоморфизме полей"_ не говорят. Имеет место понятие _"вложения поля"_.
]