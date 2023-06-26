program leftalign
    implicit none

    character(len=20) :: str1 = "First number"
    character(len=20) :: str2 = "Second number"

    character(len=7) :: num1
    character(len=7) :: num2
    write (num1, "(i7)") 256
    write (num2, "(i7)") 1024347

    print "(a20 a7)", str1, adjustl(num1)
    print "(a20 a7)", str2, adjustl(num2)

end program leftalign
