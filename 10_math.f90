program math
    implicit none

    print "(a8 i4)", "8 + 4 = ", (8 + 4)
    print "(a8 i4)", "8 - 4 = ", (8 - 4)
    print "(a8 i4)", "8 * 4 = ", (8*4)
    print "(a8 i4)", "8 / 4 = ", (8/4)
    print *

    print "(a8 i4)", "8 % 4 = ", mod(8, 4)
    print "(a8 i4)", "8 ^ 4 = ", 8**4

end program math
