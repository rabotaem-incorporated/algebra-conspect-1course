#import "../../utils/core.typ": *

== Линейные пространства. Основные определния

#ticket[Линейное пространство. Определение, примеры, простейшие свойства]

#def[
  Пусть K --- поле. Говорят, что _линейное пространство_ над полем задано, если заданы:

  - Множество $V$,
  - Операция $V times V limits(-->)^+ V$, называемая сложением,
  - Операция $K times V limits(-->)^dot V$, называемая умножением на скаляр,

  такие, что выполняются следющие условия:
  
  - $(V, +)$ - абелева группа (ассоциативность, нейтральный, обратный, коммутативность),
  - $forall alpha in K space forall v_1, v_2 quad alpha(v_1 + v_2) = alpha v_1 + alpha v_2$,
  - $forall a_1, a_2 in K space forall v in V quad (alpha_1 + alpha_2)v = alpha_1v + alpha_2v$,
  - $forall alpha_1, alpha_2 in K space forall v in V quad (alpha_1alpha_2)v = alpha_1(alpha_2v)$.

  Элементы множества $V$ называют _векторами_, элементы множества $K$ --- _скалярами_.

  Понятия _векторное пространство_ и _линейное пространство_ эквиваленты.
]

#examples[
  + $K^n = M_(n, 1)(K)$ --- арифметическое $n$-мерное пространство над $K$ 
    
  + $V = {vec(alpha, beta, gamma) bar alpha + beta + gamma = 0} subset K^3$
  
  + Не линейное пространство: $V' = {vec(alpha, beta, gamma) bar alpha + beta + gamma = 1} subset K^3$

  + $V = K[x]$
  
  + $V = C[0, 1]$

  + $K = RR, space.quad v_1 plus.square v_2 = v_1v_2 \
    V = RR_+ space.quad alpha dot.square v = v^alpha$

  + $&K = FF_2 = ZZ slash 2 ZZ, space.quad M - "Множество", space.quad V = 2^M.\
      &v_1 + v_2 = v_1 triangle.t.small v_2, space.quad
      1 mul v = v, space.quad 0 mul v = empty.$      
]

#lemma[
  + $0 mul v = overline(0).$
  + $alpha mul overline(0) = overline(0)$.
  + $alpha v = overline(0) ==> alpha = 0 or v = overline(0)$.
  + $(-1) mul v = -v$.
]

#proof[
  + $0 + 0 = 0$ в $K$  
    
    $0 mul v + 0 mul v = (0 + 0) mul v = 0 mul v iff $ 
    
    $0 mul v + 0 mul v + (-0 mul v) = 0 mul v + (-0 mul v) = overline(0) = 0$

  + $0 + 0 = 0$ в $V$, далее аналогично 1.

  + $alpha != 0 ==> alpha^(-1) (alpha v) = alpha^(-1) mul overline(0) ==> v = overline(0)$.

  + $(-1) mul v + 1 mul v = (-1 + 1) mul v = 0 mul v = overline(0) ==> (-1) mul v = -v$.
]

