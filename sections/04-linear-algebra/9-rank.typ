#import "../../utils/core.typ": *

== Ранг матрицы

#def[
    Пусть $v_1, ..., v_n in V$.
    _Рангом_ набора векторов $v_1, ..., v_n$ называется размер его линейной оболочки:
    $ rk(v_1, ..., v_n) = Dim Lin(v_1, ..., v_n) $
]

#lemma[
    $rk(v_1, ..., v_n)$ равен наибольшему числу линейно независимых векторов из $v_1, ..., v_n$.
]

#proof[
    $W = Lin(v_1, ..., v_n).$

    Найдутся индексы $i_1, ..., i_r$ такие, что $v_(i_1), ..., v_(i_r)$ --- базис $W$. Очевидно, $r = rk(v_1, ..., v_n)$. $v_(j_1), ..., v_(j_r)$ --- ЛНС в $W$. Если $w_1, ..., w_l$ --- ЛНС в $W$, то $l <= Dim W = r$.
]

#notice[
    Для удобства будем обозначать $i$-ю строку матрицы как $A[i,]$, а $j$-й столбец как $A[,j]$. 
]

#def[
    _Столбцовым рангом_, или просто _рангом_, матрицы $A in M_(m, n)(K)$ называется ранг совокупности ее столбцов. 
    $ rk A = rk(A[,1], ..., A[,n]). $

    Строчным рангом матрицы называется ранг совокупности ее строк.
    $ rk A^T = rk(A[1,], ..., A[m,]). $

    Совокупности рассматриваются как векторы в пространстве $K^n$ или $K^m$.
]

#lemma[
    Столбцовый ранг матрицы не изменяется при элементарных преобразованиях ее строк и столбцов.
]

#proof[
    Пусть произошло преобразование $A ~~> B$. 

    + Рассмотрим элементарные преобразования столбцов. Тогда линейные оболочки столбцов не изменятся, так как при любом элементарном преобразовании получающиеся столбцы будут выражаться через старые. (Точнее, из этого следует одно включение. Второе получается из симметрии.) $ 
        Lin(A[,1], ..., A[,n]) = Lin(B[,1], ..., B[,n]) ==> rk A = rk B. 
    $

    + #[
        Рассмотрим элементарные преобразования строк. Пусть $rk A = r$. Тогда $exists j_1, ..., j_r: quad A[,j_1], ..., A[,j_n] #[--- ЛНС]$. Покажем, что $B[,j_1], ..., B[,j_n] #[--- ЛНС]$. Предположим, что 
        $ 
            lambda_1 mul B[,j_1]     + ... + lambda_r mul B[,j_r] = 0, "где найдется" j_* != 0. 
        $
        $ 
            B mul underbrace(vec(0, 0, ..., lambda_1, ..., 0, ..., lambda_r, ..., 0), d) = 0,
            A = U B ==> U B d = 0 ==> A d = 0.
        $
        Но тогда $lambda_1 = ... = lambda_n = 0$, что противоречит предположению.
        Значит $rk B >= r = rk A$. Аналогично получается обратное неравентсво. Значит $rk A = rk B$.
    ]
]

#follow[
    Строчный ранг матрицы не меняется при элементарных преобразованиях ее строк и столбцов.
]

#proof[
    $rk A^T = rk B^T.$
]

#th[
    Строчный и столбцовый ранг матрицы совпадают.
]

#proof[
    Рассмотрим матрицу $A$. Ее можно превратить в окамленную единичную матрицу$D$. $A ~~> D$. И строчный, и столбцовый ранг матрицы $D$ совпдает и равен количеству единиц $r$ в матрице. Значит $rk A = rk D = r = rk D^T = rk A^T$.
]

#notice[
    Если $A = P D Q$, то $rk A = rk D = #[кол-во единиц в $D$]$.
]

#lemma[
    Пусть $A in M_(m, n)(K)$, $B in M_(m, p)(K)$. Тогда $rk(A B) <= min(rk A, rk B)$.
]

#proof[
    $
        cases(
        (A B)[,1] &= A B[,1],
        (A B)[,2] &= A B[,2],
        &...,
        (A B)[,p] &= A B[,p],
        ) ==> Lin(A B[,1], ..., A B[,p]) subset Lin(A[,1], ..., A[,n])
        ==> rk A B <= rk A.
    $
    $ rk(A) = rk((A B)^T) = rk (B^T A^T) <= rk B^T = rk B. $
]

#follow[
    $ U in GL_n(K), A in M_(m, n)(K) ==> rk(A U) = rk(A) $
]

#proof[
    $ 
        rk(A U) &<= rk A \
        rk(A) = rk(A U mul U^(-1)) &<= rk(A U)
    $
]

#props[
    Пусть $U in M_n(K)$. Тогда следующие условия равносильны:
    + $U in GL_n(K).$
    + $exists V in M_n(K): quad U V = E_n.$
    + $exists V in M_n(K): quad V U = E_n.$
    + $abs(U) != 0.$
    + $rk U = n.$
]

#proof[
    - "$4 <==> 1$" --- знаем.
    - "$1 ==> 2, 3$" --- тривиально.
    - "$2 ==> 4$" --- $abs(U) abs(V) = abs(U V) = abs(E_n) = 1 ==> abs(U) != 0$.
    - "$3 ==> 4$" --- $abs(U) abs(V) = abs(V U) = abs(E_n) = 1 ==> abs(U) != 0$.
    - "$1 ==> 5$" --- $U V = E_n, V in GL_n(K) ==> rk U = rk (U V) = rk E_n = n$.
    - "$5 ==> 1$" --- $U = P D Q, rk D = n space "и" space P, Q in GL_n(K)$.
]

#def[
    _Подматрицей_ матрицы $A$ называется матрица из которой выбраны некоторые строки и столбцы.
]

#def[
    _Минором порядка $r$_ матрицы $A$ называется определитель подматрицы $A$ размера $r times r$.
]

#th(name: "О минорном ранге")[
    Пусть $rk A = r$. Тогда:
    + В $A$ есть ненулевой минор порядка $r$.
    + В $A$ нет ненулевого минора порядка $s > r$.
]

#proof[
    + #[
        Так как $rk A = r$, $exists j_1, ..., j_(r) A[,j_1], ..., A[,j_r]$ --- ЛНС. Оставим только эти столбцы. $ A' = A[;j_1,...,j_r]. $
        Тогда $rk A' = r$, так как все оставшиеся столбцы --- ЛНС.

        Значит в $A'$ есть $r$ линейно независимых строк, то есть 
        $
            exists i_1, ..., i_r: A'[i_1,], ..., A'[i_r_1,] #[--- ЛНС]
        $

        Из этих строк можно составить матрицу $A''$. Ее ранг равен $r$, а значит определитель этого минора не равен 0.
    ]

    + #[
        Пусть $s > r$. $B = A[i_1, ..., i_s; j_1, ..., j_s]$. $rk B = s$. Значит $B$ имеет $s$ линейно независимых строк, то есть и в $A$ есть $s$ линейно независимых строк. Но $rk A = r < s$. Значит такого минора не найдется.
    ]
]

#follow(name: "Эквивалентное определение ранга")[
    Ранг --- это максимальный порядок ненулевого минора.
]

#th(name: "Кронекера-Капелли")[
    Система линейных уравнений 
    $
        A mul vec(x_1, dots.v, x_n) = b quad (*)
    $
    Совместна тогда и только тогда, когда $rk A = rk (A | b)$.
]

#proof[
    - "$==>$": Если система совместна, то $exists x_1, ..., x_n$:
    $ 
        x_1 A[,1] + ... + x_n A[,n] = b ==> \
        b in Lin(A[,1], ..., A[,n]) ==> \
        Lin(A[,1], ..., A[,n]) = Lin(A[,1], ..., A[,n], b) ==> \
        rk A = rk (A | b).
    $

    - "$<==$":
    $ 
        rk A = rk(A | b) imply^(A <= (A | b)) ==> \
        Lin(A[,1], ..., A[,n]) = Lin(A[,1], ..., A[,n], b) ==> \
        b in Lin(A[,1], ..., A[,n]) ==> \
        exists x_1, ..., x_n: quad x_1 A[,1] + ... + x_n A[,n] = b.
    $
]
