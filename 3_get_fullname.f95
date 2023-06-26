program get_fullname
    implicit none

    ! Variables
    character(len=20) :: fist_name, last_name
    character(len=41) :: name

    ! Get name
    print *, "Please enter first and last name."
    read *, fist_name, last_name
    name = trim(fist_name)//" "//trim(last_name)

    ! Greet user
    print *, "Hello "//name

end program get_fullname
