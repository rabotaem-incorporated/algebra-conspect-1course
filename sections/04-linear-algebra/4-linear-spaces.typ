#import "../../utils/core.typ": *

== Линейные пространства. Основные определния

#def[
  Пусть K --- поле. Говорят, что _Линейное Пространство_ над полем задано, если заданы:

  - Множество $V$
  - Операция $V times V limits(arrow.long)^+ V$, называемая сложением
  - Операция $K times V limits(arrow.long)^mul V$, называемая умножением на скаляр

  такие, что выполняются следющие условия:
  - $(V, +)$ - абелева группа (4 свойства одновременно)
  - $forall alpha in K space.quad forall v_1, v_2 space.quad alpha(v_1 + v_2) = alpha v_1 + alpha v_2$
  - $forall a_1, a_2 in K space forall v in V space (alpha_1 + alpha_2)v = alpha_1v + alpha_2v$
  - $forall alpha_1, alpha_2 in K space forall v in V: (alpha_1alpha_2)v = alpha_1(alpha_2v)$

  Элементы множества $V$ называют _Векторами_, элементы множества $K$ --- _Скалярами_.

  Понятия _Векторное пространство_ и _Линейное пространство_ эквиваленты.
]

#example[
  - $v = M_(m, n)(K) space K^n = M_(n, 1)(K)$ --- арифметическое $n$-мерное пространство над $K$ 
    #h(11.6em) // костыль
    
  - $ V = {vec(alpha, beta, gamma) bar alpha + beta + gamma = 0} subset K^3 $
  
  - *Не линейное пространство:*
  
  $ V' = {vec(alpha, beta, gamma) bar alpha + beta + gamma = 1} subset K^3 $
  - $ V = K[x] $
  
  - $ V = C[0, 1] $ #h(1fr)

  - $ K = RR, space.quad v_1 plus.square v_2 = v_1v_2 \
    V = RR_+ space.quad alpha dot.square v = v^alpha $

  - $ &K = FF_2 = ZZ slash 2 ZZ, space.quad M - "Множество", space.quad V = 2^M.\
      &v_1 + v_2 = v_1 triangle.t.small v_2, space.quad
      1 mul v = v, space.quad 0 mul v = empty.
    $      
]

#lemma[
  + $0 mul v = overline(0).$
  + $alpha mul 0 = 0$.
  + $alpha v = 0 imply alpha = 0 or v = 0$.
  + $(-1) mul v = -v$.
]

#proof[
  + $0 + 0 = 0$ в $K$ \ $space 0 mul v + 0 mul v = (0 + 0) mul v = 0 mul v  iff 0 mul v + 0 mul v + (-0 mul v) = 0 mul v + (-0 mul v) = 0$
  + $0 + 0 = 0$ в $V$, далее аналогично 1.
  + $alpha != 0 imply alpha^(-1) (alpha v) =alpha^(-1) mul 0 imply v = 0$.
  + $(-1) mul v + 1 mul v = (-1 + 1) mul v = 0 mul v = 0 imply (-1) mul v = -v$.
]
