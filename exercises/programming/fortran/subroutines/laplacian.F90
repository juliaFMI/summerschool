module laplacian_mod
!  implicit none
  real, parameter :: dx = 0.01, dy = 0.01
  integer :: i,j
contains
  
  subroutine initialize(prev)
! TODO: implement a subroutine that initializes the input array
  
!    implicit none
    real :: prev, curr
    real :: bound_up, bound_right, bound_left, bound_bott, inner_val
    
   ! values initialization
    bound_up = 20.0
    bound_right = 70.0
    bound_left = 85.0
    bound_bott = 5.0
    inner_val = 65.0
    prev(1,:) = bound_up
    prev(:,ny) = bound_right
    prev(:,1) = bound_left
    prev(nx,:) = bound_bott
    prev(2:nx-1,2:ny-1) = inner_val
  end subroutine initialize
   
  subroutine laplacian(curr, prev)
! TODO: insert a subroutine that computes a laplacian of the
! array "prev" and returns it as an array "curr"

    ! initialize lapl array to zeros
!   implicit none
    curr(:,:)  = 0.0  ! middle

    do j = 2, ny-1
        do i = 2, nx-1
           curr(i,j) = (prev(i-1,j) - 2*prev(i,j) + prev(i+1,j))/(dx**2) &
                  + (prev(i,j-1) - 2*prev(i,j) + prev(i,j+1))/(dy**2)
        end do
    end do
  end subroutine laplacian

  subroutine write_field(curr)
! TODO: write a subroutine that prints "array" on screen
   ! Printing of the prev and lapl arrays
!   implicit none

    write(*,*) "Previous array:"
    do i = 1, nx
      write(*,'(*(G10.1))') prev(i,:)
    end do

    write(*,*) "Laplacian of the array:"
    do i = 1, nx
      write(*,'(*(G10.1))') curr(i,:)
    end do
  end subroutine write_field

end module laplacian_mod
