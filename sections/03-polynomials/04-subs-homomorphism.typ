#import "../../utils/core.typ": *

== Гомоморфизм подстановки

#def[
    Пусть $R, S$ --- кольца. Гомоморфизм из кольца $R$ в кольцо $S$ называется отображение $phi: R -> S$, такое что:

    + $phi(a + b) = phi(a) + phi(b)$, $forall a, b in R$;
    
    + $phi(a b) = phi(a) phi(b)$
    
    + $phi(1_R) = 1_S$
]

#pr(name: [свойства гомоморфизма])[
    + $phi(0_R) = 0_S$
    
    + $forall a in R: phi(-a) = -phi(a)$
    
    + $forall a, b in R: phi(a - b) = phi(a) - phi(b)$ 
]

#proof[
    + $0_R = 0_R + 0_R ==> phi(0_R) = phi(0_R) + phi(0_R)\ ==> underbrace(phi(0_R) + (-phi(0_R)), 0_S) = phi(0_R) + underbrace(phi(0_R) + (-phi(0_R)), 0_S)\ ==> 0_S = phi(0_R) + 0_S ==> phi(0_R) = 0_S$

    + $a + (-a) = 0_R ==> phi(a) + phi(-a) = phi(0_R) = 0_S ==> phi(-a) = -phi(a)$
    
    + $phi(a - b) = phi(a) + phi(-b) = phi(a) - phi(b)$
]

#def[
    Пусть $S$ --- кольцо, $R subset S$. $R$ называется подкольцом $S$, если:

    + $forall a, b in R: a - b in R$
    
    + $forall a, b in R: a b in R$
    
    + $1_S in R$
]

#notice[
    Этих условий достаточно (остальные выражаются)

    $1 in R ==> 0 = 1 - 1 in R$

    $a in R ==> -a = 0 + (-a) = 0 - a in R$

    $a, b in R ==> a + (-(-b)) = a - (-b) in R$
    
]

#examples[
    + Пусть $R$ --- подкольцо в $S$. Тогда $i_R: R -> S$ --- гомоморфизм, $a maps a$.
    
    + $ZZ -> factor(ZZ, n ZZ)$ --- гомоморфизм, $a maps overline(a)$
    
    + $CC -> CC$ --- гомоморфизм, $z maps overline(z)$
]

#th[
    Пусть $B$ --- кольцо, $A$ --- подкольцо такое что, $forall a in A space forall b in B: a b = b a$
    
    Зафиксируем $b in B$. Тогда отображение $phi_b: A[x] -> A[b]$

    $a_n X^n + ... + a_1X + a_0 maps a_n b^n + ... + a_1 b + a_0$ является гомоморфизмом колец.

    (Смысл этой теоремы в том, что подставить элементы надкольца в сумму/произведение многочленов, это тоже самое, что подставить элементы надкольца в многочлены, а потом сложить/умножить)
]

#proof[

    Если $f = a_n X^n + ... + a_1 X + a_0$, то $f(b) = a_n b^n + ... + a_1 b + a_0 = phi_b(f)$

    Нужно проверить: $(f + g)(b) = f(b) + g(b)$ и $(f g)(b) = f(b) g(b)$

    $1(b) = 1$ --- тривиально

    $(f + g)(b) = f(b) + g(b)$ --- очевидно из определения $f + g$.

    Осталось проверить, что $(f g)(b) = f(b) g(b)$:

    $f = limits(sum)_(i = 0)^n a_i X^i, space  g = limits(sum)_(i = 0)^m c_i X^i$

    $f g = limits(sum)_(k = 0)^(n + m) d_k X^k, space  d_k = limits(sum)_(i + j = k) a_i c_j$

    $(f g)(b) = limits(sum)_(k=0)^(n + m) d_k b^k$

    $f(b) g(b) = ( limits(sum)_(i = 0)^n a_i b^i ) ( limits(sum)_(j = 0)^m c_j b^j ) = limits(sum)_(i = 0)^n limits(sum)_(j = 0)^m a_i b^i c_j b^j limits(=)^("коммут.")$ 
    
    $limits(sum)_(i = 0)^n limits(sum)_(j = 0)^m a_i c_j b^(i + j) = limits(sum)_(k = 0)^(n + m) underbrace((limits(sum)_(i, j >= 0, space  i + j = k) (a_i c_j)), d_k) b^k = (f g)(b)$
]

#examples[
        + #[
            $A$ --- любое коммутативное кольцо, $B = A[x]$
        
            $A$ --- подкольцо в $B = A[x] ==>$ можно рассмотреть $f(g)$, где $f, g in A[x]$
        ] 
        
        + #[
            $RR[x] limits(-->)^(phi) RR[x]$, $f maps f(5)$
        
            $Im phi = RR eq.not RR[x]$
        ]

        + #[
            $A -> A$
        
            $f limits(maps)^(alpha) f(x_2, x_3, x_4, ...)$ --- инъективный, но не сюръективный 

            $f limits(maps)^(beta) f(0, x_1, x_2, x_3, ...)$ --- сюръективный, но не инъективный
        ]
]

#exercise[
    + Найти все автоморфизмы $QQ$
    
    + Найти все автоморфизмы $RR$
    
    + Найти все автоморфизмы $RR[x]$
]

#th(name: [Безу])[

    Пусть $f in R[X], space  c in R$. Тогда остаток при делении $f$ на $X - c$ есть $f(c)$.    
]

#proof[
    $f = (X - c) dot q + r$, по теореме о делении с остатком $deg r < deg (X - c) = 1 ==>$
    
    $f(c) = (c - c) dot q(c) + r(c) = r(c)$
]

#follow[    
    Пусть $f in R[X], space c in R$. Тогда $f(c) = 0 <==> (X - c) divides f$
]

#def[
    Пусть $R$ --- подкольцо $S$, элементы $R$ коммутируют с элементами $S$. Тогда $s in S$, такой что $f(s) = 0$, где $f in R[x]$ --- называется корнем из $f$ в $R$.
]

#example[
    $f = x^4 - 2$ в $ZZ[x]$
    
    $f$ не имеет корней в $ZZ$

    $f$ имеет $2$ корня в $RR$

    $f$ имеет $4$ корня в $CC$
]

#pr[
    Пусть $R$ -- область целостности, $f in R[x], space  deg f = d >= 0$. Тогда число корней $f$ в $R$ не превосходит $d$.
]

#proof[
    Индукция по $d$
    
    "База:" $d = 0 ==> f$ ненулевой $d ==>$ корней нет

    "Переход": $d > 0$

    У $f$ нет корней в $R ==>$ утверждение выполнено

    У $f$ есть корни в $R$, пусть $c in R$ --- какой-либо из корней $f$

    $f(c) = 0 ==> f = (X - c) dot g$, где $g in R[x]$

    $deg f = deg (X - c) + deg g ==> deg g = d - 1$

    Пусть $c_1, ..., c_l$ --- все корни $g$ в $R$

    По предположению индукции: $l <= d - 1$

    Утверждение: $\{c_1, ... c_l, c\}$ --- все корни $f$ в $R$

    $f(c_1) = ... = f(c_l) = f(c) = 0$

    Предположим $exists c' in.not \{c_1, ..., c_l, c\}$, такой что $f(c') = 0$

    $==> (c' - c) dot g(c') = 0$ --- противоречие с тем, что $R$ -- область целостности

    $==>$ у $f$ не более $l + 1 <= d$ корней в $R$.
]

#example[
    $x^2 - 1$ имеет $4$ корня в $factor(ZZ, 8 ZZ)$ или в $factor(ZZ, 5 ZZ)$
    $ 
        x^2 equiv_(77) 1 <==> display(cases(
            x^2 equiv_(7) 1,
            x^2 equiv_(11) 1
        )) <==> display(cases(
            x equiv_(7) 1 " или " x equiv_(7) -1,
            x equiv_(11) 1 " или " x equiv_(11) -1
        ))
     $
]

#pr(name: [формальное и функциональное равенство многочленов])[
    
    Пусть $R$ --- бесконечная область: $f, g in R[x]$ таковы, что $forall a in R: f(a) = g(a)$

    Тогда $f = g$
]

#proof[

    $h = f - g$, предположим, что $h eq.not 0 ==> deg h = d >= 0 ==>$ у $h$ есть $<= d$ корней.

    Но $forall a in R: h(a) = f(a) - g(a) = 0$, $R$ --- бесконечная область, противоречие. Так как их не больше чем $d$, но $R$ бесконечно.
]

#example[
    $R = factor(ZZ, 3 ZZ)$, $f = X, g = X^3$

    $forall A in ZZ: a^3 equiv_(3) a ==> forall alpha in factor(ZZ, 3 ZZ): f(alpha) = g(alpha)$
]
