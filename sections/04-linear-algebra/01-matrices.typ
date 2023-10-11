#import "../../utils/core.typ": *

== Матрицы

#def[
    $R$ --- кольцо, $m, n in NN$

    Матрица $m times n$ над кольцом $R$ --- прямоугольная таблица

    $A = display(mat(
        a_(1 1), a_(1 2), ..., a_(1 n);
        a_(2 1), a_(2 2), ..., a_(2 n);
        dots.v, dots.v, dots.down, dots.v;
        a_(m 1), a_(m 2), ..., a_(m n);
    ))$, где $a_(i j) in R$

    Есть краткая запись $A = (a_(i j))_(i = 1, ..., m\ j = 1, ..., n) = (a_(i j))$
]

#denote[    
    Множество матриц $m times n$ над кольцом $R$ обозначается как $M_(m, n) (R)$

    Так же обозначают, как: $R^(m times n)$, $M(m, n, R)$, $M_(m times n) (R)$
]

Пусть $A, B in M_(m, n) (R)$ --- матрицы. $A = (a_(i j))$, $B = (b_(i j))$

Их суммой называется матрица $C = (c_(i j))$, где $c_(i j) = a_(i j) + b_(i j)$.

Пусть $A = (a_(i j)) in M_(m, n) (R)$, $B = (b_(i j)) in M_(n, p) (R)$

Их произведением называется матрица $C = (c_(i j)) in M_(m, p) (R)$, где $c_(i j) = sum_(k = 1)^n a_(i k) b_(k j)$

Пусть $c in R$, $A in M_(m, n) (R)$

Тогда $c dot A = (c dot a_(i j)) in M_(m, n) (R)$

#notice[
    По умолчанию $R$ --- коммутативное кольцо
]

#def[    
    Транспонированная матрица $A = (a_(i j)) in M_(m, n) (R)$ --- матрица $B = (b_(i j)) in M_(n, m) (R)$, где $b_(i j) = a_(j i)$

    Обозначается как $A^T$
]

#example[
    $display(mat(
        2, 0, -3;
        1, 5, 4;
    ))^T = display(mat(
        2, 1;
        0, 5;
        -3, 4;
    ))$
]

#def[    
    Матрица $A = (a_(i j)) in M_(m, n) (R)$ --- квадратная, если $m = n$

    Обозначается как $A in M_(n) (R)$
]

#th(name: [Свойства операций над матрицами])[
    + $A + (B + C) = (A + B) + C$
    
    + $0 = (0)$, тогда $A + 0 = 0 + A = A$
    
    + Для любой $A$ есть $-A$, такая что $A + (-A) = (-A) + A = 0$
    
    + $A + B = B + A$
    
    + #[
        $(A B)C = A(B C)$, нужно чтобы $A in M_(m, n) (R)$, $B in M_(n, p) (R)$, $C in M_(p, q)(R)$
    
        Обе матрицы принадлежат $M_(m, q) (R)$
    ]

    + $A (B + C) = A B + A C$
    
    + $(B + C) A = B A + C A$

    + $(lambda + mu) A = lambda A + mu A, space lambda, mu in R$
    
    + $lambda(A + B) = lambda A + lambda B, space lambda in R$
    
    + $(lambda A) B = lambda (A B) = A(lambda B), space lambda in R$
    
    + $(lambda mu) A = lambda (mu A), space lambda, mu in R$
    
    + $(A + B)^T = A^T + B^T$
    
    + $(A B)^T = B^T A^T$
]

#def[
    Пусть $n in NN$. Единичной матрицой порядка $n$ называется:

    $E_n = display(mat(
        1, 0, ..., 0;
        0, 1, ..., 0;
        dots.v, dots.v, dots.down, dots.v;
        0, 0, ..., 1;
    )) in M_(n) (R)$

    Как кратко обозначить: $E_n = (delta_(i j))$, где $delta_(i j) = display(cases(
        1\, & i = j,
        0\, & i eq.not j
    ))$ --- символ Кронекера
]

#pr[
    Пусть $A in M_(m, n) (R)$.

    Тогда $E_m A = A E_n = A$
]

#proof[
    $E_m A = (b_(i j)), space A = (a_(i j))$

    $b_(i j) = limits(sum)_(k = 1)^m delta_(i k) a_(k j) = a_(i j)$

    То есть $E_m A = A$

    $E_n A^T = A^T ==> (E_n A^T)^T = (A^T)^T ==> (A^T)^T E_n^T = (A^T)^T ==> A E_n = A$
]

#follow[
    $M_(n) (R)$ --- кольцо, где $E_n$ --- нейтральный элемент по умножению

    Называют кольцом квадратных матриц порядка $n$.
]

#notice[
    Кольцо не обязательно коммутативное при $n >= 2$

    $A = display(mat(
        0, 1;
        0, 0;
    )) dot display(mat(
        0, 0;
        1, 0;
    )) = display(mat(
        1, 0;
        0, 0;
    ))$
    
    $B = display(mat(
        0, 0;
        1, 0;
    )) dot display(mat(
        0, 1;
        0, 0;
    )) = display(mat(
        0, 0;
        0, 1;
    ))$

    $A eq.not B$
]

#notice[
    $M_1 (R) iso R$
]

#def[
    $GL_n (R) = M_n (R)^* = \{A in M_n(R) divides exists B in M_n(R), space A B = B A = E_n\}$

    Такая $B$ единственная и называется обратной к $A$, обозначается $A^(-1)$
]

#pr[
    + $E_n in GL_n (R), space E_n^(-1) = E_n$
    
    + $A_1, ..., A_k in GL_n (R) ==> limits(product)_(i = 1)^k A_i in GL_n (R), space (A_1 ... A_k)^(-1) = A_k^(-1) ... A_1^(-1)$
    
    + $A in GL_n (R) ==> A^T in GL_n (R), space (A^T)^(-1) = (A^(-1))^T$
]

#proof[
        + $E_n E_n = E_n E_n = E_n$
        
        + #[
            $(A_1 ... A_k)(A_k^(-1) ... A_1^(-1)) = A_1 ... A_(k-1) (A_k A_k^(-1)) ... A_1^(-1) = A_1 ... A_(k - 1) A_(k - 1)^(-1) ... A_1^(-1) = A_1 A_1^(-1) = E_n$
        
            $(A_k^(-1) ... A_1^(-1))(A_1 ... A_k) = ... = A_k^(-1) A_k = E_n$
        ]

        + #[
            $(A^T dot (A^T)^(-1)) = (A^(-1) dot A)^T = E_n^T = E_n$
        
            $((A^T)^(-1) dot A^T) = (A dot A^(-1))^T = E_n^T = E_n$
        ]
]

#def[
    Матричная единица --- это матрица, где все элементы нулевые, кроме одного, который равен единице.

    Обозначается как $e_(i j)$.
]

#notice[
    $A = (a_(i j)) = limits(sum)_(i, j) a_(i j) e_(i j)$
]