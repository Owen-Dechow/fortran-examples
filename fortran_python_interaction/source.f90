module f_module
    implicit none

contains
    subroutine get_big_real(big_num)
        implicit none

        real, intent(out) :: big_num
        integer :: seed(12)
        real :: rand(10000000)

        call random_seed(put=seed)
        call random_number(rand)

        big_num = maxval(rand)

    end subroutine get_big_real
end module f_module

