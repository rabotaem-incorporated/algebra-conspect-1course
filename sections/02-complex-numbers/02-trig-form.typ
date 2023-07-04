#import "../../utils/core.typ": *

== Тригонометрическая форма комплексного числа

#def[
    $a + b i = r(cos phi + i sin phi)$
    
    $a = r cos phi$
    
    $b = r sin phi$
]

#def[    
    Модулем комплексного числа $z = a + b i in CC$ назовем:
    
    $abs(z) = sqrt(a^2 + b^2)$
]

#pr[ 
    + $abs(z) >= 0, space abs(z) = 0 <==> z = 0$
    
    + $abs(z_1 z_2) = abs(z_1) abs(z_2)$
    
    + $abs(z_1 + z_2) <= abs(z_1) + abs(z_2)$
    
    + $abs(overline(z)) = abs(z)$
    
    + $z overline(z) = abs(z)^2$
]

#proof[
    + очевидно
        
    + #[
        $z_1 = a_1 + b_1 i, space z_2 = a_2 + b_2 i$
        
        $abs(z_1 z_2)^2 = (a_1 a_2 - b_1 b_2)^2 + (a_1 b_2 + a_2 b_1)^2 = a_1^2 a_2^2 + b_1^2 b_2^2 + a_1^2 b_2^2 + a_2^2 b_1^2 = $
        
        $(a_1^2 + b_1^2) (a_2^2 + b_2^2) = abs(z_1)^2 abs(z_2)^2$
    ]      
    
    + #[
        $<==> abs(z_1 + z_2)^2 <= (abs(z_1) + abs(z_2))^2$
        
        $<==> (a_1 + a_2)^2 + (b_1 + b_2)^2 <= a_1^2 + b_1^2 + a_2^2 + b_2^2 + 2 abs(z_1) abs(z_2)$
        
        $<==> a_1 a_2 + b_1 b_2 <= sqrt((a_1^2 + b_1^2)(a_2^2 + b_2^2))$
        
        $<== abs(a_1 a_2 + b_1 b_2) <= sqrt((a_1^2 + b_1^2)(a_2^2 + b_2^2))$
        
        $<==> a_1^2 a_2^2 + b_1^2 b_2^2 + 2 a_1 a_2 b_1 b_2 <= (a_1^2 + b_1^2)(a_2^2 + b_2^2)$
        
        $<==> 2 a_1 a_2 b_1 b_2 <= b_1^2 a_2^2 + a_1^2 b_2^2$
        
        $<==> (b_1 a_2 - b_2 a_1)^2 >= 0$
    ] 

    + очевидно
        
    + #[
        $z = a + b i ==> overline(z) = a - b i$
        
        $z overline(z) = (a + b i) (a - b i) = a^2 - (b i)^2 = a^2 + b^2 = abs(z)^2$
    ]
]

#notice[
    $z^(-1) = (overline(z))/(abs(z)^2) = (a)/(a^2 + b^2) - i (b)/(a^2 + b^2)$
]

#def[
    Пусть $z in CC$. Аргументом $z$ назовем такое $phi in RR$, 

    что $z = abs(z) (cos phi + i sin phi)$
]

#pr[ 
    + Если $z = 0$, то любой $phi in RR$ --- аргумент $z$
    
    + Если $z eq.not 0$, то: #[
        + аргумент существует
        
        + если $phi_0$ - аргумент $z$, и $phi$ - аргумент $z <==> phi = phi_0 + 2 pi k, space k in ZZ$
    ]
]

#proof[
    + тривиально
        
    + #[
        $z_0 = (1)/(abs(z)) dot z$ 
        
        $abs(z_0) = abs((1)/abs(z)) dot abs(z) = (1)/(abs(z)) dot abs(z) = 1$
        
        $z_0 = a_0 + i b_0, space abs(z_0) = a_0^2 + b_0^2 = 1 ==> exists phi_0:
        display(cases(
            a_0 = cos phi_0,
            b_0 = sin phi_0
        ))$

        $z = abs(z) dot z_0 = abs(z)(cos phi_0 + i sin phi_0)$

       "$arrow.l.double$": 

        $phi = phi_0 + 2 pi k ==>
        display(cases(
            cos phi = cos phi_0,
            sin phi = sin phi_0
        )) ==> phi$ --- аргумент

        "$arrow.r.double$":

        $phi$ --- аргумент $==> z = abs(z) (cos phi + i sin phi) ==>
        display(cases(
            cos phi = cos phi_0,
            sin phi = sin phi_0
        )) ==> phi - phi_0 = 2 pi k, space k in ZZ$
    ] 
]

#def[
    $arg(z) = phi$ означает $phi$ --- один из аргументов $z$
]

#notice[    
    Предположим оказалось, что $z = r(cos phi + i sin phi)$ для некоторых $r >= 0, space phi in RR$.
    Тогда $r = abs(z), space phi = arg z$
]

#proof[
    $abs(z) = sqrt((r cos phi)^2 + (r sin phi)^2) = sqrt(r^2) = r$, а $phi$ --- аргумент по определению
]

#pr[
    + $arg overline(z) = -arg z$
    + $z in RR <==> arg z = k pi, space k in ZZ$
    + $arg(z_1 z_2) = arg z_1 + arg z_2$
    + Пусть $z_2 eq.not 0 ==> arg (z_1)/(z_2) = arg z_1 - arg z_2$
]

#proof[
    + #[
        $arg z = phi$
        
        $z = abs(z)(cos phi + i sin phi)$
        
        $overline(z) = abs(z) (cos phi - i sin phi) = abs(overline(z))(cos(-phi) + i sin(-phi)) ==>$
        
        $arg overline(z) = -phi$
    ]

    + #[ 
        "$arrow.r.double$":
        
        $z > 0$: 
        
        $z = abs(z) dot 1 = abs(z) (cos 0 + i sin 0) ==> arg z = 0$
        
        $z < 0$: 
        
        $z = abs(z) dot (-1) = abs(z) (cos pi + i sin pi) ==> arg z = pi$
        
        "$arrow.l.double$":
        
        $sin(k pi) = 0$
    ]

    + #[
        $arg z_1 = phi_1, space arg z_2 = phi_2 ==>$
        
        (!) $phi_1 + phi_2 = arg(z_1 z_2)$
        
        $z_1 = abs(z_1)(cos phi_1 + i sin phi_1), space z_2 = abs(z_2)(cos phi_2 + i sin phi_2) ==>$
        
        $z_1 z_2 = abs(z_1) dot abs(z_2) (cos phi_1 dot cos phi_2 - sin phi_1 dot sin phi_2 + i (sin phi_1 dot cos phi_2 + cos phi_1 dot sin phi_2)) =$
        
        $abs(z_1 z_2) (cos(phi_1 + phi_2) + i sin(phi_1 + phi_2)) ==> arg(z_1 z_2) = phi_1 + phi_2$
    ]
    + $z_1 = (z_1)/(z_2) dot z_2 ==> arg z_1 = arg (z_1)/(z_2) + arg z_2 ==> arg (z_1)/(z_2) = arg z_1 - arg z_2$
]

#follow(name: [Формула Муавра])[
    Пусть $z in CC, space abs(z) = r, space arg z = phi, space n in ZZ$.

    Тогда $z^n = r^n (cos(n phi) + i sin(n phi))$
]

#proof[
    + #[
        $n > 0:$ индукция по $n$

        "База": $n = 1$ --- тривиально
        
        "Переход": $n - 1 ~~> n$
        
        $z^n = z^(n - 1) dot z = r^(n - 1) (cos((n - 1) phi) + i sin((n - 1) phi)) dot z = $
        
        $r^(n - 1) (cos((n - 1) phi) + i sin((n - 1) phi)) dot r (cos phi + i sin phi) = $
        
        $r^n (cos((n - 1) phi + phi) + i sin((n - 1) phi + phi)) = $
        
        $r^n (cos(n phi) + i sin(n phi))$
    ] 
    
    + $n = 0: 1 = r^0 (cos(0) + i sin(0)) = 1$
    
    + #[
        $n < 0:$ $n = -k, space k in NN$
    
        $z^n = (1)/(z^k)$
        
        $abs(z^n) = (1)/(abs(z^k)) = (1)/(abs(z)^k) = abs(z)^(-k) = abs(z)^n$
        
        $arg z^n = arg 1 - arg z^k = 0 - k phi = n phi$
    ]
]