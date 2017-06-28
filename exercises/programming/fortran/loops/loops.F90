program loops
  implicit none
  ! TODO define parameters nx and ny
  integer, parameter :: nx = 10, ny = 10
  real, parameter :: bound1 = 20.0, bound2 = 70.0, bound3 = 85.0, bound4 = 5.0, inner_val = 65.0
  real, dimension(0:nx+1,0:ny+1) :: arr 
  ! TODO: define real-valued array A
  integer :: i, j

  ! TODO initialize array A here
  do i = 0, (nx+1)
     do j = 0, (ny+1)
        if (i==0) then
          arr(i,j) = bound1
        else if (j==ny+1) then
           arr(i,j) = bound2
        else if (j==0) then
           arr(i,j) = bound3
        else if (i==nx+1) then
           arr(i,j) = bound4
        else 
           arr(i,j) = inner_val
        end if
     end do
  end do

  !--------------------------------------------------
  ! Print out the array
 ! the ':' syntax means the whole row, see the Fortran arrays lecture
  do i = 0, (nx+1)
     write(*, '(12F6.1)') arr(i,:)
  end do

!write(*, '(12F6.1)') arr(:,:)

end program loops
