program arrays
  implicit none
  integer :: nx, ny
  integer :: i, alloc_stat
  real :: bound_up, bound_right, bound_left, bound_bott, inner_val
  real, allocatable :: alloc_arr(:,:) 
  ! TODO: define allocatable array A

  write (*,*) 'Give number of rows and columns for matrix A:'
  read (*,*) nx, ny

  ! TODO allocate A now that we know nx and ny


  ! TODO Use array syntax to initialize the array
  
  allocate (alloc_arr(nx,ny), stat=alloc_stat) 
  if (alloc_stat /=0) then
     call abort
  end if
  ! values initialization
  bound_up = 20.0
  bound_right = 70.0
  bound_left = 85.0
  bound_bott = 5.0
  inner_val = 65.0

  alloc_arr(1,:) = bound_up
  alloc_arr(:,ny) = bound_right
  alloc_arr(:,1) = bound_left
  alloc_arr(nx,:) = bound_bott
  alloc_arr(2:nx-1,2:ny-1) = inner_val

  
  !--------------------------------------------------
  ! Print out the array
  do i = 1, nx
    write(*,'(*(F6.1))') alloc_arr(i,:)
  end do

  deallocate (alloc_arr)

end program arrays
