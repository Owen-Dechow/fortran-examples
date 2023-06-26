program formatted_print
    implicit none

    double precision :: g = 7.98345798
    ! a = string: RaW
    ! i = int: RiW
    ! f = float: RfW.D
    ! e = expediential: ReW
    ! /, = newline

    ! R: repeat times | W: width | D: decimals
    ! text aligns right

    print "(a, i10)", "My Int", 256
    print "(f16.3)", g

    print "(3i5)", 1, 2, 3, 4, 5, 6
    print *

end program formatted_print
