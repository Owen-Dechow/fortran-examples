program math_funcs
    implicit none

    print "(a, i1)", "abs(-1): ", abs(-1)
    print "(a, f3.1)", "sqrt(81): ", sqrt(81.0)
    print "(a, f7.5)", "exp(1): ", exp(1.0)
    print "(a, f7.5)", "log(2.71): ", log(2.71)
    print "(a, i1)", "int(2.71): ", int(2.71)
    print "(a, i1)", "nint(2.71): ", nint(2.71)
    print "(a, i1)", "floor(2.71): ", floor(2.71)
    print "(a, f3.1)", "max(2.7,3.4): ", max(2.7, 3.4)
    print "(a, f3.1)", "min(2.7,3.4): ", min(2.7, 3.4)
    print "(a, f3.1)", "sin(1.5708): ", sin(1.5708)
    print "(a, f3.1)", "cos(1.5708): ", cos(1.5708)
    print "(a, f11.3)", "tan(1.5708): ", tan(1.5708)
    print "(a, f3.1)", "asin(0): ", asin(0.0)
    print "(a, f3.1)", "acos(0): ", acos(0.0)
    print "(a, f3.1)", "atan(0): ", atan(0.0)

end program math_funcs
