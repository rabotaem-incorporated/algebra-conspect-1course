#import "../../utils/core.typ": *

== Собственные значения и собственные векторы линейного отображения

#def[
    Оператор $Aa in End(V)$ называется _диагонализированным_, если $exists E:$
    $ [Aa]_E = diag(lambda_1, ..., lambda_n) = mat(
        lambda_1, ..., 0;
        dots.v, dots.down, dots.v;
        0, ..., lambda_n; 
    ), space "где" lambda_1, ..., lambda_n in K $ 
]

#notice[
    Матрицы _часто_ диагоназированные. Правда пока не понятно, что это значит.
]

#def[
    Пусть $Aa$ --- линейный оператор. Вектор $v != 0$ называется _собственным вектором_ оператора $Aa$ если существует скаляр $lambda in K$ такой, что 
    $ A v = lambda v. $

    Такие скаляры $lambda$ называют _собственными значениями_, или _собственными числами_ оператора $Aa$. То есть $lambda$ является собственным значением, если найдется ненулевой $v$ такой, что $Aa v = lambda v$. Или, $lambda$ является собственным значением если $V_lambda = {v in V bar Aa v = lambda v} != 0.$ Или, если $(A - lambda epsilon_V)(v) != 0$. Или, если $Ker (Aa - lambda epsilon_V) != 0$.


    Если $lambda$ --- собственные значения $Aa$, то такое $V_lambda$ называется _собственным подпростантсвом_, принадлежащим собственному значению $V$. Собственные вектора являются элементами таких пространств.
]

#notice[
    Тогда матрица отображения $Aa$ является диагонализированной, тогда и только тогда, когда найдется базис из собственных векторов $Aa$.
]

#props[
    Пусть $v_i in V_lambda_i \\ {0}$ --- собственные вектора, $i = 1,..., m$, $lambda_1, ..., lambda_m$ --- различные собственные значения. Тогда $v_1, ..., v_2, ..., v_m$ --- ЛНС.
]

#proof[
    Индукция по $m:$ \
    - "База": $m = 1$: $v_1 != 0$ по определению, значит $v_1$ ЛНС
    - "Переход $m-1 ~~> m$": предположим, что $exists alpha_1, .., alpha_m in K$, не все 0, такие что $
    alpha_1 v_1 + ... + alpha_m v_m = 0 quad (*) \ alpha_m = 0 ==> "противоречие с ИП"
    $
    $ (*) ==> Aa(underbrace(alpha_1 v_1 + ... + alpha_m v_m, = alpha_1 lambda_1 v_1 + ... + alpha_m lambda_m v_m)) = 0 $
    Домножили на $lambda$:
    $ (*) ==>  alpha_1 lambda_m v_1 + alpha_2 lambda_m v_2 + ... + alpha_m lambda_m v_m = 0 $
    $ alpha_1(lambda_1 - lambda_m)v_1 + ... + alpha_(m-1)(lambda_(m-1) - lambda_m)v_(m-1) = 0, space v_1, ..., v_(m-1) space #[ --- ЛНС по ИП] $
    $ ==> alpha_1(underbrace(lambda_1 - lambda_m, != 0)) = ... = alpha_(m-1)(underbrace(lambda_(m-1) - lambda_m, != 0)) = 0 $
    $ ==> alpha_1 = ... = alpha_(m-1) = 0 ==> alpha_m v_m = 0 ==> v_m = 0 space #[ --- противоречие условию] $
]

#follow[
    Собственных значений $Aa$ не более, чем $dim V$.
]

#let pc = sym.plus.circle

#follow[
    Пусть $lambda_1, ..., lambda_m$ --- собственные значения $V$. Тогда $V_lambda_1 + ... + V_lambda_m = V_lambda_1 pc ... pc V_lambda_m$.
]

#proof[
    TODO
]

#def[
    _Геометрической кратностью_ собственного значения $lambda$ называется
    $
        g_lambda = dim V_lambda.
    $
]

#props[
    Пусть $lambda_1, ..., lambda_m$ --- все собственные значение оператора $Aa$; $n = dim(V)$.

    + $g_(lambda_1) + ... + g_(lambda_m) <= n$
    + $Aa$ --- диагоназируем $<==> g_(lambda_1) + ... g_(lambda_m) = n$
]

#proof[
    + #h(1fr) $
        V > V_lambda_1 pc ... pc V_lambda_m ==> dim V &>=  dim(V_lambda_1 pc ... pc V_lambda_m) &=\ = dim V_lambda_1 + ... + dim V_lambda_m &= g_lambda_1 + ... + g_lambda_m
    $

    + #[Можно считать 
    $
        [Aa]_E = diag(underbrace((lambda_1, ..., lambda_1), r_1), ..., underbrace((lambda_m, ..., lambda_m), r_m)) \
        ==> underbrace(dim(V_(lambda_j)), = g_(lambda_j)) >= r_j, #[так как $V_(lambda_j)$ содержит $r_j$ базисных $==>$ линейно независимых векторов] \
        g_(lambda_1) + ... + g_(lambda_m) >= r_1 + ... + r_m = n ==> g_(lambda_1) + ... + g_(lambda_m) = n
    $
    Обратно: пусть $sum g_lambda_j = n$, $E_j$ --- любой базис $V_lambda_j$.
    $
        dim(V_lambda_1 pc ... pc V_lambda_n) = sum g_lambda_j = n ==> V_lambda_1 pc ... pc V_lambda_m = V imply^#[лемма]\
        E_1, ..., E_m #[--- базис $V$].
    $
    Базис из собственных векторов --- диагонализирующий.
    ]
]

#notice[
    Заметим, что собственное значение 
    $ 
        Aa <==> Ker(Aa - lambda epsilon) != 0 <==>\ Aa - lambda epsilon in.not GL(V) <==> [Aa - lambda epsilon]_E in.not GL_n(V) <==> abs([Aa - lambda epsilon]) = 0 iff^((*)) abs(Aa - lambda E_n) = 0
    $
    $
        (*): quad [Aa - alpha epsilon_V]_E = [Aa]_E - [lambda epsilon_V]_E = [Aa]_E - lambda E_n.
    $
]
