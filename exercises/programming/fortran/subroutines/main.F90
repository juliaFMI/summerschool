program subroutines
  use laplacian_mod
  implicit none
! TODO: define the arrays
  integer :: nx, ny

  write (*,*) 'Give number of rows and columns for matrix A:'
  read (*,*) nx, ny

  allocate(prev(nx,ny), curr(nx,ny))

  ! initialize the array
  call initialize(prev)

  call write_field(prev)

  ! compute the Laplacian
  call laplacian(curr, prev)

  ! print the result array
  call write_field(curr)
 
end program subroutines

