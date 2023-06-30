program text_adventure
    use io_mod
    implicit none

    type Player_Type
        character(20) :: name
        integer, dimension(2) :: location = (/50, 50/)
        integer :: gold = 0, health = 30
    end type Player_Type

    type(Player_Type) :: player

    integer, dimension(100, 100) :: world_map
    integer :: null_key = 0, gold_key = 1, food_key = 2, enemy_key = 3, robber_key = 4
    integer :: random_seed_put(12)

    call random_seed(put=random_seed_put)
    call main()
contains
    subroutine main()
        implicit none

        logical :: player_moved

        ! Set up
        player%name = get_player_name()
        print "(a)", "Hello "//trim(player%name)
        call set_up_map()

        ! Instructions
        call option_prompt("Would, you like the instructions?", (/character(30) :: "Yes, show instructions", "No, start game"/))
        if (selected_option == 1) then
            call instructions()
        end if

        ! Game loop
        do while (player%health > 0 .and. player%gold < 50)
            call break_line()
            call show_stats()
            player_moved = move_player()

            if (player_moved) then
                if (key_of_player_location() /= null_key) then
                    call run_interaction_of_location()
                end if
            else
                if (player%health < 100 .and. player%gold > 0) then
                    player%health = player%health + 1
                    player%gold = player%gold - 1
                end if
            end if
        end do

        ! End game message
        call break_line()
        if (player%health <= 0) then
            print "(a, /, a)", trim(player%name)//" died.", "GAME OVER :("
        else if (player%gold >= 50) then
            print "(a, /, a)", trim(player%name)//" found all the gold they needed!", "YOU WIN :)"
        end if

        print "(a)", "PRESS ENTER TO EXIT"
        read *
        call break_line()
        print "(a, /, a)", "Thank you for playing Text Adventure (fortran 90)!", &
            "Brought to you by Owen Dechow https://github.com/Owen-Dechow"
        call break_line()

    end subroutine main

    character(20) function get_player_name() result(name)
        implicit none
        name = trim(string_prompt("Please enter name"))
    end function

    subroutine instructions()
        implicit none

        call break_line()
        print "(a)", "Each round you will be given 5 options"
        print "(a, /, a, /, a, /, a, /, a)", &
            "   1: Move north", &
            "   2: Move east", &
            "   3: Move south", &
            "   4: Move west", &
            "   5: Stay"

        print "(/, a, /, a, /, a)", &
            "At the end of the round, the player may find gold, find food, encounter an enemy, face a robber or nothing", &
            "The game ends when the player finds 50 gold or dies.", &
            "PRESS ENTER TO CONTINUE"
        call break_line()
        read *

    end subroutine instructions

    subroutine show_stats()
        print "(a)", trim(player%name)//"'s stats"
        print "(a, 2i5)", "Location: ", player%location(1), player%location(2)
        print "(a, 2i5)", "Gold: ", player%gold
        print "(a, 2i5)", "Health: ", player%health

    end subroutine show_stats

    logical function move_player() result(moved)
        implicit none

        character(30), dimension(5) :: options = (/character(30) :: &
                                                   "Move north", &
                                                   "Move east", &
                                                   "Move south", &
                                                   "Move west", &
                                                   "Stay"/)
        logical, dimension(5) :: valid_option = (/.true., .true., .true., .true., .true./)

        if (player%location(1) >= size(world_map, dim=1)) then
            options(1) = "Can't move north [Stay]"
            valid_option(1) = .false.
        end if

        if (player%location(2) >= size(world_map, dim=2)) then
            options(2) = "Can't move east [Stay]"
            valid_option(2) = .false.
        end if

        if (player%location(1) <= 0) then
            options(3) = "Can't move south [Stay]"
            valid_option(3) = .false.
        end if

        if (player%location(1) <= 0) then
            options(4) = "Can't move west [Stay]"
            valid_option(4) = .false.
        end if

        options(ubound(options)) = "Stay"

        call option_prompt("What would you like to do?", options)
        print *, options(selected_option)

        moved = .true.

        if (valid_option(selected_option)) then
            select case (selected_option)
            case (1)
                player%location(1) = player%location(1) + 1
            case (2)
                player%location(2) = player%location(2) + 1
            case (3)
                player%location(1) = player%location(1) - 1
            case (4)
                player%location(2) = player%location(2) - 1
            case default
                moved = .false.
            end select
        end if

    end function move_player

    integer function rand_int(min, max) result(int)
        integer :: min, max, range
        real :: rand

        call random_number(rand)
        range = max - min + 1
        int = min + floor(range*rand)
    end function

    subroutine set_up_map()
        implicit none

        integer :: x, y

        do x = 1, 100
            do y = 1, 100

                world_map(x, y) = rand_int(null_key, robber_key)

            end do
        end do
    end subroutine

    integer function key_of_player_location() result(key)
        key = world_map(player%location(1), player%location(2))
    end function

    subroutine run_interaction_of_location()
        implicit none

        integer :: key, power, initial
        key = key_of_player_location()
        power = rand_int(1, 10)

        if (key == gold_key) then
            ! Scale power
            power = power*2

            ! Update player
            player%gold = player%gold + power

            ! Print message
            print "(a, i0, a)", trim(player%name)//" found ", power, " gold!"

        else if (key == food_key) then
            ! Scale power
            power = power*2

            ! Save initial health
            initial = player%health

            ! Update player
            player%health = player%health + power
            if (player%health > 35) then
                player%health = 35
            end if

            ! Print message
            print "(a)", trim(player%name)//" found food!"
            print "(a, i0, a)", "Gained ", (player%health - initial), " health!"
        else if (key == enemy_key) then
            ! Save initial health
            initial = player%health

            ! Update player
            player%health = player%health - power
            if (player%health < 0) then
                player%health = 0
            end if

            ! Print message
            print "(a, i0, a)", trim(player%name)//" lost ", (initial - player%health), " health to an enemy."
        else if (key == robber_key) then
            ! Save initial gold
            initial = player%gold

            ! Update player
            player%gold = player%gold - power
            if (player%gold < 0) then
                player%gold = 0
            end if

            ! Print message
            print "(a)", trim(player%name)//" was robbed!"
            print "(a, i0, a)", trim(player%name)//" lost ", (player%gold - initial), " gold."
        end if

        world_map(player%location(1), player%location(2)) = null_key

    end subroutine
end program text_adventure
