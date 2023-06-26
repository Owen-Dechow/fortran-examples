program getname
    implicit none

    ! Variables
    character(10) :: user_name

    ! Ask for user name
    print *, "What is your name?"

    ! Recognize the typing from terminal
    read *, user_name
    user_name = trim(user_name)

    ! Print out greeting
    print *, "Hello ", user_name

end program getname
