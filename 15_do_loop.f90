program do_loop
    implicit none

    integer :: i

    ! start val, end val, step
    do i = 0, 9, 1
        print "(i1)", i
    end do

    print *

    i = 0
    do while (i < 20)
        i = i + 1

        if (mod(i, 2) == 1) then
            cycle
        else if (i > 15) then
            exit
        end if

        print "(i2)", i
    end do

end program do_loop
