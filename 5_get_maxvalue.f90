program get_maxvalue
    implicit none

    integer :: my_int = 0
    real :: my_real = 0

    print *, "Max int value: ", huge(my_int)
    print *, "Max real (float) value ", huge(my_real)

    ! print *, "Min int value: ", tiny(my_int)
    !   cannot get tiny of intiger

    print *, "Min real (float) value ", tiny(my_real)

end program get_maxvalue
