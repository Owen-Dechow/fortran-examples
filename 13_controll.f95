program controll
    implicit none

    if (1 == 1) then
        print *, "1 == 1"
    end if

    if (2 /= 1) then
        print *, "2 /= 1"
    end if

    if (1 < 2) then
        print *, "1 < 2"
    end if

    if (1 <= 1) then
        print *, "1 <= 1"
    end if

    if (2 > 1) then
        print *, "2 > 1"
    end if

    if (1 >= 1) then
        print *, "1 >= 1"
    end if

    if (.true. .and. .true.) then
        print *, ".true. .and. .true."
    end if

    if (.true. .or. .false.) then
        print *, ".true. .or. .false."
    end if

    if (.not. .false.) then
        print *, ".not. .false."
    end if

    if ("a" < "b") then
        print *, '"a" < "b"'
    end if

end program controll
