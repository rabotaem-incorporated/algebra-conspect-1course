#import "../../utils/core.typ": *

== Свойства степени

#pr[
    $f, g in R[x], space deg f = m, space deg g = n$

    + #[
        $deg(f + g) <= max(m, n)$

        При этом: $m eq.not n ==> deg(f + g) = max(m, n)$
    ] 
    
    + $deg(f g) <= m + n$
]

#proof[
    + #[
            $f = limits(sum)_(i = 0)^m a_i X^i, space g = limits(sum)_(i = 0)^n b_i X^i, space d = max(m, n)$
        
        $f = limits(sum)_(i = 0)^d a_i X^i, space g = limits(sum)_(i = 0)^d b_i X^i$

        $f + g = limits(sum)_(i = 0)^d (a_i + b_i) X^i ==> deg(f + g) <= d$

        $m eq.not n ==> display(cases(
            a_d = 0,
            b_d eq.not 0
        ))$ или $display(cases(
            a_d eq.not 0,
            b_d = 0
        )) ==> a_d + b_d eq.not 0 ==> deg(f + g) = d$
    ]

    + $( limits(sum)_(i = 0)^m a_i X^i ) ( limits(sum)_(j = 0)^n b_j X^j ) = a_0 b_0 + (a_0 b_1 + a_1 b_0)X + ... + a_m b_n X^(m + n) ==> deg f g <= m + n$
]

#notice[
    $deg f g < m + n$, если $a_m eq.not 0$ или $b_n eq.not 0$ и $a_m b_n = 0$
]

#notice[
    Будем считать, что $deg 0 = -oo$
]

#def[
    _Область целостности_ (целостное кольцо, область) --- коммутативное ассоциативное кольцо с $1 eq.not 0$ и без делителей нуля (то есть никакие два ненулевых элемента не дают ноль при умножении)
]

#pr[
    Пусть $R$ --- область целостности. 

    + $forall f,g in R[x]: deg(f g) = deg f + deg g$
    
    + $R[x]$ --- область целостности
]

#proof[
        + В предыдущем доказательстве $display(cases(
            a_m eq.not 0,
            b_n eq.not 0
        )) ==> a_m b_n eq.not 0 ==> deg(f g) = m + n$

        + $f eq.not 0 ==> deg f >= 0, space g eq.not 0 ==> deg g >= 0 ==> deg(f g) >= 0 ==> f g eq.not 0$
]

#follow[
    Пусть $R$ --- область целостности: тогда $R[x]^* = R^*$
]

#proof[\
    "$supset$": очевидно $R^* subset R[x]^*$

    "$subset$": пусть $f in R[x]^* ==> exists g in R[x]: f dot g = 1$

    $deg(f g) = 0 = deg f + deg g ==> deg f = deg g = 0 ==> f in R ==> f in R^*$
]

#examples[
    + $ZZ[x]^* = \{plus.minus 1\}$
    
    + $RR[x]^* = RR without \{0\}$

    + $(factor(ZZ, 4 ZZ))[x]^*$ --- бесконечное множество
]

#exercise[
    $R[[x]]^* = \{ limits(sum)_(i = 0)^(oo) a_i X^i divides a_0 in R^*\}$    
]
