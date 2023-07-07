program fortran
    implicit none

    integer :: random_seed_put(12)
    real :: start_time, end_time

    call cpu_time(start_time)
    call main()
    call cpu_time(end_time)
    print "(a, f0.8)", "Fortran: ", end_time - start_time

contains
    subroutine main()
        integer :: i, p, iter_count, err_iostat, file_unit
        character(265) :: err_iomsg
        character(100) :: file_name

        ! Get iter count
        open (unit=102, file="iter.txt", status="old", iostat=err_iostat, iomsg=err_iomsg)
        if (err_iostat /= 0) then
            print "(a, i0, a)", "Error ", err_iostat, " :"//trim(err_iomsg)
        end if
        read (102, *) iter_count
        close (102)

        do i = 0, iter_count - 1
            ! Get file name
            write (file_name, "(a, i0, a)") "output\", i, ".txt"

            ! Open file
            open (unit=file_unit, file=file_name, status="old", iostat=err_iostat, iomsg=err_iomsg)
            if (err_iostat == 2) then
                open (unit=file_unit, file=file_name, status="new", iostat=err_iostat, iomsg=err_iomsg)
            end if
            if (err_iostat /= 0) then
                print "(a, i0, a)", "Error ", err_iostat, " :"//trim(err_iomsg)
            end if

            ! Write data to file
            do p = 0, iter_count - 1
                write (file_unit, "(a, i0)") "Fortran number: ", p
            end do

            close (file_unit)
        end do
    end subroutine main
end program fortran
