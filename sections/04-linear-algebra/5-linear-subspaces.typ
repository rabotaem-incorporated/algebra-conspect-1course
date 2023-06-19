#import "../../utils/core.typ": *

== Системы образующих. Линейные подпространства.

#ticket[Система образующих линейного пространства, свойства. Подпространство]

#def[
  $V$ --- векторное пространство над $K$.\ $v_1, v_2, ..., v_m in V$, $alpha_1, ..., alpha_m in K$.

  _Линейной комбинацией_ $v_1, ..., v_m$ с коэффициентами $alpha_1, ..., alpha_m$ называется
  $ alpha_1 v_1 + alpha_2 v_2 + ... + alpha_m v_m $
]

#def[
  Линейная оболочка $v_1, ..., v_m$:
  $ Lin(v_1, ..., v_m) = {alpha_1v_1 + ... + alpha_m v_m bar alpha_1, ..., alpha_m in K} $
]

#example[
  $ V = {vec(alpha, beta, gamma) bar alpha+beta+gamma = 0} = {vec(alpha, beta, -alpha-beta) bar alpha, beta in K} $
]

#def[
  Если $Lin(v_1, ..., v_m) = V$, такая линейная оболочка называется $v_1, ..., v_m$ --- _система образующих_, или _порождающее семейство_ пространства $V$.
]

#pr[
  Пусть $W = Lin(v_1, ..., v_m)$ и $v_m in Lin(v_1, ..., v_(m - 1))$, то есть является линейной комбинацией предыдущих. Тогда $W = Lin(v_1, ..., v_(m - 1))$.
]

#proof[
  - "$supset$": Очевидно.

  - "$subset$": 
  $ 
    w in W ==> \ w = alpha_1v_1 + ... + alpha_m v_m, space v_m = beta_1 v_1 + ... + beta_(m-1)v_(m-1) ==> \
    w = alpha_1v_1 + ... + alpha_(m-1)alpha_(m-1) + alpha_m(beta_1 + ... + beta_(m-1)v_(m-1)) =\ (alpha_1 + a_m beta_1)v_1 + ... + (alpha_(m-1) + alpha_m beta_(m-1))v_(m-1) in Lin(v_1, ..., v_(m-1))
  $
]

#def[
  Пространство называется _конечномерным_, если у него есть конечная система образующих.
]

#example[
  - $M_(m, k)(K) = Lin(e_(i j) bar 1 <= i <= m, 1 <= j <= n)$ --- конечномерное,
  - $RR_(>0)$ --- конечномерное,
  - $K[x]$ --- не конечномерное.
]

#def[
  $V$ --- линейное пространство, $W subset V$.
  
  $W$ называется _линейным подпространством_ $V$, если 
  + $0 in W$
  + $forall w_1, w_2 in W space w_1 + w_2 in W$
  + $forall alpha in K space forall w in W: alpha w in W$

  $W < V$ --- $W$ подпространство $V$
]

#pr[
  Пусть $W$ --- линейное подпространство $V$. Тогда $W$ - является линейным пространством относительно сложения и умножения на скаляр в пространстве $V$, ограниченные на $W$.
]

#proof[
  
  Свойства 5, 6, 7 линейного пространства следуют из свойств 2 и 3 линейного подпространства.

  Свойства 1, 4 абелевой группы так же следуют из 2 и 3, нужно проверить только существование нуля и обратного элемента.

  Нуль (свойство 2) существует по свойству 1.

  Обратный элемент (свойство 3) есть так как $w in W imply^3 (-1) mul w in W imply -w in W$.
]

#example[
  $v_1, ..., v_m imply Lin(v_1, ..., v_m) < V$
]

#lemma[
  Пусть $W < V$, $w_1, ..., w_m in W$. Тогда $Lin(w_1, ..., w_n) subset W$.
] 

#proof[
  Следует из определения линейной оболочки и свойств 2 и 3 линейного подпространства.
]
