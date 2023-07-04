#import "../../utils/core.typ": *

== Формула Тейлора

#pr[
    $K$ --- поле, $f, g in K[x], space f eq.not 0, space d = deg(g) >= 1$.

    Тогда $f$ можно представить единственным образом в виде:

    $ 
        f = h_n g^n + ... + h_1g + h_0,
    $ 

    где $n >= 0, space  h_i in K[x], space  h_n eq.not 0, space deg(h_i) < d, space  forall i = 0, ..., n$.
]

#proof[

    "Существование":

    Индукция по $l = deg f$.

    "База": При $l < d$ подходит $n = 0, space h_0 = f$.

    "Переход": При $l >= d: space  f = g q + r, space  deg(r) < d, space  q eq.not 0$.

    $deg g q >= deg g > deg r$

    $==> deg f = deg g q ==> deg q = l - d$
    
    По ИП: $q = h_n g^n + ... + h_1 g + h_0, space  h_n eq.not 0, space deg(h_i) < d, space  i = 0, ..., n$.

    $==> f = h_n g^(n + 1) + ... + h_0 g + r$.

    "Единственность":

    Индукция по $l = deg f$.

    При $l < d$:

    $deg h_n g^n >= n d > deg h_i g^i, space  i = 0, ..., n - 1 ==> deg f = deg h_n g^n ==> deg h_n g^n < d$.

    $n d + d - 1 >= l >= n d ==> n$ --- неполное частное при делении $l$ на $d$.

    "База": При $l < d: space n = 0 ==> h_0 = f$.

    "Переход": При $l >= d$ предположим, что есть еще разложение $f = hat(h_n) g^n + ... + hat(h_1) g + hat(h_0)$.

    $f = g(h_n g^(n - 1) + ... + h_1) + h_0 = g(hat(h_n) g^(n - 1) + ... + hat(h_1)) + hat(h_0), quad deg h_0, space deg hat(h_0) < d$

    Тогда $h_0 = hat(h_0)$. По единственности деления с остатком.

    По ИП: $deg f_1 = h_n g^(n - 1) + ... + h_1 < deg f ==> h_i = hat(h_i), space i = 1, ..., n - 1$.
]


#pr[
    $char K = 0, space f in K[x], space f eq.not 0, space d = deg(f) = n >= 0, space a in K$.

    $==> f = limits(sum)_(i = 0)^n (f^((i))(x - a)^i)/(i!), space f^((i)) in K[x], space deg(f^((i))) < d, space i = 0, ..., n$.
]

#proof[
    $f = limits(sum)_(i = 0)^n c_i(x - a)^i, space c_i in K, space i = 0, ..., n, space c_n eq.not 0$.

    $f^((i)) = limits(sum)_(j = i)^(n) c_(j) j! (x - a)^(j - i),quad i = 0, ..., n$.

    $f^((j))(a) = c_j j! ==> c_i = (f^((i))(a))/(i!)$.
]