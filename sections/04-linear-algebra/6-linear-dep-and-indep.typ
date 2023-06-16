#import "../../utils/core.typ": *

== Линейная зависимость и независимость

#ticket[Линейно зависимые семейства, свойства]

#def[
  Набор $v_1, ..., v_n in V$ называется _линейно зависимым семейством_ (ЛЗС), если $exists alpha_1, ..., alpha_m in K space.quad alpha_1 v_1 + ... + alpha_m v_m = 0$ и не все $alpha$ равны 0.

  Иначе такой набор называется _линейно независимым семейством_ (ЛНС).
]

#notice[
  $Lin(empty) = {0}$.
]

#pr[
  $v_1, ..., v_m in V$, тогда равносильны:
  + $v_1, ..., v_m$ --- ЛЗС
  + $exists j: 1 <= j <= m space.quad v_j in Lin(v_1, ..., hat(v)_j, ..., v_m)$
  + $exists j: 1 <= j <= m space.quad v_j in Lin(sq(v, j - 1))$
]

#proof[
   - "$3 => 2$": очевидно.

   - "$2 => 1$": Пусть $v_j = alpha_1 v_1 + ... + hat(alpha_j v_j) + ... + alpha_m v_m$. Тогда $alpha_1 v_1 + ... + (-1) mul v_j + ... + alpha_m v_m = 0$ и это нетривиальная линейная комбинация.

   - "$1 => 3$": $alpha_1 v_1 + ... + alpha_m v_m = 0$.
     
     Существует $j : alpha_j != 0$. Возмем максимальное такое $j$.
     Выкинем все слагаемые с индексом меньше $j$ и поделим на $alpha_j$:
    $ 
    v_j + alpha_(j + 1) / alpha_j v_(j+1) ... + alpha_m / alpha_j v_m = 0 
    ==> v_j = -alpha_(j + 1) / alpha_j v_(j+1) ... - alpha_m / alpha_j v_m.
    $
]

#pr[
  Пусть $sq(v)$ --- ЛЗC, тогда $sq(v), v$ --- тоже ЛЗC.
]

#proof[
  Очевидно.
]

#follow[
  Набор векторов, содержащий $0$ --- ЛЗС
]

#proof[
  Пусть $v_j = 0$, тогда поставим $a_j eq.not 0$, а остальные $a_i = 0$.
]

#ticket[Теорема о линейной зависимости линейных комбинаций]

#th(name: "О линейной зависимости линейных комбинаций")[
  Пусть $sq(v, m) in V$, $sq(w) in Lin(sq(v, m))$. Тогда если $n > m$, то $sq(w)$ --- ЛЗС.
]

#proof[
  Индукция по $m$.

  "База": $m = 0$: $w_1 = Lin(empty) ==> w_1 = 0 ==> sq(w)$ --- ЛЗС.

  "Переход": $m - 1 ~~> m$:

  $sq(w) in Lin(sq(v, m))$, значит 
  $
  w_1 = alpha_(1, 1) v_1 + ... + alpha_(1, m) v_(m) \
  w_2 = alpha_(2, 1) v_1 + ... + alpha_(2, m) v_(m) \
  dots.v \
  w_n = alpha_(n, 1) v_1 + ... + alpha_(n, m) v_(m) \
  $

  Рассмотрим случаи. Если $alpha_(1, m) = alpha_(2, m) = ... = alpha_(n, m) = 0$, то 
  $sq(w) in Lin(sq(v, m - 1))$ и по предположению индукции, $sq(w)$ --- ЛЗС.

  Иначе найдется $j$ такой что $a_(j, m) != 0$. Не умаляя общности, считаем $j = n$.

  Тогда $ w_i - alpha_(i, m) / alpha_(n, m) w_n in Lin(sq(v, m - 1)), space i in {1, ..., n - 1}, $
  так как мы занулили коэфицент при $v_m$.

  $n - 1 > m - 1$, поэтому по индукционному предположению, ${w_i - alpha_(i, m) / alpha_(n, m) w_n bar i in {1, ..., n - 1}}$ --- ЛЗС.

  Тогда найдутся $beta_1, ..., beta_(n - 1) in K$, (среди которых не все равны 0), такие, что 
  $ sum_(i = 1)^(n - 1) beta_i (w_i - alpha_(i, m) / alpha_(n, m) w_n) = 0. $
  Значит $w_1, ..., w_n$ --- ЛЗС.
]
