#import "../../utils/core.typ": *

== Собственные значения и собственные векторы линейного отображения

#def[
    Оператор $Aa in End(V)$ называется _диагонализируемым_, если $exists E:$
    $ [Aa]_E = diag(lambda_1, ..., lambda_n) = mat(
        lambda_1, ..., 0;
        dots.v, dots.down, dots.v;
        0, ..., lambda_n; 
    ), space "где" lambda_1, ..., lambda_n in K $ 
]

#notice[
    Матрицы _часто_ диагонализируемые. Правда, пока не понятно, что это значит.
]

#ticket[Собственные значения. Линейная независимость собственных векторов,
принадлежащих разным собственным значениям. Следствия]

#def[
    Пусть $Aa$ --- линейный оператор. Вектор $v != 0$ называется _собственным вектором_ оператора $Aa$ если существует скаляр $lambda in K$ такой, что 
    $ Aa v = lambda v. $

    Такие скаляры $lambda$ называют _собственными значениями_, или _собственными числами_ оператора $Aa$. То есть $lambda$ является собственным значением, если найдется ненулевой $v$ такой, что $Aa v = lambda v$. Или, $lambda$ является собственным значением, если $V_lambda = {v in V bar Aa v = lambda v} != 0.$ Или, если $(Aa - lambda epsilon_V)(v) != 0$. Или, если $Ker (Aa - lambda epsilon_V) != 0$.


    $V_lambda$ называется _собственным подпространтством_, принадлежащим собственному значению $lambda$. Собственные вектора являются элементами таких пространств.
]

#notice[
    Тогда матрица отображения $Aa$ является диагонализируемой, тогда и только тогда, когда найдется базис из собственных векторов $Aa$.
]

#pr[
    Пусть $v_i in V_lambda_i \\ {0}$ --- собственные вектора, $i = 1,..., m$, $lambda_1, ..., lambda_m$ --- различные собственные значения. Тогда $v_1, ..., v_m$ --- ЛНС.
]

#proof[
    Индукция по $m:$ \
    - "База": $m = 1$: $v_1 != 0$ по определению, значит $v_1$ ЛНС
    - "Переход $m-1 ~~> m$": предположим, что $exists alpha_1, .., alpha_m in K$, не все 0, такие что $
    alpha_1 v_1 + ... + alpha_m v_m = 0 quad (*) \ alpha_m = 0 ==> "противоречие с ИП"
    $
    $ (*) ==> Aa(alpha_1 v_1 + ... + alpha_m v_m) = alpha_1 lambda_1 v_1 + ... + alpha_m lambda_m v_m = 0 $
    Домножили на $lambda_m$:
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
    $
    forall v_1 in V_1, ..., v_m in V_m, space v_1, ..., v_m - "ЛНС" <==> \
    forall i: space V_i sect V_1 + ... + hat(V_i) + ... + V_m = 0
    $
]

#ticket[Диагонализируемые операторы. Критерий диагонализируемости в терминах
геометрических кратностей (+см. определение выше)]

#def[
    _Геометрической кратностью_ собственного значения $lambda$ называется
    $
        g_lambda = dim V_lambda.
    $
]

#pr[
    Пусть $lambda_1, ..., lambda_m$ --- все собственные значение оператора $Aa$; $n = dim V$.

    + $g_(lambda_1) + ... + g_(lambda_m) <= n$
    + $Aa$ --- диагонализируем $<==> g_(lambda_1) + ...+ g_(lambda_m) = n$
]

#proof[
    + #h(1fr) $
        V > V_lambda_1 pc ... pc V_lambda_m ==> dim V &>=  dim(V_lambda_1 pc ... pc V_lambda_m) &=\ = dim V_lambda_1 + ... + dim V_lambda_m &= g_lambda_1 + ... + g_lambda_m.
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


#ticket[Характеристический многочлен линейного оператора. Алгебраическая кратность собственного
значения]

#notice[
    $ 
        lambda - "собственное значение" Aa <==> Ker(Aa - lambda epsilon) != 0 <==>\ Aa - lambda epsilon in.not GL(V) <==> [Aa - lambda epsilon]_E in.not GL_n (V) <==> det([Aa - lambda epsilon]_E) = 0 iff^((*)) det((A - lambda E_n)) = 0
    $
    $
        (*): quad [Aa - lambda epsilon_V]_E = [Aa]_E - [lambda epsilon_V]_E = [Aa]_E - lambda E_n.
    $
]

#def[
    Для какого-то $Aa = End V$ можно записать собственные числа как корни _характеристического многочлена матрицы A_, $chi_A = det((A - x mul E_n)) in K[x] subset K(x)$.

    $
        abs(A - x mul E_n) &= (a_(1 1) - x)...(a_(n n) - x) + 
        #[многочлены степени $<= n-2$] \ &= (-1)^n x^n + (-1)^(n-1)(underbrace(a_(1 1) + a_(2 2) + ... + a_(n n), #[$Tr A$ --- След матрицы $A$]))x^(n-1) + ... + det(A)
    $
]

#lemma[
    Пусть $A' = C^(-1)A C, C in GL_n (K)$. Тогда $chi_(A') = chi_A$.
]

#proof[
    $
        chi_(A') = abs(A' - x mul E_n) = abs(C^(-1) A C - x mul C C^(-1)) = abs(C^(-1) A C - C^(-1)( x C)) = \
        abs(C^(-1)(A - x E_n)C) = abs(C)^(-1) mul abs(A - x E_n) mul abs(C) = chi_A.
    $
]

#follow[
    Характеристический многочлен оператора $chi_([Aa]_E)$ не зависит от выбора базиса $E$.
]

#def[
    _Характеристический многочлен оператора $Aa$_ --- $chi_Aa = chi_([Aa]_E)$, в каком-то базисе $E$.
]

#pr[
    $lambda$ --- собственное значение $Aa$ тогда, и только тогда, когда $chi_Aa(lambda) = 0$.
]

#proof[
    $
        Ker (A - lambda E_n) != 0 <==> abs(A - lambda E_n) = 0 <==> chi_Aa (lambda) = 0.
    $
]
#def[
    _Алгебраической крастностью_ собственного значения $lambda$ называют кратностью $lambda$ как корня $chi_(Aa)$
 ]

#notice(name: [Не особо важно, просто для понимания])[
    Многие матрицы диагонализируемы, потому что корни характеристических многочленов редко совпадают, а когда они совпадают, то довольно часто геометрические кратности равны алгебраическим.
]

#ticket[Связь между алгебраической и геометрической кратностью собственного
значения (?)]

#pr[
    $g_lambda <= a_lambda$
]

#let line_end(ident, ..args) = {
    let end_label = label("line_end_" + ident)

    show end_label: locate(loc => {
        let end = loc.position()
        let begin_label = label("line_begin_" + ident)
        let start = query(begin_label, loc).last().location().position()
        box(place(line(end: (start.x - end.x, start.y - end.y), ..args)))
    })

    [#box()#end_label]
}

#let line_begin(ident) = [#box()#label("line_begin_" + ident)]

#proof[
    Пусть $e_1, ..., e_g$ --- базис $V_lambda$, $e_(g+1), ..., e_n$ --- дополнение до базиса $E$ пространства $V$.
    $
        [A]_E = mat(
            lambda, 0, ..., 0, limits(#hide("A"))^#line_begin("B"), dots.v, dots.v;
            0, lambda, ..., 0, space, dots.v, dots.v;
            dots.v, dots.v, dots.down, lambda, space, dots.v, dots.v;
            #move(dx: -5pt)[#line_begin("A")], #box(), #box(), #box(), #box(), #box(), #move(dx: 5pt)[#line_end("A")] ;
            0, 0, ..., 0, space, dots.v, dots.v;
            0, 0, ..., 0, limits(#hide("A"))_#line_end("B"), dots.v, dots.v;
            )
    $ 
    $
    chi_(Aa) = ... = abs((lambda - x) E_g) mul abs(*) = (lambda - x)^g mul (...) ==> a_lambda >= g_lambda.
    $
]

#ticket[Критерий диагонализируемости в терминах геометрических и алгебраических
кратностей. Примеры недиагонализируемых операторов]

#pr[
    Для оператора $Aa in End(V)$ эквивалентны:
    + $Aa$ -- диагонализируем
    + $chi_(Aa)$ расскладывается на линейные множители, и для всех собственных значений $lambda$ выполняется $g_lambda = a_lambda$ 
]

#proof[
    \ $1 ==> 2$
    $
        g_(lambda_1) + ... + g_(lambda_m) = n, chi_(diag(alpha_1, ..., alpha_n)) = plus.minus product_(i=1)^n (x - alpha_i) \
        a_(lambda_1) + ... + a_(lambda_m) \
        g_(lambda_j) <= a_(lambda_j) ==> forall j: g_(lambda_j) = a_(lambda_j)
    $
    \ $2 ==> 1$
    $
        a_(lambda_1) + ... + a_(lambda_m) = n ==> g_(lambda_1) + ... + g_(lambda_m) = n ==> #[$Aa$ диагонализируем]
    $
]

#example[
    Этот оператор недиагонализируем: $Aa = display(mat(0, 0; 1, 0))$

    $ chi_Aa = mat(delim: "|", A - x dot E_n) = mat(-x, 0; 1, -x) = x^2. $

    У этой матрицы алгебраическая кратность $a_0$ собственного числа 0 это кратность корня $x^2$, то есть 2, а геометрическая, $1$ так как $dim Lin(e_2) = 1$.
]

#ticket[Жорданова нормальная форма (формулировка теоремы)]

#th(name: [Жорданова нормальная форма])[
    $m in NN, space lambda in L$
    $
        J_m (lambda) = mat(
            lambda, 1, 0, ..., 0, 0;
            0, lambda, 1, ..., 0, 0;
            0, 0, lambda, ..., 0, 0;
            dots.v, dots.v, dots.v, dots.down, dots.v, dots.v;
            0, 0, 0, ..., lambda, 1;
            0, 0, 0, ..., 0, lambda;
        ) in M_m (K)
    $
    Такая матрица называется _Жордановой клеткой_.

    Жорданова матрица --- блочная диагональная матрица, в которой каждый блок --- Жорданова клетка.

    Пусть $chi_Aa$ расскладывается на линейные множители. Тогда в $V$ существует базис $E$ такой, что $[Aa]_E$ --- Жорданова матрица. При этом, матрица $[Aa]_E$ определена однозначно, с точностью до порядка блоков.
]

#proof[
    Без доказательства.
]
