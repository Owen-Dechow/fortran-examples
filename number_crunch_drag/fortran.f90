program fortran
    implicit none

    integer :: random_seed_put(12)
    real :: start_time, end_time

    call random_seed(put=random_seed_put)

    call cpu_time(start_time)
    call main()
    call cpu_time(end_time)
    print "(a, f0.8)", "Fortran: ", end_time - start_time

contains
    subroutine main()
        implicit none

        integer :: i, iter_count, err_iostat
        character(265) :: err_iomsg
        integer, dimension(:), allocatable :: nums

        ! Get iter count
        open (unit=102, file="iter.txt", status="old", iostat=err_iostat, iomsg=err_iomsg)
        if (err_iostat /= 0) then
            print "(a, i0, a)", "Error ", err_iostat, " :"//trim(err_iomsg)
        end if
        read (102, *) iter_count
        close (102)

        ! Make nums array
        allocate (nums(iter_count))
        do i = 1, iter_count
            nums(i) = rand_int(1, i)
        end do

        ! Open file
        open (unit=101, file="out.txt", status="old", iostat=err_iostat, iomsg=err_iomsg)
        if (err_iostat == 2) then
            open (unit=101, file="out.txt", status="new", iostat=err_iostat, iomsg=err_iomsg)
        end if
        if (err_iostat /= 0) then
            print "(a, i0, a)", "Error ", err_iostat, " :"//trim(err_iomsg)
        end if

        ! Second iteration
        do i = 1, iter_count
            nums(i) = nums(i)*rand_int(1, i)
        end do

        ! Print to file
        write (101, *) nums

        ! Close file
        close (101)

    end subroutine main

    integer function rand_int(min, max) result(int)
        integer :: min, max, range
        real :: rand

        call random_number(rand)
        range = max - min + 1
        int = min + floor(range*rand)
    end function
end program fortran
