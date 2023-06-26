program write_keyword
    implicit none

    character(len=5) :: string
    write (string, "(i5)") 10

    print *, string

end program write_keyword
