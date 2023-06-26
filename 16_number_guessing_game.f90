program number_guessing_game
    implicit none

    ! Variables
    integer :: number, guess
    integer :: min = 1, max = 10, range, seed(12)
    real :: rand

    ! Set number
    range = max - min + 1
    call random_seed(put=seed)
    call random_number(rand)
    number = floor(min + range*rand)

    ! Game loop
    do while (guess /= number)
        print "(a, i1, a, i2, a)", "Enter number in range ", min, "-", max, "."
        read "(i2)", guess

        if (guess < number) then
            print *, "Incorrect, your guess was too low."
        else if (guess > number) then
            print *, "Incorrect, your guess was too high."
        else if (guess == number) then
            print *, "Correct, you win!"
        else
            print *, "Invalid response"
        end if

    end do

end program number_guessing_game
