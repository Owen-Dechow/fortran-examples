module int_list
    implicit none

contains
    integer function get_mean(list) result(mean)
        implicit none

        ! Data load variables
        integer, dimension(:), intent(in) :: list

        ! Data analysis variables
        double precision :: sum = 0
        integer :: idx = 0

        ! Find average
        do idx = lbound(list, 1), ubound(list, 1)
            sum = sum + list(idx)
        end do

        ! Set the average
        mean = nint(sum/size(list))

    end function get_mean

    integer function get_mode(list, min, max) result(mode)
        implicit none

        ! Data load variables
        integer, dimension(:), intent(in) :: list
        integer, intent(in) :: min, max

        ! Data analysis variables
        integer :: idx = 0, temp(1)
        integer, dimension(min:max) :: count_occ

        ! Set up count table
        count_occ = 0

        ! Count
        do idx = lbound(list, 1), ubound(list, 1)
            count_occ(list(idx)) = count_occ(list(idx)) + 1
        end do

        ! Set most common
        temp = maxloc(count_occ)
        mode = temp(1)
        temp = lbound(count_occ)
        mode = mode - 1 + temp(1)
    end function

    integer function get_median(sorted_list) result(median)
        implicit none

        ! Data load variables
        integer, dimension(:), intent(in) :: sorted_list
        integer :: temp_int_r1(1), medians(2), array_size
        real :: real_median

        if (modulo(size(sorted_list), 2) == 0) then
            array_size = size(sorted_list)/2

            temp_int_r1 = sorted_list(lbound(sorted_list) + array_size - 1)
            medians(1) = temp_int_r1(1)

            temp_int_r1 = sorted_list(lbound(sorted_list) + array_size)
            medians(2) = temp_int_r1(1)

            real_median = (medians(1) + medians(2))/2
            median = nint(real_median)
        else
            temp_int_r1 = sorted_list(lbound(sorted_list) + size(sorted_list)/2)
            median = temp_int_r1(1)
        end if

    end function
end module int_list
