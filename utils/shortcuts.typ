// shortcuts
#let iff = math.limits(sym.arrow.l.r.double.long)
#let imply = math.limits(sym.arrow.r.double.long)
#let since = math.limits(sym.arrow.l.double.long)
#let mul = math.dot.op
#let empty = sym.nothing.rev
#let quad = sym.space.quad
#let maps = sym.arrow.long.bar
#let hat(x) = math.accent(x, "^")

// operators
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

// letters
#let Aa = math.cal($A$)
#let Bb = math.cal($B$)

// functions
#let det(..a) = {set math.mat(delim: "|"); math.mat(..a)}
#let sq(char, ..args) = {
    if args.pos().len() == 0 { 
        $char_1, ..., char_n$
    } else if args.pos().len() == 1 {
        $char_1, ..., char_#{args.pos().at(0)}$
    }
}