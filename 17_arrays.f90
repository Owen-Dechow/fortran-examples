program arrays
    implicit none

    ! Fixed dimensions
    integer, dimension(6) :: myArray = (/1, 2, 3, 4, 5, 6/)

    ! Allowcatable dimensions
    integer, dimension(:), allocatable :: myAllocatableArray
    integer :: arraySize = 10, i, p

    ! multi dimensions
    real, dimension(3, 3) :: myMultiArray

    print *, "My Array"
    print *, myArray
    print *, myArray(3:6)
    print *, myArray(::2)
    myArray(1) = 10
    print *, myArray

    do i = 1, 3
        do p = 1, 3
            myMultiArray(i, p) = i + p
        end do
        print *, myMultiArray(i, :)
    end do

    allocate (myAllocatableArray(arraySize))

end program arrays
