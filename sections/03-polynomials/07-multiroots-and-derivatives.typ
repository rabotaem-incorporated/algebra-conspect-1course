#import "../../utils/core.typ": *

== Кратные корни и производные

#def[
    Пусть $f in R[x]$ и $f eq.not 0$. Пусть $a in R$ --- корень.

    $(X - a) divides f$ по теореме Безу.

    Наибольший $n$, такой что $(X - a)^n divides f$, называется _кратностью корня_ $a$. Можно заметить, что $n <= deg f$, поэтому он всегда существует.

    Корни кратности $1$ называются _простыми корнями_ $f$,

    корни кратности $<= 2$ называются _кратными корнями_ $f$,

    корни кратности $2$ --- _двойными_, $3$ --- _тройными_
]

#th[    Пусть $K$ поле, $f in K[X]$, $d = deg f > 0$

    $a_1, ..., a_s$ --- его корни, $n_1, ..., n_s$ --- их кратности.

    Тогда $n_1 + ... + n_s <= d$.
]

#proof[
    Разложим $f$ на неприводимые множители.

    $f = (X - a_1)^(m_1) ... (X - a_s)^(m_s) dot g$, где $g in K[x]$ и $(X - a_j)$ --- неприводимые множители.

    Заметим, что $(X - a_1) eq.not g, space  ..., space (X - a_s) eq.not g$.
    
    Считаем, что $m_1 <= n_1, space  ..., space  m_s <= n_s$. Предположим, при некотором $j$: $n_j > m_j ==>$

    $(X - a_j)^(m_j + 1) divides f ==> (X - a_j)^(m_j + 1) dot h = (X - a_1)^(m_1) ... (X - a_s)^(m_s) dot g ==>$
 
    $(X - a_j) dot h = (X - a_1)^(m_1) ... hat((X - a_j)^(m_j)) ... (X - a_s)^(m_s) dot g ==>$

    $(X - a_j) divides (X - a_1)^(m_1) ... hat((X - a_j)^(m_j)) ... (X - a_s)^(m_s) dot g ==>$
    
    Либо $(X - a_j) divides (X - a_i), space  i eq.not j$ или $(X - a_j) divides g$, но такого не может быть, значит $m_j = n_j, space  j = 1, ..., s$.

    Тогда $d = deg f = m_1 + ... + m_s + underbrace(deg g, >= 0) >= n_1 + ... + n_s$
]

#def[
    Пусть $f in K[X]$, $f = a_n X_n + a_(n-1) X_(n-1) + ... + a_1 X_1 + a_0$

    Его _производной_ будет называться многочлен $f' in K[X]$, $f' = n a_n X_(n - 1) + (n - 1) a_(n - 1) X_(n - 2) + ... + a_1$
]

#pr[
    + $(f + g)' = f' + g'$
    
    + $(f g)' = f' g + f g'$
    
    + $(f^n)' = n f^(n - 1) f'$
]

#proof[
    + лёгкая непосредственная проверка (сначала очевидно, потом тривиально, как всегда короче)
    
    + #[
        Пусть $f, g$ --- мономы, то есть $f = a X^n, space g = b X^m$
    
        $(f g)' = (a b X^(n + m))' = (n + m)a b X^(n + m - 1) = n dot a b X^(n + m - 1) + m dot a b X^(n + m - 1) = $
        $  underbrace(n a X^(n - 1), f') dot underbrace(b X^m, g) + underbrace(a X^n, f) dot underbrace(m b X^(m - 1), g')  $

        $f = sum f_i, space g = sum g_i, quad f_i, g_i$ --- мономы
        
        $(f g)' = ( limits(sum)_(i, j) f_i g_j ) = limits(sum)_(i, j) (f_i g_j)' = limits(sum)_(i, j) (f_i' g_j + f_i g_j') =\ limits(sum)_(i, j) f_i' g_j + limits(sum)_(i, j) f_i g_j' = limits(sum)_(i) f_i' limits(sum)_(j) g_j + limits(sum)_(i) f_i limits(sum)_(j) g_j' = f' g + f g'$
    ]

    + #[
        Индукция по $n$
    
        "База": $n = 1$

        $f' = f'$

        "Переход": $n > 1$

        $(f^n)' = (f^(n - 1) dot f)' = (f^(n - 1))' dot f + f^(n - 1) dot f' limits(=)^("переход")$ 
        
        $((n - 1) dot f' dot f^(n - 2)) dot f + f^(n - 1) dot f' = (n - 1) f' dot f^(n-1) + f' dot f^(n - 1) = n f^(n - 1) f'$
    ]
]

#pr[
    $K$ --- поле. $f in K[X], space f eq.not 0, space a in K$

    Тогда $a$ кратный корень $f <==> f(a) = f'(a) = 0$
]

#proof[

    "$arrow.r.double$":

    $a$ кратный корень $f ==> (X - a)^2 divides f ==> f = (X - a)^2 dot g,quad g in K[X]$

    $f' = ( (X - a)^2 )' dot g + (X - a)^2 dot g' = 2(X - a) dot g + (X - a)^2 dot g' ==> f'(a) = 0$

    "$arrow.l.double$":

    Пусть $f(a) = f'(a) = 0$.

    $f(a) = 0 limits(==>)^("т.Безу") f = (X - a) dot g,quad g in K[X] ==> f' = g + (X - a) g'$

    $f'(a) = 0 ==> g(a) = 0 ==> (X - a) divides g ==> (X - a)^2 divides f ==> a$ кратный корень $f$

]

#follow[
    $K$ --- поле. $f in K[X], space f eq.not 0, space a in K$

    Пусть $D = (f, f')$

    Тогда $a$ кратный корень $f <==> D(a) = 0$
]

#proof[
    $a$ кратный корень $<==>$ $f(a) = f'(a) = 0 limits(<==>)^("т.Безу") (X - a) divides f$ и $(X - a) divides f' <==> (X - a) divides D limits(<==>)^("т.Безу") D(a) = 0$
]

#def[
    Для кольца с $1$ _характеристикой_ $char R$ называется минимальное $n in NN$ такое, что $underbrace(1 + ... + 1, n) = 0$, а если такого $n$ нет, то $char R = 0$
]

#pr[
    $K$ --- поле c характеристикой $0$, то есть $underbrace(1 + ... + 1, n) eq.not 0,quad forall n in NN$

    $f in K[X], space  a in K$ --- корень $f$ кратности $s >= 2$.

    Тогда $a$ --- корень $f'$ кратности $s - 1$
]

#proof[
    $f = (X - a)^s g$ 

    $(X - a) divides.not g limits(==>)^("т.Безу") g(a) eq.not 0$

    $f' = ((X - a)^s)' dot g + (X - a)^s dot g' = $
    
    $s(X - a)^(s - 1) dot g + (X - a)^s dot g' = $
    
    $(X - a)^(s-1) dot h$, где $h = s dot g + (X - a) g'$

    $h(a) limits(=)^(char K = 0) s dot g(a) eq.not 0 ==> (X - a) divides.not h$
]
