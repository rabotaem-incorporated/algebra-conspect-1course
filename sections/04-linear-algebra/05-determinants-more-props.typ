#import "../../utils/core.typ": *

== Дальнейшие свойства определителя

#ticket[Определитель блочно-треугольной матрицы]

#pr[
  Пусть
  $A = mat(delim: "[", B, X; 0, C),$ где матрицы $B$ и $C$ квадратные.

  Тогда $det(A) = det(B) mul det(C)$.

  Такая матрица $A$ называется _блочно-треугольной матрицей_.
]

#proof[
  $ det(A) = sum_(sigma in S_n) sgn sigma mul product_(i = 1)^n a_(i sigma(i)) $
  Заметим, что все перестановки которые переводят строки из $B$ в $0$ обращают произведение в 0 и наоборот. Рассмотрим остальные $sigma = pi mul rho$.
  $ det(A) &= 
  sum_(pi in S_k \ rho in S_(n - k)) sgn(pi) mul sgn(rho) mul a_(1 pi_1) dots a_(k pi_k) mul a_(k + 1 rho_1) dots a_(n rho_(n - k)) = \
  &= (sum_(pi in S_k) sgn(pi) a_(1 pi_1) dots a_(k pi_k)) mul (sum_(rho in S_(n - k)) sgn(rho) a_(k rho_1) dots a_(n rho_(n - k))) = det(B) mul det(C).
  $
]

#follow[
  Пусть
  $ A = mat(a_11, *, dots.c, *; 0, a_22, dots.c, *; dots.v, dots.v, dots.down, dots.v; 0, 0, dots.c, a_(n n)) $
  Тогда $det(A) = a_11 mul a_22 mul ... mul a_(n n)$.
]

#proof[
  Индукция по $n$.
]

#ticket[Определитель произведения матриц]

#pr[
  Пусть $A, B in M_(n)(K)$. Тогда $Det(A mul B) = det(A) mul det(B)$.
]

#proof[
  Применим PDQ разложение $A$, будем по одному рассматривать что происходит при применении преобразования слева и справа по индукции.

  + $abs(T_(i j)(alpha) A'B) = abs(A'B) = abs(A') mul abs(B) = abs(T_(i j)(alpha) A') abs(B)$
  
  + #sym.dots Еще 4 случая: $S_(i j)$, $D_i (alpha)$, $E_n$, окаймленная-единичная матрица.

  #TODO[Расписать случаи]
]

#ticket[Определитель матрицы с почти нулевой строкой]

#def[
  _Минор_ $M_(i j)$ --- определитель матрицы из которой вырезали $i$-ю строчку и $j$-й столбец.
]

#def[
  _Алгебраическое дополнение элемента в позиции_ $(i, j)$: $A_(i j) = (-1)^(i + j) M_(i j)$.
]

#lemma(name: "Об определителе матрицы с почти нулевой строкой")[
  Пусть $A in M_n (K)$, $1 <= i_0, j_0 <= n$, $A = (a_(i j))$, $a_(i_0 j) = 0$ при всех $j != j_0$.
  Тогда $det(A) = a_(i_0 j_0) A_(i_0 j_0)$.
]

#proof[
  Пусть $i_0 = j_0 = 1$.
  Посчитаем определитель по определению. Все произведения, соответствующие перестановкам $sigma: sigma(1) != 1$, равны нулю. Оставшиеся произведения в сумме дадут $a_11 M_11$, так как знаки перестановок будут такими же.

  Общий случай получается, если применить элементарные преобразования $S_(i, i-1)$ над строками и столбцами. Знак суммарно поменятеся $i_0 + j_0 - 2$ раза, значит $det(A) = a_(i_0 j_0) A_(i_0 j_0)$
]

#ticket[Разложение определителя по строке (столбцу)]

#th(name: "Разложение определителя по строке")[
  Пусть $A in M_n (K)$, $1 <= i <= n$.

  Тогда $ det(A) = a_(i 1) A_(i 1) + a_(i 2) A_(i 2) + dots a_(i n) A_(i n). $
]

#proof[
  Посмотрим на $i$ строку и воспользуемся линейностью определителя, чтобы представить $ det(A) = sum_(j=1)^n det(
    a_(11), a_(12), ..., a_(1n-1), a_(1n);
    a_(21), a_(22), ..., a_(1n-1), a_(2n);
    dots.v, dots.v, dots.down, dots.v, dots.v;
    0, ..., a_(i j), ..., 0;
    dots.v, dots.v, dots.down, dots.v, dots.v;
    a_(n 1), a_(n 2), ..., a_(n n-1), a_(n n);
    ) = sum_(j=1)^n a_(i j)A_(i j) $
    Слагаемые в сумме --- следствие предыдущей леммы.
]

#follow(name: "Разложение определителя по стобцу")[
  $det(A) = a_(1 j) A_(1 j) + dots + a_(n j) A_(n j)$
]

#proof[
  Аналогично разложению определителя по строке.
]

#ticket[Критерий обратимости матрицы в терминах определителя]

#th[
  $A in GL_n (K) <==> det(A) != 0$.
]

#proof[

  - "#imply": 
  
  $A in GL_n (K) ==> exists B in M_n (K): A B = E ==> abs(A B) = abs(E) = 1 = abs(A) mul abs(B) ==> abs(A) eq.not 0$

  - "#since": 
  
  Посмотрим на PDQ разложение матрицы $A = P D Q$. $P$ и $Q$ обратимы, значит $D = P^(-1)A Q^(-1) ==>$ 
  
  $det(D) = det(P^(-1)) mul det(A) mul det(Q^(-1)) eq.not 0,$ так как $P, Q$ обратимы.
  
  Вспомним, что $D = mat(
    E_r, 0;
    0, 0;
  )$ и $r = n$, так как определитель не равен нулю, поэтому 
  
  $D = E_n ==> A = P Q ==> А$ обратима, так как является произведением обратимых.
]

#ticket[Взаимная матрица. Явный вид обратной матрицы]

#lemma(name: "О фальшивом разложении определителя")[
  Пусть $A in M_n (K)$, $i != j$.
  Тогда $ a_(i 1) A_(j 1) + a_(i 2) A_(j 2) + ... + a_(i n) A_(j n) = 0. $
]

#proof[
  Рассмотрим $A'$, которая совпадает с $A$ везде, кроме $j$ строчки, а в $j$ строчке стоит $i$ строчка матрицы $A$. Можно увидеть, что $abs(A')=0,$ так как $i$ и $j$ строчки сопадают. С другой стороны, если разложить $abs(A')$ по $j$ строке, мы получим $ abs(A')= a_(i 1)A_(j 1) + a_(i 2)A_(j 2) + ... + a_(i n)A_(j n) = 0, $ так как $j$ строка совпадает с $i$, а дополнения совпадают с дополнениями элементов $j$ строки матрицы A (поскольку алгебраические дополнения элементов $j$ строки не зависят от того, что именно стоит в
j-ой строке).
]

#def[
  Пусть $A in M_n (K)$. _Матрицей, взаимной к $A$_ называется транспонированная матрица алгебраических дополнений.
  
  Более формально: $ "adj" A = adj(A) = (A_(i j))^T in M_n (K). $
]

#pr[
  $ A mul adj(A) = adj(A) mul A = det(A) mul E_n. $
]

#proof[
  $ (A mul adj(A))_(i j) = (A mul (A_(i j))^T) = a_(i 1) A_(j 1) + a_(i 2) A_(j 2) + ... + a_(i n) A_(j n) = cases(det(A)\, & space "если" i = j\,, 0\, & space "иначе".) $

  Для $adj(A) mul A$, аналогично, только с разложением по столбцу.
]

#follow[
  Пусть $A in GL_n (K)$.
  $ A^(-1) = adj(A) / det(A). $
]

#proof[
  $(A mul adj(A)) / det(A) = E_n ==> adj(A) / det(A) = E_n mul A^(-1)$
]

#ticket[Теорема Крамера]

#th(name: "Крамера")[
  Рассмотрим систему линейных уравнений $(A bar b)$, $A in M_n (K)$.
  Тогда $det(A) != 0 <==> "Эта система совместная определенная"$.
]

#proof[
  - "#imply": $A in GL_n (K) imply A x = b iff A^(-1) A x = A^(-1) b iff x = A^(-1) b$. 

  - "#since": Приведем СЛУ к ступенчатому виду элементарными преобразованиями, таким образом $(A bar b)$ --- ступенчатая. Если ведущий элемент последней ненулевой строки оказался в последнем слобце расширенной матрицы (то есть в дополнительном столбце), то система несовместна, что противоречит условию. Значит, так как система уравнений определенная, ширина всех ступенек равна 1 (иначе найдется свободная переменная). Значит получилась верхнетреугольная матрица, все элементы на диагонали которой не равны 0, а значит $det(A) != 0$.

  $ A = mat(
    a_1, ..., *;
    dots.v, dots.down, dots.v;
    0, ..., a_n;
  ), space a_1, ..., a_n eq.not 0 ==> det(A) = a_1 dot ... dot a_n. $
]
