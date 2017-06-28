program intrinsics
  implicit none
  integer :: nx, ny
  integer :: i, alloc_stat
  logical :: A_bigger_zero
  real :: A_max_loc(2), A_min_abs, A_num_50
  real, dimension(:,:), allocatable :: A
  real, dimension (:), allocatable :: A_sum  

  write (*,*) 'Give number of rows and columns for matrix A:'
  read (*,*) nx, ny

  allocate(A_sum(nx), stat = alloc_stat)
  if (alloc_stat /= 0) call abort()
  allocate(A(nx,ny), stat = alloc_stat)
  if (alloc_stat /= 0) call abort()

  ! Initializing array
  A(:,:)  = 65.0 ! middle
  A(:,1)  = 20.0 ! left
  A(:,ny) = 70.0 ! right
  A(1,:)  = 85.0 ! top
  A(nx,:) = 5.0  ! bottom
  ! array details identification with the use of intrinsic functions -- JP ---

  A_sum = sum(A,2)
  A_max_loc = maxloc(A)
  A_min_abs = abs(minval(A))
  A_num_50 = count(A>=50)
  A_bigger_zero = all(A>=0)

  !--------------------------------------------------
  ! Print out the array
  do i = 1, nx
    write(*,'(*(F6.1))') A(i,:)
  end do

  write (*,*) 'A_sum=:', A_sum
  write (*,*) 'A_max_loc=:', A_max_loc
  write (*,*) 'A_min_abs=:', A_min_abs
  write (*,*) 'A_num_50=:', A_num_50
  write (*,*) 'A_bigger_zero is:', A_bigger_zero  

  !--------------------------------------------------
  ! TODO: use array intrinsics to probe elements of A




end program intrinsics
