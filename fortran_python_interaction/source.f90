module f_module
    implicit none

contains
    real function get_big_real() result(big_num)
        implicit none

        integer :: seed(12)
        real :: rand(10000)

        call random_seed(put=seed)
        call random_number(rand)

        big_num = maxval(rand)

    end function get_big_real
end module f_module

