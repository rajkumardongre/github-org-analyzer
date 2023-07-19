module utils
    implicit none
    public :: int_to_str
contains
    function int_to_str(int) result(str)
        integer, intent(in) :: int
        character(:), allocatable :: str
        integer :: j, temp, rem
        integer, allocatable :: nums(:)
        temp = int
        str = ''
        do while(temp > 9)
            rem = mod(temp, 10)
            temp = temp / 10 
            if(allocated(nums)) then
            nums = [rem, nums]
            else
                nums = [rem]
            end if
        end do
        if(allocated(nums)) then
            nums = [temp, nums]
        else
            nums = [temp]
        end if
        j = 1
        do j=1, size(nums)
            str = str // achar(nums(j) + 48)
        end do
        deallocate(nums)
    end function
    
end module utils