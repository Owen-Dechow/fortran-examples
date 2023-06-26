program datatypes
    implicit none

    ! ALL VARIABLES ARE CASE INSENSITIVE
    !   Alfa = ALFA = alfa = aLFA

    ! Float | 6 decimals
    real :: pi = 3.14

    ! Double 15 decimals
    double precision :: num = 3.873459172349857

    ! Double > 15 decimals | d+5 -> 5 extra decimal placements
    double precision :: num2 = 7.27384982379827392692d+5

    ! Integers
    integer :: int = 256

    ! Complex/ Imaginary numbers (real, imaginary)
    complex :: imaginary = (5, 3)

    ! Char
    character :: char = 'a'

    ! String
    character(len=11) :: string1 = "Hello World"
    character(11) :: string2 = "Hello World"
    character :: string3*11 = "Hello World"

    ! boolean
    logical :: bool1 = .true.
    logical :: bool2 = .false.

    ! Constants use peramiter
    real, parameter :: alfa = 1

    ! print out variables
    print *, pi, num, num2, int, imaginary, char, string1, string2, string3, bool1, bool2, alfa

end program datatypes
