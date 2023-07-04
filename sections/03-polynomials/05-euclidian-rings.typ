#import "../../utils/core.typ": *

== Евклидовы области

#def[
    _Евклидовой областью целостности_ (_евклидовой областью_, _евклидовым кольцом_) называется область целостности $R$, 
    для которой существует функция $nu: R without \{0\} -> ZZ_(>= 0)$, называемая _евклидовой нормой_, такая что:

    + Если $d divides a$, то $nu(d) <= nu(a)$, причем $nu(d) = nu(a) <==> d sim a$.
    + Для любых $a, b in R, space b eq.not 0$: существует представление $a = b q + r$, где $r = 0$ или $nu(r) < nu(b)$.

    _Замечание_: свойство один можно убрать, но доказательства будут сложнее.
]

#examples[

        + $R = K[x]$, ($K$ --- поле), где $nu(P) = deg P$

        + $R = ZZ$, где $nu(a) = abs(a)$
        
        + $R = ZZ[i] = \{ a + b i divides a,b in ZZ \}$, где $nu(a + b i) = a^2 + b^2$ 
        (подробнее в книжке Аейрленд, Роузен - "Классическое введение в современную теорию чисел")
        
        + #[
            $R = K[[x]]$, ($K$ --- поле)
        
            $R^* = \{ a_0 + a_1 x + a_2 x + ... divides a_0 eq.not 0 \}$

            $ord f =  min \{ j divides a_j eq.not 0 \}$

            $f = x^(ord f) dot (a_j + a_(j + 1)x + ...) sim x^(ord f)$ 

            Докажите, что это евклидова область.
        ]

        + #[
            $R = ZZ_((5)) = \{ (a)/(b) divides a, b in ZZ, space 5 divides.not b \}$
        
            Докажите, что это евклидова область.
        ]
]

#lemma[
    Пусть $R$ --- область целостности, $a, b in R$. Тогда $a sim b <==> a = epsilon b, space epsilon in R^*$
]

#proof[

    "$arrow.l.double$":

    Пусть $a = epsilon b ==> b$. Так как $epsilon$ --- обратим, $b = epsilon^(-1) a$. 
    $ 
        cases(
            a = epsilon b ==> a divides b,
            b = epsilon^(-1) a ==> b divides a
        ) <==> a sim b        
     $
    "$arrow.r.double$": 
    $ 
        a sim b ==> display(cases(
            a divides b,
            b divides a
        )) ==> display(cases(
            b = epsilon a,
            a = epsilon' b
        )) ==> b = epsilon epsilon' b ==> (epsilon epsilon' - 1) b = 0 ==> epsilon #[--- обратим].
     $
]

#def[    
    $R$ --- коммутативное кольцо, $I subset R$ называется _идеалом_ в $R$, если:

    + $I eq.not empty$
    
    + $forall a, b in I: a + b in I$
    
    + $forall a in I space forall b in R: a b in I$
]

#examples[
    + $R = ZZ, space I = 2ZZ$
    
    + $R = K[X], space I = \{ f in R divides f(0) = 0 \}$
    
    + $R = C[0, 1]$\ (непрерывные функции на отрезке [0, 1]), $ space I = \{ f in R divides f(0) = 0 \}$
]

#def[
    Пусть $R$ --- коммутативное кольцо, $r in R$.
    Из свойств кольца очевидно, что $angle.l r angle.r harpoons.rtlb  (r) harpoons.rtlb \{ r s divides s in R \}$ --- идеал в $R$.

    Тогда $(r)$ называется _главным идеалом_ порожденным элементом $r$.
]

#notice[
    $(r) = (r') <==> r sim r'$
]

#example[
    Пример неглавного идеала:
    $ 
        R = ZZ[X], space I = \{ f : 2 divides f(0) \}
     $
    Это множество всех многочленов, у которых свободный член четный.
]

#pr[
    В евклидовой области все идеалы главные.
]

#proof[
    Пусть $I$ --- идеал в евклидовой области $R$.

    Случай $I = \{0\}$ --- тривиален, тогда $I = (0)$. Пусть $I eq.not \{0\}$.

    Зафиксируем норму $nu$ и рассмотрим $c in I$ с минимальной нормой. Докажем, что $I = (c)$.

    "$supset$":
    
    Так как для любого $b in R$ должно быть выполнено $c b in I$, то $I supset (c)$.
    
    "$subset$":

    Предположим, $exists a in I without (c)$. Представим евклидову норму в виде $a = c q + r$, $q, r in R$.
    Если $r = 0$, то $a in (c)$ по определению главного идеала. Но иначе $nu(r) < nu(c)$.
    Выразим $r$:
    $ 
        r = a - c q = a + c(-q).
    $ 
    Так как $c in I$ и $a in I$, то и $c(-q) in I$, следовательно $r in I$.
    Но $nu(r) < nu(c)$, что противоречит минимальности нормы $nu(c)$
]

#def[   
    Область целостности, в которых все идеалы главные, называется _областью главных идеалов (ОГИ)_.
]

#pr[
    Пусть $R$ --- область главных идеалов. Тогда:

    + $a, b in R ==>$ у $a$ и $b$ существует наибольший общий делитель
    
    + Если $d$ --- наибольший общий делитель $a$ и $b$, то $d = a m + b n, space m, n in R$
]

#proof[
    
    Можно считать $a eq.not 0$ или $b eq.not 0$, если $a = b = 0$, то $d = 0$ подходит, $d eq.not 0$ не подходит.

    + #[
        Рассмотрим множество $I = \{ a m + b n divides m, n in R \}$ --- идеал в $R$. Тогда можно записать $I = (d)$, так как $I$ --- область главных идеалов. 
    
        Заметим, что $d$ --- общий делитель $a$ и $b$. 
        $ 
            display(cases(
                a = a dot 1 + b dot 0 in I = (d),
                b = a dot 0 + b dot 1 in I = (d)
            )) ==> display(cases(
                d divides a,
                d divides b
            ))
        $
        Покажем, что $d$ --- наибольший общий делитель $a$ и $b$.
        То есть, что 
        $ 
            display(cases(
                d' divides a,
                d' divides b
            )) limits(==>)^((!)) d' divides d
        $
        Так как $d in I$, $d = a m_0 + b n_0, space m_0, n_0 in R$.
        $ 
            display(cases(
                d' divides a,
                d' divides b
            )) ==> display(cases(
                d' divides a m_0,
                d' divides b n_0
            )) ==> d' divides d.
        $
        Что и требовалось доказать.
    ]

    + #[
        Если $d'$ --- наибольший общий делитель $a$ и $b$, то:
        $ 
            d' sim d in I ==> d' in I ==> d' = a m + b n, space m, n in R.
        $
    ]
]

#notice[
    Наибольший общий делитель в ОГИ обозначают $(a, b)$.
]

#def[
    Элементы  ОГИ $a$ и $b$ называют _взаимно простыми_, если $(a, b) = 1$.
]

#pr[
    $(a, b) = 1 <==> m, n in R: a m + b n = 1$
]

#proof[

    "$arrow.r.double$": Из предыдущего предложения

    "$arrow.l.double$": $exists m,n in R: a m + b n = 1$ 
    
    Пусть $d = (a, b) ==> d divides a, d divides b ==> d divides (a m + b n) ==> d divides 1 ==> d sim 1 ==> (a, b) = 1$
]
