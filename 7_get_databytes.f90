program get_databytes
    implicit none

    real :: v_real = 3.14
    double precision :: v_double_precision = 3.873459172349857
    double precision :: v_double_precision_20 = 7.27384982379827392692d+5 ! 20 decimals
    integer :: v_integer = 256
    complex :: v_complex = (5, 3)
    character :: v_character = 'a'
    character(len=10) :: v_character_10 = "0123456789"
    logical :: v_logical = .true.

    print "(a, i3)", "Bytes in real: ", kind(v_real)
    print "(a, i3)", "Bytes in double precision: ", kind(v_double_precision)
    print "(a, i3)", "Bytes in double precision d+5: ", kind(v_double_precision_20)
    print "(a, i3)", "Bytes in integer: ", kind(v_integer)
    print "(a, i3)", "Bytes in complex: ", kind(v_complex)
    print "(a, i3)", "Bytes in character: ", kind(v_character)
    print "(a, i3)", "Bytes in character len=10: ", kind(v_character_10)
    print "(a, i3)", "Bytes in logical: ", kind(v_logical)

end program get_databytes
