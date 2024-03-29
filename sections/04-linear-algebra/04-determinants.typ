#import "../../utils/core.typ": *

== Определители

#ticket[Определение определителя. Определитель транспонированной матрицы]

#notice[
  Мы знаем, что матрицы тесно связаны с системами линейных уравнений и мы хотим знать, когда системы разрешимы единственным образом, когда не имеют решений, и когда имеют бесконечно много решений.
]

#def[
  Системы линейных уравнений подразделяются на:
  - _Несовместные_ --- не имеют решений,
  - _Совместные определенные_ --- имеют единственное решение,
  - _Совместные неопределенные_ --- имеют бесконечно много решений.
]

#example[
  Рассмотрим систему с двумя неизвестными в общем случае.

  $ cases(
    a_(11) x_1 + a_(12) x_2 = b_1,
    a_(21) x_1 + a_(22) x_2 = b_2,
  ) $

  Оказывается, что она совместима и определена тогда и только тогда, когда $ a_11 a_22 - a_21 a_12 != 0 $

  Отсюда вытекает понятие определителя матрицы 2 на 2:

  $ det(a_11, a_12; a_21, a_22) = a_11 a_22 - a_21 a_12 $
]

#def[
  Пусть $A in M_n (K)$, $K$ --- поле, $A = (a_(i j))$

  _Определителем_ или _детерминантом_ $A$ называется

  $ Det(A) = abs(A) = limits(sum)_(sigma in S_n) sgn(sigma) a_(1 sigma_1) a_(2 sigma_2) ... a_(n sigma_n). $
]

#props[
  1. $det(A) = det(A^T)$
]

#proof[
  $
    det(A^T) = 
    sum_(sigma in S_n) sgn sigma dot.c product_(i = 1)^n a_(underbrace(sigma(i) i, #[отраженные\ координаты])) &=\
    sum_(sigma in S_n) sgn sigma dot.c product_(i = 1)^n a_(underbrace(i sigma^(-1)(i), #[то же самое\ в другом порядке])) &=\
    sum_(sigma in S_n) sgn underbrace(sigma^(-1), #[то же самое\ в другом порядке]) dot.c product_(i = 1)^n a_(i sigma^(-1)(i)) &=\
    sum_(sigma in S_n) sgn sigma dot.c product_(i = 1)^n a_(i sigma(i)) &= det(A).\
  $
]

#ticket[Линейность определителя по строкам и столбцам]

#props[
  2. $A = mat(delim: "[", A_1; dots.v; A_i' + A_i'';  dots.v; A_n) ==> det(A) = det(A_1; dots.v; A_i'; dots.v; A_n) + det(A_1; dots.v; A_i''; dots.v; A_n)$

  3. $A = mat(delim: "[", A_1; dots.v; alpha A_i; dots.v; A_n) ==> det(A) = alpha det(A_1; dots.v; A_i; dots.v; A_n)$

  4. $A = mat(delim: "[", alpha A_1; dots.v; alpha A_i; dots.v; alpha A_n) ==> det(A) = alpha^n det(A_1; dots.v; A_i; dots.v; A_n)$
]

#proof[
  2. суммируем два определителя по $a_(i phi(i))$

  3. выносим $alpha$ за знак суммы из $a_(i phi(i))$

  4. через пункт 3
]

#ticket[Кососимметричность определителя по строкам и столбцам]

#props[
  5. $A = mat(delim: "[", A_1; dots.v; A_n), A_i = A_j ==> det(A) = 0$

  6. $A = mat(delim: "[", A_1; dots.v; A_i; dots.v; A_n), B = mat(delim: "[", A_1; dots.v; A_i + alpha A_j; dots.v; A_n) ==> det(A) = det(B)$

  7. $A = mat(delim: "[", A_1; dots.v; A_i; dots.v; A_j; dots.v; A_n), B = mat(delim: "[", A_1; dots.v; A_j; dots.v; A_i; dots.v; A_n) ==> det(A) = -det(B)$
]

#proof[
  5. на любую перестановку $phi$ найдется парная, где поменяны $i$ и $j$, и определитель будет противоположным

  6. $ det(B) = det(A) + alpha dot det(mat(delim: "[", A_1; dots.v; A_j; dots.v; A_j; dots.v; A_n)) = det(A) $

  7. аналогично пункту 5
]
