#import "../../utils/core.typ": *

== Деление с остатком

#th(name: [о делении с остатком для многочленов])[

    $R$ --- область целостности.
    
    Пусть $f, g in R[x], space g eq.not 0$ и старший коэффициент $g$ обратим.

    Тогда $exists! space q, r in R[x]$:

    + $f = g q + r$

    + $deg r < deg g$
]

#proof[
    Пусть $deg g = d, space g = b_d X^d + ...$

    + "Существование" #[

        Индукция по $deg f: space deg f < d ==>$ подходит $q = 0, r = f$

        Пусть $deg f = n >= d$

        $f_1 = f - g dot a_n dot b_d^(-1) dot X^(n - d)$, где $b_d$ --- старший коэффициент $g$ (на первый взгляд здесь написано что-то неочевидное, но на деле это простое деление многочленов столбиком, то есть мы просто делаем так, чтобы старший коэффициент $f$ исчез)

        $g dot a_n dot b_d^(-1) dot X^(n-d) = (b_d X^d + ...) dot a_n dot b_d^(-1) dot X^(n-d) = a_n X^n + ... ==> deg f_1 < n$

        По индукционному предположению $exists q_1, r_1 in R[x]$ такие, что:

        + $f_1 = g q_1 + r_1$
        + $deg r_1 < d$

        $f = g dot a_n dot b_d^(-1) dot X^(n - d) + f_1 = g underbrace((a_n dot b_d^(-1) dot X^(n - d) + q_1), q) + underbrace(r_1, r)$
    ]

    + "Единственность" #[

        Предположим $f = g dot q_1 + r_1 = g dot q_2 + r_2, space deg r_1 < d, space  deg r_2 < d$ 
        
        $g(q_1 - q_2) = r_2 - r_1$

        Предположим $q_1 eq.not q_2 ==> deg g dot (q_1 - q_2) limits(=)^(#[$R$ --- ОЦ]) underbrace(deg g, d) + underbrace(deg q_1 - q_2, >= 0) >= d ==> deg(r_2 - r_1) >= d$, но $deg(r_2 - r_1) < d$, противоречие.
    ]
]

#notice[
    Условие $R$ --- область целостности не существенно.

    (я без понятия что написано дальше, но пускай будет)

    $g = b_d X^d + ..., space b_d in R^*$

    $b_d dot a = 0 ==> b_d^(-1)(b_d a) = 0 ==> a = 0$ (что это значит?)
]
