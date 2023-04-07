#import "../../utils/core.typ": *

== Дальнейшие свойства определителя

#props[
  Пусть
  $ A = mat(B, X; 0, C). $
  ($A$ - блочная матрица, $B$ и $C$ - квадратные).
  Тогда $abs(A) = abs(B) mul abs(C)$.
]

#proof[
  $ abs(A) = sum_(sigma in S_n) op("sgn")(sigma) mul a_(1 sigma_1) dots a_(n sigma_n) $
  Заметим, что все перестановки которые переводят строки из $B$ в $0$ обращают произведение в 0 и наоборот. Рассмотрим остальные $sigma = pi mul rho$.
  $ abs(A) &= 
  sum_(pi in S_k \ rho in S_(n - k)) sgn(pi) mul sgn(rho) mul a_(1 pi_1) dots a_(k rho_k) mul a_(k + 1 pi_1) dots a_(n rho_(n - k)) = \
  &= (sum_(pi in S_k) sgn(pi) a_(1 pi_1) dots a_(k rho_k)) mul (sum_(rho in S_(n - k)) sgn(rho) a_(k rho_1) dots a_(n rho_(n - k))) = abs(B) mul abs(C).
  $
]

#follow[
  Пусть
  $ A = mat(a_11, 0, dots.c, 0; 0, a_22, dots.c, 0; dots.v, dots.v, dots.down, dots.v; 0, 0, dots.c, a_(n n)) $
  Тогда $abs(A) = a_11 a_22 mul a_(n n)$.
]

#proof[
  По индукции по $n$.
]

#props[
  Пусть $A, B in M_(n)(K)$. Тогда $abs(A mul B) = abs(A) mul abs(B)$.
]

#proof[
  Применим PDQ разложение $A$, будем по одному рассматривать что происходит при применении преобразования слева и справа по индукции.
  + $abs(T_(i j)(alpha) A'B) = abs(A'B) = abs(A') mul abs(B) = abs(T_(i j)(alpha) A') abs(B)$
  + #sym.dots Еще 4 случая: $S_(i j)$, $D_i(alpha)$, $E_n$, блочно единичная матрица.
]

#def[
  _Минор_ $M_(i j)$ - определитель матрицы из которой вырезали $i$-ю строчку и $j$-й столбец.
]

#def[
  _Алгебраическое дополнение элемента в позиции_ $(i, j)$: $A_(i j) = (-1)^(i + j) M_(i j)$.
]

#lemma(name: "Об определителе матрицы с почти нулевой строкой")[
  Пусть $A in M_n(K)$, $1 <= i_0, j_0 <= n$, $A = (a_(i j))$, $a_(i_0 j) = 0$ при всех $j != j_0$.
  Тогда $abs(A) = a_(i_0 j_0) A_(i_0 j_0)$.
]

#proof[
  Пусть $i_0 = j_0 = 1$.
  Из определения, $abs(A) = a_11 dot det(a_22, dots, a_(2 n); dots, dots, dots; a_(n 2), dots, a_(n n))$.

  Общий случай: применяем элементарные преобразования ($S_(i_0 i_0 -1)$, $S_(i_0 - 1, i_0 - 2)$, ..., $S_(2, 1)$) и все получается.
]

#props(name: "Разложение определителя по строке")[
  Пусть $A in M_n(K)$, $1 <= i <= n$.
  Тогда $ abs(A) = a_(i 1) A_(i 1) + a_(i 2) A_(i 2) + dots a_(i n) A_(i n). $
]

#proof[
  Посмотрим на $i$ строку и воспользуемся линейностью определителя, чтобы представить $ abs(A) = sum_(j=1)^n det(
    a_(11), a_(12), ..., a_(1n-1), a_(1n);
    a_(21), a_(22), ..., a_(1n-1), a_(2n);
    dots.v, dots.v, dots.down, dots.v, dots.v;
    0, ..., a_(i j), ..., 0;
    dots.v, dots.v, dots.down, dots.v, dots.v;
    a_(n 1), a_(n 2), ..., a_(n n-1), a_(n n);
    ) = sum_(j=1)^n a_(i j)A_(i j) $
    Слагаемые в сумме - следствие предыдущей леммы.
]

#follow(name: "Разложение определителя по стобцу")[
  $abs(A) = a_(1 j) A_(1 j) + dots + a_(n j) A_(n j)$
]

#th[
  $A in op("GL")_n(K) iff abs(A) != 0$.
]

#proof[
  $imply A in op("GL")_n(K) arrow.double.r exists B in M_n(K): A B = E arrow.double.r abs(A B) = abs(E) = 1 = abs(A) mul abs(B) arrow.double.r abs(A) eq.not 0$

  $since$ Разложим матрицу: $A = P D Q$, так как $P$ и $Q$ обратимы $D = P^(-1)A Q^(-1) arrow.double.r abs(D) = abs(P^(-1)) * abs(A) * abs(Q^(-1)) eq.not 0,$ так как $P, Q$ обратимы.
  
  Вспомним, что $D = mat(
    E_r, 0;
    0, 0;
  )$ и $r = n$, так как определитель не равен нулю, поэтому $D = E_n arrow.double.r A = P Q arrow.double.r$ А обратима, как произведение обратимых.
]

#lemma[
  Пусть $A in M_n(K)$, $i != j$.
  Тогда $ a_(i 1) A_(j 1) + a_(i n) A_(j n) + dots a_(i n) A_(j n) = 0. $
]

#proof[
  Рассмотрим $A'$, которая совпадает с $A$ везде, кроме $j$ строчки, а в $j$ строчке стоит $i$ строчка матрицы $A$. $abs(A')=0,$ так как $i$ и $j$ строчки сопадают. С другой стороны, если разложить $abs(A')$ по $j$ строке, мы получим $ abs(A')= a_(i 1)A_(j 1) + a_(i 2)A_(j 2) + ... + a_(i n)A_(j n) = 0, $ так как $j$ строка совпадает с $i$, а дополнения совпадают с дополнениями элементов $j$ строки матрицы A (поскольку алгебраические дополнения элементов $j$ строки не зависят от того, что именно стоит в
j-ой строке).
]

#def[
  Пусть $A in M_n(K)$. _Матрицей, взаимной к $A$_ называется $ accent(A, "~") = (A_(i j))^T in M_n(K). $
]

#follow[
  $ A mul accent(A, "~") = accent(A, "~") mul A = abs(A) mul E_n. $
]

#follow[
  Пусть $A in op("GL")_n(K)$.
  $ A^(-1) = abs(A)^(-1) accent(A, "~"). $
]

#th(name: "Крамера")[
  Рассмотрим систему линейных уравнений $(A bar b)$, $A in M_n(K)$.
  Тогда $abs(A) != 0 iff "Эта система совместина и определенная"$.
]

#let GL = math.op("GL")

#proof[
  - "$imply$": $A in GL_n(K) imply A x = b iff A^(-1) A x = A^(-1) b iff x = A^(-1) b$. 

  - "$since$" Приведем СЛУ к ступенчатому виду элементарными преобразованиями, таким образом $(A bar b)$ - ступенчатая. Если ведущий элемент последней ненулевой строки оказался в последнем слобце (расширенной матрицы, то есть в дополнительном столбце), то система не совместна, что противоречил условию. Значит, так как система уравнений определенная, ширина всех ступенек равна 1 (иначе найдется свободная переменная). Значит получилась верхнетреугольная матрица, все элементы на диагонали которой не равны 0, а значит $abs(A) != 0$.

  $ A = mat(
    a_1, ..., *;
    dots.v, dots.down, dots.v;
    0, ..., a_n;
  ), space a_1, ..., a_n eq.not 0 imply abs(A) = a_1...a_n. $
]












