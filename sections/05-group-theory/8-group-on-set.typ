#import "../../utils/core.typ": *

== Действие группы на множестве

#def[
    Здесь и далее $G$ --- группа, $X$ --- множество.
    
    Действие $G$ на $X$ --- гомоморфизм, $G --> S(X)$.
    ($S(X)$ --- множество биекций из $X$ на себя.)
]

#def[
    Действие $G$ на $X$ --- отображение
    $
        G times X &--> X\
        (g, x) &maps g x
    $
    с двумя свойствами:
    + $g_1 (g_2 x) = (g_1 g_2) x space.quad forall g_1, g_2 in G, x in X$
    
    + $e x$ = $x space forall x in X$
]

#proof(name: [Сопоставление определений])[
    Вообще говоря, внешне эти два определения почти никак не связаны. Мы определили два вообще разных объекта. Поэтому мы доказываем, что между этими объектами существует понятное соотвествие.

    "$1 ==> 2$":
    $phi: G --> S(X)$ --- гомоморфизм, тогда рассмотрим 
    $
        G times X &--> X\
        (g, x) &maps phi(g)(x)
    $
    Проверим свойства:
    + $phi(g_1)(phi(g_2)(x)) = phi(g_1 g_2)(x)$
    + $underbrace(phi(e), id_X)(x) = x$
    
    "$2 ==> 1$": Рассмотрим $psi: G times X --> X$ и отображение $phi$:
    $
        G &limits(-->)^phi S(X)\
        g &maps (x maps g x) #[--- это биекция (есть обратный к $x$)]
    $
    Проверим, что это гомоморфизм:
    $
        phi(g_1 g_2) x = (g_1 g_2) x = g_1 (g_2 x) = phi(g_1) (phi(g_2) x).
    $
]

#example(plural: true)[
    + $G = A_n, space X = {1, ..., n}$, $phi: A_n overbrace(arrow.r.hook, #place(move(dy: -1em, [#box(scale(sym.arrow.b.curve, x: -100%)) инъективное отображение]))) S_n, (phi = i_(A_n))$
    + $G = D_n, space X #[--- плоскость, $X supset P$ --- правильный пятиугольник], space D_n < S(X), space phi = i_(D_n)$
    + $G = RR, space X = CC$
        $
            G times X &--> X\
            (a, z) &maps (cos(2 pi a) + i sin (2 pi a))z
        $
    + $G$ --- группа, $X = G$
        $
            G times X &--> G\
            (g, h) &maps g h
        $
    + $G$ --- группа, $X = G$
        $
            (g_1 h) = g h g_(-1) \
            (g_1 g_2)h(g_1 g_2)^(-1) = g_1 (g_2 h g_2 ^(-1)) g_1^(-1)
        $
    + $G = S_n, space X = RR^n$
        $
            sigma vec(alpha_1, dots.v, alpha_n) = vec(alpha_(sigma(1)), dots.v, alpha_(sigma(n)))
        $ 
    + $G = S_n, space X = V$ --- линейное пространство с базисом $e_1, ..., e_n$ $
        sigma(alpha_1 e_1 + ... + alpha_n e_n) = alpha_1 e_(sigma(1)) + ... + alpha_n e_(sigma(n))
    $.
]


#def[
    Пусть $G$ действует на $X$, $x in X$. _Орбита_ $x$ --- это множество
    $
        G x = {g x bar g in G}
    $
]
#def[
    Пусть $x in X$. _Стабилизатор_ $x$:
    $
        St_x = {g in G bar g x = x} < G
    $
]

#pr[
    Пусть $abs(G) < infinity$, $G$ действует на $X$. Тогда 
    $
        forall x in X: abs(G) = abs(St_x) dot abs(G x)
    $
]

#proof[
    Рассмотрим (здесь идет речь о фактормножестве, $St_x$ не обязан быть нормальной подгруппой!)
    $
        G fg St_x &limits(-->)^phi G x \
        g &maps g x
    $    
    
    Докажем корректность $phi$: 
    $
        g_2 = g_1 h "где" h in St_x, space g_2 x = g_1 h x = g_1 x.
    $

    $G x = Im phi$ --- по определению. Проверим, что $phi$ --- инъективна:
    $
        g_2 x = g_1 x &==> g_1^(-1) (g_2 x ) = g_1^(-1) (g_1 x) = x \
        &==> g_1^(-1) g_2 in St_x ==> g_2 in g_1 St_x
    $
]

#def[
    $G$ --- группа. Тогда _центр группы_ --- это
    $
        Z(G) = {h in G bar forall g in G: h g = g h}
    $
]

#pr[
    Пусть $abs(G) = p^n$, $p$ --- простое, $n in NN$. Тогда
    $Z(G) != {e}$
]

#proof[
    Пусть $x$ --- действует на себе сопряжением. Рассмотрим $h in G$. Тогда
    $
        G = union.big_(i in I) C_i, "где" C_i #[--- орбиты], \
        abs(C_i) bar abs(G) ==> abs(C_i) = p^m "для" 0 <= m <= n.
    $
    Обозначим за $k_i$ число орбит размера $p^i$. Тогда 
    $
        p^n = abs(G) = k_0 mul 1 + k_1 mul p + dots + k_n mul p^n ==> p bar k_0 \
        k_0 >= 1, "так как орбита" e "состоит только из " e 
    $
    Возвращаемся к требуемому:
    $
        abs(G h) = 1 &<==> abs({g h g^(-1) bar g in G}) = 1 \ 
        &<==> forall g in G: g h g^(-1) = h \
        &<==> h in Z(G)
    $
    Таким образом $abs(Z(G)) >= p$.
]
