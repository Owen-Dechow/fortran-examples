program random_numbers
    implicit none

    ! Variables
    integer :: min = 0, max = 100
    real :: rand
    integer :: seed(12)
    real :: range

    range = max - min

    call random_seed(put=seed)
    call random_number(rand)
    print *, min + range*rand

end program random_numbers
