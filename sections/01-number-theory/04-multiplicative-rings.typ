#import "../../utils/core.typ": *

== Кольцо классов вычетов

#def[
    Множество классов вычетов по модулю $m$ --- это множество всех вычетов по модулю $m$.

    Обозначается как $factor(ZZ, m ZZ) <==> factor(ZZ, m) <==> factor(Z, equiv(m))$
]

#th[
    Пусть $m in NN$. Тогда

    + $factor(ZZ, m ZZ) = {overline(0), overline(1), ..., overline(m - 1)}$

    + $|factor(ZZ, m ZZ)| = m$
]

#proof[
    + Пусть $a in ZZ$, $(!) space overline(a) = overline(r), space.quad 0 <= r < m$

        + Случай $a >= 0$:  Пусть $r$ --- наименьшее число, такое что $r >= 0$ и $a equiv(m) r$.
           
           Если $r >= m$, то $r - m equiv(m) a$, $r - m >= 0$, $r - m < r$. 
           То есть $r - m$ подходит под условие для $r$ и меньше. 
           Противоречие с выбором $r$.
           
           Значит $r < m$, то есть $r$ --- искомое.

        + Случай $a < 0$: 
           
           Рассмотрим $a' = a plus.minus (-a)m = a(1-m)$. Тогда $a < 0$, $1 - m <= 0$, и $a' >= 0$.
        
           $overline(a) = overline(a') = overline(r)$, $0 <= r < m$
    
    + предположим $overline(r) = overline(r')$, $0 <= r, r' < m$.
    $
        cases(
            |r' - r| < m,
            m divides (r - r')
        ) ==> r' - r = 0 ==> r = r'
    $
]

#follow[
    Теорема о делении с остатком
    
    Пусть $a in ZZ$, $b in NN$. Тогда 
    $
        exists! space q, r in ZZ : cases(a = b q + r, 0 <= r < b)
    $
]

#proof[

    "Существование":

    В $factor(ZZ, b ZZ)$ рассмотрим $overline(a) in {overline(0), overline(1), ..., overline(b-1)}$, тогда по теореме выше найдется $0 <= r < b$ для которого $overline(a) = overline(r)$:
    $
        a equiv(b) r <==> a = b q + r, space.quad q in ZZ.
    $

    "Единственность":
    Пусть нашлось два таких $q, q' in ZZ$ и $r, r' in ZZ$ для которых $a = b q + r$, $a = b q' + r'$. Тогда
    $
        b q + r equiv(b) b q' + r' <==> r equiv(b) r' limits(<==>)^(0 <= r, r' < b) r = r' ==> b q = b q' <==> q = q'.
    $
    Напомню, что вторая равносильнось выполняется благодаря единственности класса вычетов $overline(r)$.
]


#def[
    $q$ --- _неполное частное_ при делении $a$ на $b$, $r$ --- _остаток_ при делении $a$ на $b$.
]

#def[
    _Операция_ на множестве $M$ --- бинарное отображение $M times M -> M$.
]

На $factor(ZZ, m ZZ)$ определим операцию сложения и умножения по модулю $m$:

+ $overline(a) + overline(b) = overline(a + b)$
    
+ $overline(a) dot.c overline(b) = overline(a dot.c b)$

#prop[
    Это правда операции над множеством $factor(ZZ, m ZZ)$:
]

#proof[
    То, что за пределы множества при сложении и умножении мы не выходим, очевидно.
    Надо доказать, что при подстановке одинаковых классов, получаеются одинаковые результаты, то есть:
    $
        (!) space overline(a) = overline(a'), space overline(b) = overline(b') ==> overline(a + b) = overline(a' + b'), space overline(a dot.c b) = overline(a' dot.c b')
    $
    распишем условия через сравнения по модулю:
    $
        overline(a) = overline(a'), space overline(b) = overline(b') => a equiv(m) a', space b equiv(m) b'
    $
    Воспользуемся свойствами сравнения:
    $
        a equiv(m) a', space b equiv(m) b' ==> a + b equiv(m) a' + b', space a dot.c b equiv(m) a' dot.c b'
    $
    И перейдем обратно к классам:
    $
        a + b equiv(m) a' + b', space a dot.c b equiv(m) a' dot.c b' ==> overline(a + b) = overline(a' + b'), space overline(a dot.c b) = overline(a' dot.c b')
    $
]

#example[
    $m = 4, space factor(ZZ, 4 ZZ) = {overline(0), overline(1), overline(2), overline(3)}$
]
    
$
    #table(
        columns: (auto, auto, auto, auto, auto),
        fill: (col, row) => {
            if col == 0 or row == 0 {
                if col + row == 0 {
                    gray
                } else {
                    gray.lighten(40%)
                }
            }
        },
        [$+$], [$overline(0)$], [$overline(1)$], [$overline(2)$], [$overline(3)$],
        [$overline(0)$], [$overline(0)$], [$overline(1)$], [$overline(2)$], [$overline(3)$],
        [$overline(1)$], [$overline(1)$], [$overline(2)$], [$overline(3)$], [$overline(0)$],
        [$overline(2)$], [$overline(2)$], [$overline(3)$], [$overline(0)$], [$overline(1)$],
        [$overline(3)$], [$overline(3)$], [$overline(0)$], [$overline(1)$], [$overline(2)$],
    )
    space.quad space.quad space.quad
    #table(
        columns: (auto, auto, auto, auto, auto),
        fill: (col, row) => {
            if col == 0 or row == 0 {
                if col + row == 0 {
                    gray
                } else {
                    gray.lighten(40%)
                }
            }
        },
        [$*$], [$overline(0)$], [$overline(1)$], [$overline(2)$], [$overline(3)$],
        [$overline(0)$], [$overline(0)$], [$overline(0)$], [$overline(0)$], [$overline(0)$],
        [$overline(1)$], [$overline(0)$], [$overline(1)$], [$overline(2)$], [$overline(3)$],
        [$overline(2)$], [$overline(0)$], [$overline(2)$], [$overline(0)$], [$overline(2)$],
        [$overline(3)$], [$overline(0)$], [$overline(3)$], [$overline(2)$], [$overline(1)$],
    )
$

#def[
    $e in M$ --- _нейтральный элемент_ относительно операции $*$ на $M$, если $forall a in M$ справедливо $a * e = e * a = a$.
]

#props[
    Операции сложения и умножения на $factor(ZZ, m ZZ)$ обладают следующими свойствами:
]

$forall A, space B, space C$:

+ $A + B = B + A$ --- коммутативность сложения

+ $(A + B) + C = A + (B + C)$ --- ассоциативность сложения

+ $A + overline(0) = A$ --- существование нейтрального элемента относительно сложения

+ $A + A' = overline(0)$ --- существование обратного элемента относительно сложения

+ $A B = B A$ --- коммутативность умножения

+ $(A B)C = A(B C)$ --- ассоциативность умножения

+ $A dot.c overline(1) = A$ --- существование нейтрального элемента относительно умножения

+ $A dot.c (B + C) = A dot.c B + A dot.c C$ --- дистрибутивность умножения относительно сложения.

+ $(B + C) dot.c A = B dot.c A + C dot.c A$ --- дистрибутивность сложения относительно умножения.

#def[
    _Кольцом_ называется множество $M$ с операциями сложения и умножения, для которых выполнены аналоги свойств 1-4 и 8-9.
]

#def[
    Кольцо _коммутативное_, если выполнено свойство 5.
]

#def[
    Колько _ассоциативное_, если выполнено свойство 6.
]

#def[
    Кольцо _c единицей_, если выполнено свойство 7.
]

#notice[
    Если $*$ --- операция на $M$, то существует единственный нейтральный элемент относительно $*$.
]

#proof[
    $e, space e'$ --- нейтральные элементы относительно $*$, тогда $e = e * e' = e'$.
    
    Типа просто в определение нейтрального элемента подставили и получилось.
]

#notice[
    В нашем курсе все кольца будут ассоциативные с единицей.
]

#lemma[
    В любом кольце $0 dot.c a = 0$.
]

#proof[

    Предположим противное.
    Покажем, что $0 dot.c a + 0 dot.c a = 0 dot.c a$.
    $
        0 + 0 = 0 limits(==>)^(exists 0) (0 + 0) dot.c a = 0 dot.c a limits(==>)^("дистр.") 0 dot.c a + 0 dot.c a = 0 dot.c a
    $
    Теперь вычтем $0 dot.c a$. Так как $exists b: space b + (0 dot.c a) = 0,$ то
    $
        0 = b + (0 dot.c a) = b + (0 dot.c a + 0 dot.c a) = (b + 0 dot.c a) + (0 dot.c a) = 0 + (0 dot.c a) = 0 dot.c a
    $
    Противоречие.
]

#def[
    $A^*$ --- множество обратимых элементов кольца $A$ (по умножению, разумеется).
]

#examples[
    + $RR^* = RR without {0}$
    + $ZZ^* = {-1, 1}$
    + $(factor(ZZ, 4 ZZ))^* = {overline(1), overline(3)}$
    + $(factor(ZZ, 5 ZZ))^* = {overline(1), overline(2), overline(3), overline(4)}$
]

#def[
    _Полем_ называется коммутативное кольцо $F$, такое что $F^* = F \\ {0}$.
]
