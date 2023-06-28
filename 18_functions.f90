program functions
    implicit none
    integer :: a, b, c
    a = clamp_value(5, 0, 10)
    b = clamp_value(-30, 0, 10)
    c = clamp_value(100, 0, 10)
    print "(i2)", a, b, c

contains

    integer function clamp_value(val, min, max) result(result)
        implicit none
        integer, intent(in) :: val, min, max

        result = val
        if (result < min) then
            result = min
        end if
        if (result > max) then
            result = max
        end if

    end function clamp_value

end program functions
