#import "../../utils/core.typ": *

== Взаимно простые числа

#def[
    Числа $a$ и $b$ называются взаимно простыми, если $gcd(a, b) = 1$.

    $a bot b$ --- сокращенная запись для обозначения взаимной простоты.
]

#pr[
    
    +   Пусть $a, b in ZZ$, тогда $a bot b <==> exists m, n in ZZ: a m + b n = 1$.
    
    +   $a_1 bot b, space  a_2 bot b ==> a_1a_2 bot b$.
    
    +   $cases( 
            a_1\, ...\, a_m in ZZ,
            b_1\, ...\, b_n in ZZ
        )$ и $forall i, j: space a_i bot b_j ==> a_1 ... a_m bot b_1 ... b_n$.
    
    +   $a divides b c, space  a bot b ==> a divides c$.
    
    +   $a x equiv(m) a y, space  a bot m ==> x equiv(m) y$.
    
    +   $gcd(a, b) = d ==> a = d a', space  b = d b', space  a' bot b'$.
]

#proof[
    
        +   $m$ и $n$ существуют согласно линейному представлению НОД.
        
            $d = gcd(a, b), space  d divides a, space  d divides b ==> d divides (a m + b n) = 1 ==> d divides 1 ==> d = 1$.
        
        +   $cases( 
                1 = a_1 m_1 + b n_1, 
                1 = a_2 m_2 + b n_2
            ) limits(==>)^("перемножим") 1 = a_1 a_2 (m_1 m_2) + b(a_1 m_1 n_2 + a_2 m_2 n_1+b n_1 n_2) ==> a_1 a_2 bot b$.
        
        +   $cases( 
                a_1 bot b,
                space.quad dots.v,
                a_n bot b 
            ) ==> a_1 ... a_n bot b$
        
            $cases(
                a_1 ... a_n bot b_1,
                space.quad ...,
                a_1 ... a_n bot b_n
            ) ==> a_1 ... a_n bot b_1 ... b_n$
        
        +   $1 = a m + b n ==> c = a c m + b c n$
        
            $a divides a c m, space a divides b c n ==> a divides c$.
        
        +   $m divides (a x - a y), space  a bot m ==> m divides (x - y) ==> x equiv(m) y$.
        
        +   $d divides a, space  d divides b ==> cases(
                a = d a',
                b = d b'
            ) :space.quad  a', b' in ZZ$
            
            $d = a m + b n, space.quad  m, n in ZZ$
            
            $d = 0 ==> a' = b' = 0 = d a'm + d b'm$
            
            $d eq.not 0 ==> 1 = a'm + b'n ==> a' bot b'$.
]