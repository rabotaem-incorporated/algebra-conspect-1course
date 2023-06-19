#import "../../utils/core.typ": *

== Матрица линейного отображения

#ticket[Свойство универсальности базиса. Пространство линейных отображений]

#pr[
    Пусть $V$, $W$ --- линейные пространства над $K$. $e_1, ..., e_n in "базис" V$, $sq(w) in W$.
    Тогда $exists! Aa in Hom(V, W): Aa e_i = w_i, i = 1, ..., n$.
]

#proof[
    - #[
        "Единственность": Пусть $Aa$ --- как в условии, $v = alpha_1 e_1 + ... + alpha_n e_n$. Тогда  $Aa v = alpha_1 Aa e_1 + ... + alpha_n Aa e_n = alpha_1 w_1 + ... + alpha_n w_n. $ 
        В силу единственности разложения в базисе, получается, что линейное отображение однозначно определяется своими значениями на базисных векторах.
    ]
    - #[
        "Существование":
        Рассмотрим $alpha_1 w_1 + ... + alpha_n w_n = Aa(alpha_1 e_1 + ... + alpha_n e_n)$. Оно подходит.
    ]
]

#def[
    Пусть $dim V = n, dim W = m$, $E = (sq(e))$ --- базис $V$, а $F = (sq(f, m))$ --- базис $W$. $Aa in Hom(V, W)$.

    _Матрицей линейного отображения $Aa$ в базисах $E, F$_ называется:
    $ [Aa]_(E, F) = A = ([Aa e_1]_F, [Aa e_2]_F, ..., [Aa e_n]_F) in M_(m,n) $
]

#example[
    - $V = W = {f in K[X] bar zws deg f <= 2}$, $E = (1, x, x^2) = F$, $Aa: f maps 5f - f'$. #h(1fr)
        $ mat(5, -1, 0; 0, 5, -2; 0, 0, 5) = [A]_(E, F) $
]

#ticket[Изменение координат вектора под действием линейного отображения]

#pr[
    $Aa: V --> W$, $v in V space [v]_E, A := [Aa]_(E, F)$ --- знаем, тогда $[Aa v]_F = A mul [v]_E$.
]
#proof[
    $v = E mul [v]_E$, $underbrace(F[Aa v]_F, in K^m) = Aa v = Aa E mul [v]_E = (F A)[v]_E = F(A mul [v]_e)$ \
    $F$ --- базис $==> [Aa v]_F = A mul [v]_E$
]

#def[
    _Изоморфизмом_ между линейными пространствами $V$ и $W$ называется биективный гомоморфизм $phi in Hom(V, W)$.
    Линейные пространства называют _изоморфными_, если между ними существует изоморфизм.
]

#pr[
    Пусть $phi: V --> W$ --- изоморфизм, $sq(e)$ --- базис $V$. Тогда $phi(e_1), ..., phi(e_n)$ --- базис $W$.
]

#proof[
    $ w in W ==> w = phi(v) = phi(alpha_1e_1 + ... + alpha_n e_n) = alpha_1phi(e_1) + ... + alpha_n phi(e_n) in Lin(phi(e_1), ..., phi(e_n)). $
    $ alpha_1 phi(e_1) + ... + alpha_n phi(e_n) = phi(alpha_1 e_1 + ... + alpha_n e_n) = 0 ==> alpha_1 e_1 + ... + alpha_n e_n = 0 ==> alpha_1 = ... = alpha_n = 0 $
]

#notice[
    Чтобы построить непосредственно изоморфизм, нужно зафиксивать базис $E$ пространства $V.$ Получим изоморфизм $K^n  limits(-->)^(phi_E) V$, и аналогично $K^m limits(-->)^(phi_F) W.$ Тогда любое линейное отображение $Aa$ после применения обратных изоморфизмов $phi_E^(-1)$ и $phi_F^(-1)$ превращается в матричное отображение.
]

#pr[
    Пусть $E$ --- базис $V$, $n = dim V$, $F$ --- базис $W$, $m = dim W$. Тогда $Hom(V, W) --> M_(m, n)(K)$ --- изоморфизм линейных пространств.    
]

#proof-left-to-the-reader()

#follow[
    $dim Hom(V, W) = (dim V) mul (dim W)$.
]

#ticket[Матрица композиции линейных отображений]

#pr[
    Пусть $Aa in Hom(U, V)$, $Bb in Hom(V, W)$; $E, F, G$ --- базисы $U, V, W$. Тогда $ [Bb Aa]_(E, G) = underbrace([Bb]_(F, G), B) underbrace([Aa]_(E,F), A) $
]

#proof[
    $
        cases(Aa E = F A, Bb F = G B) ==> Bb Aa E = (Bb F) A = G B A = G (B A) = G [Bb Aa]_(E, G) ==> [Bb Aa]_(E, G) = B A.
    $
]

#ticket[Изменение матрицы линейного отображения при замене базисов]

#TODO[объяснить]

$ Aa: limits(V)^(E, E') --> limits(W)^(F, F') $
$ [Aa]_(E, F) = A, [Aa]_(E', F') = ? $
$ Aa = Id_W compose Aa compose Id_V $
$ [Aa]_(E', F') = [Id_W]_(F, F') mul A mul [Id_v]_(E', E) = M_(F' --> F) mul A mul M_(E --> E') $
$ [Aa]_(E', F') = M_(F --> F')^(-1) mul A mul M_(E --> E') $

#import "../../utils/cd/cd.typ": *

#align(center)[#commutative_diagram(
  node((0, 0), [$V$]),
  node((0, 1), [$W$]),
  node((1, 0), [$V$]),
  node((1, 1), [$W$]),
  arr((0, 0), (0, 1), [$Aa$]),
  arr((1, 0), (0, 0), [$"id"_V$]),
  arr((0, 1), (1, 1), [$"id"_W$]),
  arr((1, 0), (1, 1), [$Aa$], "dashed"),
)]

#pr[
    Пусть $V$, $W$ --- конечномерные, $Aa in Hom(V, W)$. Тогда в $V$ и $W$ существуют базисы $E$ и $F$ такие, что $[Aa]_(E, F)$ --- окаймленная единичная.
]

#proof[
    Пусть $E, F$ - произвольные базисы $V, W$, тогда
    $ Aa E = F A ==> Aa E = F P D Q ==> Aa (E Q^(-1)) = (F P) D $
    Тогда в базисах $E Q^(-1), F P$ матрица этого линейного отображения будет единичной окаймленной
]
