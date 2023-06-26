program select_keyword
    implicit none

    integer :: value = 15

    select case (value)
    case (5)
        print *, "5"
    case (6:13)
        print *, "6:13"
    case (14, 15, 16, 17, 18)
        print *, "14, 15, 16, 17, 18"
    case default
        print *, "default"
    end select

end program select_keyword
