#import "../../utils/core.typ": *

== Линейные отображения

#def[
    Пусть $V, W$ --- линейные пространства над полем $K$. Отображение $Aa: V --> W$ называется линейным, если:
    + $forall v, v' in V Aa(v + v') = Aa(v) + Aa(v')$
    + $forall v in V space forall alpha in K: Aa(alpha v) = alpha Aa(v)$
]

#example[
    + $K[x] --> K[x]$, $f maps f'$
    
    + $M_(m, n)(K) --> M_(n, m)(K)$, $A maps A^T$
    
    + $C in M_(n, p)(K):$ $M_(m, n) --> M_(m, p)(K) space A maps A C$

    + $E = (e_1, ..., e_n)$ --- базис $V$, тогда:
        \ $K^n --> V$
        \ $b maps E mul b$
]

#def[
    Множество всех линейных отображений $V --> W$ обозначается $Hom(V, W).$
    _Образ линейного отображения_ --- $Im Aa = {Aa v bar v in V}$.
    _Ядро линейного отображения_ --- $Ker Aa = {v bar v in V space Aa v = 0}$.
]

#lemma[
    $Aa in Hom(V, W) ==> Aa(0) = 0$
]

#proof[
    $Aa(0) = Aa(0 + 0) = Aa(0) + Aa(0) ==> Aa(0) = 0.$
]

#props[
    $Im Aa < W$, $Ker Aa < V$
]

#proof[    
    $0 in Aa(0) in Im Aa$, $A(0) = 0 ==> 0 in Ker Aa$.
    $Aa(v_1) + Aa(v_2) = Aa(v_1 + v_2) in Im Aa$, $alpha mul Aa v = Aa(alpha v) in Im Aa$
]

#notice[
    Если имеется система линейных уравнений $A x = b$, то ее можно рассматривать как отображение $A: K^n limits(-->)^Aa K^n$ ($x maps A x$).

    ${x bar A x = b} = {x bar Aa(x) = b} = Aa^(-1)(b)$.
    
    В частности, ${x bar A x = 0} = Ker A$.
]


#props[
    Пусть $Aa in Hom(V, W)$. Тогда $Aa$ инъективно $iff$ $Ker Aa = 0$
]
#proof[
    + #["$==>$": #h(1fr)
    $
        cases(Ker Aa = Aa^(-1)(0), 0 in Ker Aa, Aa #[--- инъективно])
        ==> Ker A = 0.
    $]
    
    + "$<==$": \ пусть $Aa v_1 = Aa v_2 ==> Aa(v_1 - v_2) = Aa v_1 - Aa v_2 = 0 ==> v_1 - v_2 in Ker Aa = 0 ==> v_1 = v_2 $
]

#props[
    Пусть $Aa in Hom(V, W)$, $dim V = n < infinity$. 
    Тогда $Im Aa$ конечномерен и 
    $ 
        underbrace(dim Ker Aa, #[Дефект $Aa$, $delta(Aa)$]) + underbrace(dim Im Aa, #[Ранг $Aa$, $rk Aa$]) = n.
    $
]

#proof[
    $d = dim Ker Aa$, $e_1, ..., e_d$ --- базис $Ker Aa$, $e_1, ..., e_d$ --- ЛНС в $V$. $e_(d+1), ..., e_n$ --- дополнение ее до базиса $V$.

    Докажем, что $Aa e_(d + 1), ..., Aa e_n$ --- базис $Im Aa$. Рассмотрим $w in Im Aa$. $w = Aa(v), v = alpha e_1 + ... + alpha_n e_n$. Значит
    $
        w = underbrace(alpha_1 Aa(e_1) + ... + alpha_d Aa(e_d), #[$0$, так как $e_1, ..., e_n in Ker Aa$]) + alpha_(d+1) Aa(e_(d+1)) + ... + alpha_n Aa(e_n) ==> w in Lin(e_(d + 1), ..., e_n).
    $

    Пусть какая-то линейная комбинация оказалась нулевой: $ lambda_(1) Aa e_(d + 1) + ... + lambda_(n - d) e_n = 0 ==> Aa(lambda_(1) e_(d + 1) + ... + lambda_(n - d) e_n) = 0. $

    Значит $lambda_1e_(d+1) + ... + lambda_(n - d)e_n in Ker Aa ==> lambda_1 e_(d+1) + ... + lambda_(n-d)e_n = alpha_1e_1 + ... + alpha_d e_d$ для некоторых $alpha_1, ..., alpha_d$. Пересеня все налево,
    $ (-alpha_1)e_1 + ... + (-alpha_d)e_d + lambda_1e_(d+1) + ... + lambda_(n-d)e_n = 0 $
    Значит $lambda_1e_(d+1) + ... + lambda_(n-d)e_n = 0$. Таким образом, $dim Im Aa = n - d$.
]

#follow[
    Рассотрим однородную систему линейных уравнений $A x = 0$. $A in M_(m, n)(K)$. Тогда $dim {x bar A x = 0} = n - rk A$.
]

#proof[
    Рассмотрим $Aa: K^n --> K^m$ ($x maps A x$). 
    $
    dim Ker Aa &= dim K^n - dim Im Aa = n - dim {A x bar x in K^n} =\
    &= n - dim Lin(A[,1], ..., A[, n]) = n - rk A.
    $
]