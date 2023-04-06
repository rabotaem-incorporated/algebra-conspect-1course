#import "../../utils/core.typ": *

== Основная теорема арифметики

#th[
    Пусть $n >= 2$. Тогда $n$ можно представить в виде произведения простых чисел, и такое представление единственно с точностью до порядка сомножителей.    
]

#proof[
    
    "Существование":
    
    Пусть $n_0$ --- наименьшее число $(>= 2)$, для которого такого представления нету.
    
    $n_0$ --- составное число $==> n_0 = a b, space  2 <= a, b < n_0$
    
    Это число минимальное $==> a = p_1 ... p_k, space b = q_1 ... q_l$, где все $p_i, q_j$ --- простые.
    
    Но тогда, $ n_0 = p_1 ... p_k q_1 ... q_l$, где все $p_i, q_j$ --- простые $==>$ такое представление существует, противоречие.
    
    "Единственность":
    
    $n = p_1 ... p_k = q_1 ... q_l, space.quad p_i, q_j$ --- простые.
    
    Нужно доказать, что $k = l$ и что $q_1 ..., q_k$ совпадают с $p_1, ..., p_k$ с точностью до порядка.
    
    Не умаляя общности можно считать: $k <= l$. 
    
    Индукция по $k$:
    
    "База": $k = 1: space p_1 = q_1 ... q_l, space p_1$ --- простое $==> l = 1, space  p_1 = q_1$
    
    "Переход": $k > 1: space p_k  divides n ==> p_k  divides (q_1 ... q_l) ==> exists j : p_k  divides q_j ==> p_k sim q_j ==> p_k = q_j$
    
    А значит $p_1 ... p_(k-1) = q_1 ... hat(q_j) ... q_l$, где $k-1 <= l-1$
    
    $k-1 < k ==>$ применим индукционный переход:
    
    $k-1 = l-1$ и $q_1, ..., hat(q_j), ..., q_k$ --- это $p_1, ..., p_(k-1)$ с точностью до порядка. $==>$
    
    $q_1, ..., (q_j = p_k), ..., q_k$ --- это $p_1, ..., p_k$ с точностью до порядка.
]

#def[
    _Каноническое разложение (факторизация)_ числа $n$ --- это представление $n$ в виде $p_1^(r_1) ... p_s^(r_s)$, где $forall i: space p_i in PP, space  r_i in NN$
]

#examples[
    -   $n = 112 = 2^4 dot.c 7$
    
    -   $n = 6006 = 2^1 dot.c 3^1 dot.c 7^1 dot.c 11^1 dot.c 13^1$
]

#props[    
    Пусть $a = p_1^(r_1) ... p_s^(r_s), space  b = p_1^(t_1) ... p_s^(t_s)$

    Тогда $a  divides b <==> r_i <= t_i space forall i in {1, ..., s}$
]

#proof[
    
    "$arrow.l.double$":
    
    $b = a dot.c p_1^(t_1 - r_1) ... p_s^(t_s - r_s) ==> a  divides b$
    
    "$arrow.r.double$":
    
    $a  divides b ==> b = a c, space  c = p_1^(m_1) ... p_s^(m_s) p_(s+1)^(m_(s+1)) ... p_n^(m_n)$
    
    $b = p_1^(t_1) ... p_s^(t_s) = p_1^(r_1 + m_1) ... p_s^(r_s + m_s) p_(s+1)^(m_(s+1)) ... p_n^(m_n) ==>$
    
    $cases(
        t_i = r_i + m_i\, space.quad forall i in {1, ..., s},
        m_(s+1) = ... = m_n = 0 
    ) ==> t_i >= r_i, space.quad forall i in {1, ..., s}$
]

#follow[    
    Пусть $a = p_1^(r_1) ... p_s^(r_s)$

    Тогда ${d > 0 divides a dots.v d} = \{p_1^(t_1) ... p_s^(t_s) divides 0 <= t_i <= r_i, space  forall i in {1, ..., s}\}$
]

#follow[    
    Пусть $a = p_1^(r_1) ... p_s^(r_s), space b = p_1^(t_1) ... p_s^(t_s)$

    Тогда $gcd(a, b) = p_1^(min(r_1, t_1)) ... p_s^(min(r_s, t_s))$
]

#def[    
    Пусть $a, b in ZZ$. Число $c in ZZ$ называется _наименьшим общим кратным_ чисел $a$ и $b$, если:
    
    +   $a  divides c, space  b  divides c$
    +   $a  divides c', space  b  divides c' ==> c  divides c'$
    
]

#props[    
    Пусть $a = p_1^(r_1) ... p_s^(r_s), space  b = p_1^(t_1) ... p_s^(t_s)$

    Тогда $c = p_1^(max(r_1, t_1)) ... p_s^(max(r_s, t_s))$ --- наименьшее общее кратное чисел $a$ и $b$
]

#proof[
    
    
    +   $a  divides c, space  b  divides c$ --- очевидно
    
    +   Пусть $a  divides c', space  b  divides c', space  c' = p_1^(m_1) ... p_s^(m_s) p_(s+1)^(m_(s+1)) ... p_n^(m_n)$

        $a  divides c', space  b  divides c' ==> r_i <= m_i, space t_i <= m_i, space forall i in {1, ..., s} ==>$

        $max(r_i, t_i) <= m_i, space forall i in {1, ..., s} ==> c  divides c'$
    
]

#def[
    НОК($a, b$) $<==> lcm(a, b)$ --- положительное значение наименьшего общего кратного чисел $a$ и $b$. 
]

#follow[    
    Пусть $a, b in NN$

    Тогда $lcm(a, b) dot.c gcd(a, b) = a b$
]

#proof[
    $min(r_i, t_i) + max(r_i, t_i) = r_i + t_i$
]