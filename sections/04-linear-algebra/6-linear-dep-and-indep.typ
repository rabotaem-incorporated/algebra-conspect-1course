#import "../../utils/core.typ": *

== Линейная зависимость и независимость

#def[
  Набор $v_1, ..., v_n in V$ называется _Линейно зависимым семейством_ (ЛЗС), если $exists alpha_1, ..., alpha_m in K space.quad alpha_1 v_1 + ... + alpha_m v_m = 0$ и не все $alpha$ равны 0.

  Иначе такой набор называется _Линейно независимым семейством_ (ЛНС).
]

#notice[
  $Lin(empty) = {0}$.
]

#props[
  $v_1, ..., v_m in V$, тогда равносильны:
  + $v_1, ..., v_m$ - ЛЗС
  + $exists j: 1 lt.eq j lt.eq m space v_j in Lin(v_1, ..., accent(v, "^")_j, ..., v_m)$
  + $exists j: 1 lt.eq j lt.eq m space v_j in Lin(v_1, ..., v_(j-1))$
]

#proof[
   - "$3 imply 2$": очевидно.
   - "$2 imply 1$": Пусть $v_j = alpha_1 v_1 + ... + accent(alpha_j v_j, "^") + ... + alpha_m v_m$. Тогда $alpha_1 v_1 + ... + (-1) mul v_j + ... + alpha_m v_m = 0$ и это нетривиальная линейная комбинация.
   - "$1 imply 3$": $alpha_1 v_1 + ... + alpha_m v_m = 0$, $exists j space.quad alpha_j != 0$. Возмем максимальное такое $j$.
     Выкинем все слагаемые с индексом меньше $j$ и поделим на $alpha_j$:
    $ 
    v_j + alpha_(j + 1) / alpha_j v_(j+1) ... + alpha_m / alpha_j v_m = 0 
    imply v_j = -alpha_(j + 1) / alpha_j v_(j+1) ... - alpha_m / alpha_j v_m.
    $
]

#props[
  Пусть $v_1, ..., v_n$ - ЛЗC, тогда $v_1, ..., v_n, v$ - тоже ЛЗC.
]

#proof[
  Очевидно.
]

#follow[
  Набор векторов, содержаший $0$ --- ЛЗС
]

#proof[
  $1 mul 0 = 0 #since ()$
]

#th(name: "О линейной зависимости линейных комбинаций")[
  Пусть $v_1, ..., v_m in V$, $w_1, ..., w_n in Lin(v_1, ..., v_m)$. Тогда если $n > m$, то $w_1, ..., w_n$ --- ЛЗС.
]

#proof[
  Индукция по $m$.

  База $m = 0$: $w_1 = Lin() ==> w_1 = 0 ==> w_1, ..., w_n "- ЛЗС"$.

  Переход $m ~~> m + 1$:

  $w_1, ..., w_n in Lin(v_1, ..., v_(m + 1))$, значит 
  $
  w_1 = alpha_(1, 1) v_1 + ... + alpha_(1, m + 1) v_(m + 1) \
  w_2 = alpha_(2, 1) v_1 + ... + alpha_(2, m + 1) v_(m + 1) \
  ... \
  w_n = alpha_(n, 1) v_1 + ... + alpha_(n, m + 1) v_(m + 1) \
  $

  Рассмотрим случаи. Если $alpha_(1, 1) = ... = alpha(n, m + 1) = 0$, то 
  $w_1, ..., w_n in Lin(v_1, ..., v_m)$ и по предположению, $w_1, ..., w_n$ --- ЛЗС.

  Иначе найдется $j$ такой что $a_(j, m + 1) != 0$, не умаляя общности,
  $j = n$.

  $ w_i - alpha_(i, m + 1) / alpha_(n, m + 1) w_n in Lin(v_1, ..., v_m), i in 1..n - 1. $
  $n - 1 > m$, поэтому по индукционному предположению, ${w_i - alpha_(i, m + 1) / alpha_(n, m + 1) w_n bar i in 1..n - 1}$ --- ЛЗС.

  Тогда найдутся $beta_1, ..., beta_(n - 1) in K$, (среди которых не все равны 0), такие, что 
  $ sum_(i = 1)^(n - 1) beta_i (w_i - alpha_(i, m + 1) / alpha_(n, m + 1) w_n) = 0. $
  Значит $w_1, ..., w_n$ --- ЛЗС.
]
