module io_mod
    implicit none
    integer :: selected_option

contains
    character(20) function string_prompt(prompt) result(response)
        implicit none
        character(*) :: prompt

        print "(a)", trim(prompt)
        read *, response

    end function string_prompt

    recursive subroutine option_prompt(prompt, options)
        character(*) :: prompt
        character(*), dimension(:) :: options
        character(6) :: option_tag
        integer :: i, i_error

        print "(a)", prompt
        do i = 1, size(options)
            write (option_tag, "(i3, a1)") i, ":"
            print *, option_tag, options(i)
        end do

        read (*, "(i3)", iostat=i_error) selected_option

        if (i_error /= 0 .or. selected_option > size(options) .or. selected_option < 1) then
            print "(a, /)", "Invalid input!"
            call option_prompt(prompt, options)
        end if

    end subroutine option_prompt

    subroutine break_line()
        print "(a50)", "--------------------------------------------------"
    end subroutine break_line
end module io_mod
