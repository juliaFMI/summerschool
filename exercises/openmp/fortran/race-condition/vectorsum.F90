program vectorsum
  use iso_fortran_env, only: int64
  implicit none
  integer, parameter :: ik = int64
  integer(kind=ik), parameter :: nx = 102400_ik

  integer(kind=ik), dimension(nx) :: vecA
  integer(kind=ik) :: sum, psum, sumex
  integer(kind=ik) :: i

  ! Initialization of vector
  do i = 1, nx
     vecA(i) = i
  end do

  sum = 0
  ! TODO: Parallelize the computation
!$omp parallel do private(i) reduction(+:sum)
!!$omp parallel do private(i)
  do i = 1, nx
     sum = sum + vecA(i)
  end do
!$omp end parallel do
  write(*,*) 'Sum: ', sum
end program vectorsum
