#import "../../utils/core.typ": *

== Перестановки

#ticket[Разложение перестановки в произведение транспозиций и элементарных  транспозиций]

#def[
  $M$ --- множество. _Перестановкой_ множества $M$ называется биекция на себя.

  $S(M)$ = ${"перестановка" M}$

  $S(M) times S(M) -> S(M)$

  $(g, f) |-> g compose f$
]

#pr[
  $(S(M), compose)$ --- группа.
]

#proof[
  + Ассоциативность очевидна.

  + $id_M$ --- нейтральный элемент.
  
  + $f in S(M) ==> f^(-1) in S(M)$ --- обратный элемент.
]

#def[
  $S_n$ --- _симметрическая группа_ степени $n$ _(группа перестановок $n$-элементного множества)_.
]

#notice[
  $abs(S_n) = n!$
]

#example[
  $S_3 = {(1, 2, 3), (1, 3, 2), (2, 1, 3), (2, 3, 1), (3, 1, 2), (3, 2, 1)}$
]

#def[
  _Циклы_ --- перестановки, которые переводят некое подмножество элементов "по кругу".

  Более формально: _циклом_ называется $sigma in S$ такая что: 
  $ sigma(i_1) = i_2, space sigma(i_2) = i_3, space ..., sigma(i_(k - 1)) = i_k, space sigma(i_k) = i_1 $
  а так же $sigma(i_j) = i_j$ для всех $j in.not {1, 2, ..., k}$, где $k >= 2$ --- _длина цикла_. 
]

#examples[
  - $(123)$ - перестановка $mat(1, 2, 3; 2, 3, 1)$,

  - $(34)$ - перестановка $mat(1, 2, 3, 4; 1, 2, 4, 3)$.
]

#def[
  Циклы $(i_1 i_2 ... i_k)$ и $(j_1 j_2 ... j_l)$ называются _независимыми_, если $forall r, s : i_r eq.not j_s$.
]


#pr[
  Любая перестановка является произведением нескольких попарно независимых циклов.
]

#proof[
  $i, sigma(i), sigma(sigma(i)), ...$ все различны, так как $sigma$ --- биекция, значит это --- независимый цикл.
]

#def[
  Цикл длины 2 называется _транспозицией_.
]

#def[
  Транспозиция $(i, i + 1)$ называется _элементарной транспозицией_.
]

#pr[
  Любой цикл $(i_1 i_2 ... i_k)$ раскладывается в произведение транспозиций $(i_1 i_2) dot.c (i_2 i_3) dot.c ... dot.c (i_(n - 1) i_n)$.
]

#pr[
  Любая перестановка является произведением элементарных транспозиций.
]

#proof-left-to-the-reader()

#ticket[Чётность и знак перестановки]

#def[
  _Инверсией_ в перестановке $sigma$ называется пара $(i, j)$, $i < j$ для которой $sigma(i) > sigma(j)$.
  Число инверсий в перестановке обозначается $Inv(sigma)$.
]

#example[
  $Inv((123)) = 2$.
]

#def[
  Перестановка называется _четной_, если в ней четное число инверсий, иначе _нечетной_.
]

#def[
  _Знаком_ перестановки называется $ sgn(sigma) = cases(1\, & "если" sigma "четна", -1\, space & "если" sigma "нечетна") $
]

#lemma[
  Если перестановку умножить слева на транспозицию, то ее знак поменяется на противоположный, то есть $sgn((i, j) compose sigma) = -sgn(sigma)$.
]

#proof[
  Четность числа инверсий с участием $sigma(i)$ и $sigma(j)$ не изменится, так как все элементы между $i$ и $j$ поменяют число инверсий четное число раз. Соответственно, изменится лишь инверсия между $i$ и $j$.
]

#follow[
  Четность перестановки равна четности количества транспозиций в ее разложении.
]

#proof[
  $sgn((i_1 j_1)(i_2 j_2)...(i_k j_k)) = (-1)^k$
]

#exercise[
  Доказать что $sgn(sigma compose (i, j)) = -sgn(sigma)$.
]

#follow[
  Пусть $sigma, tau in S_n$, тогда:

  $sgn(sigma tau) = sgn(sigma) dot.c sgn(tau)$
 
  $sgn(sigma^(-1)) = sgn(sigma)$
]

#def[
  _Множество четных перестановок_ $A_n = {sigma in S_n bar space.hair sgn sigma = 1}$. 
  
  Можно заметить, что $A_n$ --- замкнуто относительно композиции, а так как $sgn(A_n) = sgn(A_n^(-1))$, $A_n$ --- подгруппа $S_n$.
]

#pr[
  Пусть $n >= 2$. Тогда $abs(A_n) = (n!) / 2$.
]

#proof[
  Рассмотрим
  $
  A_n &limits(-->)^Phi S_n without A_n & #h(3em) S_n without A_n &limits(-->)^Psi A_n \
  sigma & arrow.long.bar sigma (1 2) & sigma & arrow.long.bar sigma(1 2)
  $
  Заметим, что $ cases(Phi compose Psi = sigma(1 2)(1 2) = id_(A_n), Psi compose Phi = id_(S_n without A_n)) $ Значит $Phi$ --- биекция и $abs(S_n without A_n) = abs(A_n) ==> abs(A_n) = (n!) / 2$.
]
