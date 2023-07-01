program io
    implicit none
    call main()

contains
    subroutine main()
        integer :: err_iostat
        character(256) :: err_iomsg
        character(256) :: file_cont

        open (101, file="test.txt", status="new", iostat=err_iostat, iomsg=err_iomsg)
        if (err_iostat /= 0) then
            print *, "Error: "//trim(err_iomsg)
            stop
        end if

        write (101, "(a)") "Hello World"
        close (101)

        open (102, file="test.txt", status="old", iostat=err_iostat, iomsg=err_iomsg)
        if (err_iostat /= 0) then
            print *, "Error: "//trim(err_iomsg)
        end if
        read (102, "(a)") file_cont
        write (*, "(a)") file_cont
        close (102, status="delete")

    end subroutine main
end program io
