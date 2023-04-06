#import "../../utils/core.typ": *

== Наибольший общий делитель

#def[
    $R$ --- коммутативное кольцо, $a, b in R$.

    Элемент $d$ называется наибольшим общим делителем, если:

    +   $d divides a, space d divides b$
    +   $d' divides a, space d' divides b ==> d' divides d$
]

#props[
    +   $d_1, space d_2$ --- наибольшие общие делители, тогда $d_1 sim d_2$.
        
    +   Пусть $d_1$ --- наибольший общий делитель, $d_2 sim d_1$, тогда $d_2$ --- тоже наибольший общий делитель.
]

#proof[
    +   По свойству 2 : $d_1 divides d_2, space d_2 divides d_1 ==> d_1 sim d_2$.
    
    +   $d_2 divides d_1, space d_1 divides a, space d_1 divides b ==> d_2 divides a, space d_2 divides b$
    
        Пусть $d_2$ не наибольший, тогда $exists d' > d_2$.
    
        $d' divides a, space d' divides b ==> d' divides d_1$, так как $d_1$ наибольший общий делитель,
    
        $d' divides d_1, space d_1 divides d_2 ==> d' divides d_2$, противоречие, так как $d' > d_2$.
]

#props[
    Пусть $a, b in ZZ ==>$
    
    +   $exists d in  ZZ: space a ZZ + b ZZ = d ZZ$, иначе говоря: $forall x, y in  ZZ space exists d, z in  ZZ: a x + b y = d z$
    
    +   при этом $d$ --- наибольший общий делитель $a, b$.
] 

#proof[
    +   Пусть $I = a ZZ + b ZZ$.
    
        Заметим что $0 in I$, так как $0a + 0b = 0$.
        
        Если $I = {0}$, то $I = 0 ZZ$.
        
        Иначе $I eq.not {0} ==> c in I ==> -c in I$, так как $-(a x + b y) = a dot.c -x + b dot.c -y$
        
        То есть в $I$ есть положительные числа.
        
        Пусть $d = \min{ c divides c in I, space c > 0 }$, и докажем что $a ZZ + b ZZ = d ZZ$.
    
        "$supset$":
        
        $d in I$ (по определению) $==> d = a x_0 + b y_0, space.quad x_0, y_0 in  ZZ ==>$
        
        $forall z in  ZZ: space d z = a(x_0z) + b(y_0z) in I$, значит $d ZZ subset a ZZ + b ZZ$
        
        "$subset$":
        
        Пусть $c in I, space d in NN ==> exists q, r in  ZZ: space c = d q + r, space.quad 0 <= r < d$
        
        $c in I$, значит $c = a x_1 + b y_1, space.quad x_1, y_1 in  ZZ$
        
        Мы уже знаем, что $d in I$, значит $d = a x_0 + b y_0, space.quad x_0, y_0 in  ZZ$ 
        
        $r = c - d q = a(x_1 -x_0q) + b(y_1 - y_0q) in I$

        По определению остатка: $ cases( 
            r >= 0,
            r < d
        ) $ но $d = \min{ c divides c in I, space c > 0 } ==>$ 
        $ cases(
            r = 0,
            r = c - d q 
        ) ==> c = d q ==> c in d ZZ ==> a ZZ + b ZZ subset d ZZ $
    
    +   Пусть $d$ --- наибольший общий делитель $a, b$.
        
        $a = a 1 + b 0 in I = d ZZ ==> d divides a$
        
        $b = a 0 + b 1 in I = d ZZ ==> d divides b$
        
        Пусть $d' divides a, space d' divides b, space d = a x_0 + b y_0$
        
        $d' divides a x_0, space d' divides b y_0 ==> d' divides d$, значит $d$ действительно наибольший общий делитель $a, b$.
]

#follow[
    +   $a, b in  ZZ:$ Тогда наибольший общий делитель $a, b$ существует.
    
    +   Если $d$ --- наибольший общий делитель $a, b$, то $exists x, y in  ZZ: space d = a x + b y$ --- _Линейное представление наибольшего общего делителя_.
]

#proof[
    +   Доказали в двух частях предложения.

    +   Из первой части знаем, что существует $d_0$ --- наибольший общий делитель $a, b$, то есть $d_0 = a x_0 + b y_0$

        $d$ ассоциирован с $d_0 ==> d = d_0 ZZ, space z in  ZZ ==> d = a(x_0 z) + b(y_0 z)$
]

#def[
    $"НОД"(a, b) <==> gcd(a, b)$ --- неотрицательный наибольший общий делитель $a, b$.
]

#props[
    Пусть $a_1, a_2, b in ZZ: space a_1 equiv(b) a_2$
    
    Тогда $gcd(a_1, b)$ = $gcd(a_2, b)$.
]

#proof[
    $(!) space {c: c divides a_1, space c divides b } = {c : c divides a_2, space c divides b}$
    
    "$subset$":
    
    $a_2 - a_1 = b m ==> a_2 = a_1 + b m$
    
    $c divides a_1, space c divides b ==> c divides a_2$

    "$supset$":
    
    $a_1 - a_2 = b m ==> a_1 = a_2 + b m$

    $c divides a_2, space c divides b ==> c divides a_1$

    Получается, что:
    
    $forall x in {c: c divides a_1, c divides b }: space x divides gcd(a_1, b)$
    
    $forall x in {c: c divides a_2, c divides b }: space x divides gcd(a_2, b)$
    
    $gcd(a_1, b) = gcd(a_2, b)$
]

#def(name: "Алгоритм Евклида")[ 

    $gcd(a, b) = gcd(b, a mod b)$, если $b eq.not 0$

    ```cpp
    int gcd(int a, int b) {
        if (b == 0) return a;
        return gcd(b, a % b);
    }
    ```
]
