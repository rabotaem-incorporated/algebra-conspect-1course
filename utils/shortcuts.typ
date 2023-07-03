// shortcuts
#let iff = math.limits(sym.arrow.l.r.double.long)
#let imply = math.limits(sym.arrow.r.double.long)
#let since = math.limits(sym.arrow.l.double.long)
#let mul = math.dot
#let empty = sym.nothing.rev
#let quad = sym.space.quad
#let maps = sym.arrow.long.bar
#let sim = sym.zws + sym.tilde + sym.zws
#let pc = sym.plus.circle
#let nsubg = sym.triangle.l.small
#let iso = sym.tilde.eqq
#let fg = sym.slash

// operators
#let sgn = math.op("sgn")
#let Inv = math.op("Inv")
#let Det = math.op("det")
#let lcm = math.op("lcm")
#let diag = math.op("diag")
#let sgn = math.op("sgn")
#let Lin = math.op("Lin")
#let Dim = math.op("dim")
#let id = math.op("id")
#let GL = math.op("GL")
#let Hom = math.op("Hom")
#let Ker = math.op("Ker")
#let Im = math.op("Im")
#let Id = math.op("Id")
#let End = math.op("End")
#let rk = math.op("rk")
#let Tr = math.op("Tr")
#let ord = math.op("ord")
#let St = math.op("St")
#let char = math.op("char")
#let Irr = math.op("Irr")
#let arg = math.op("arg")

// letters
#let Aa = math.cal($A$)
#let Bb = math.cal($B$)

// functions

#let hat(x) = math.accent(x, "^")
#let adj(A) = math.accent(A, "~")
#let wave(x) = math.accent(x, "~")
#let factor(first, second) = $first\/second$
#let equiv(mod) = $limits(ident)_(mod)$
#let mrow(mtx, idx) = $mtx[idx,]$
#let mcol(mtx, idx) = $mtx[,idx]$
#let gen(..elem) = $lr(angle.l #elem.pos().join($,$) angle.r)$
#let pmod(module) = $quad mod module$

#let det(..a) = {
    if a.pos().len() == 1 {
        $Det #a.pos().at(0)$
    } else {
        math.mat(delim: "|", ..a)
    }
}

#let sq(char, ..args) = {
    if args.pos().len() == 0 { 
        $char_1, ..., char_n$
    } else if args.pos().len() == 1 {
        $char_1, ..., char_#args.pos().at(0)$
    } else if args.pos().len() == 2 {
        $char_#args.pos().at(0), ..., char_#args.pos().at(1)$
    }
}


// amogus
#let amogus = symbol(
    "ඞ",
    ("adult", "ඞ"),
    ("tween", "ඩ"),
    ("toddler", "ධ"),
    ("baby", "ව"),
) // yes
