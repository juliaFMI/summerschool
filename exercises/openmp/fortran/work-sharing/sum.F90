program vectorsum
  use omp_lib
  implicit none
  integer, parameter :: rk = kind(1d0)
  integer, parameter :: ik = selected_int_kind(9)
  integer, parameter :: nx = 102400

  real(kind=rk), dimension(nx) :: vecA, vecB, vecC
  real(kind=rk)    :: sum
  integer(kind=ik) :: i, j
  ! Initialization of vectors
  do i = 1, nx
     vecA(i) = 1.0_rk/(real(nx - i + 1, kind=rk))
     vecB(i) = vecA(i)**2
  end do

  ! TODO:
  !   Implement here the parallelized version of vector addition,
  !   vecC = vecA + vecB
  ! Compute the check value

!$omp parallel do shared(vecA, vecB) private(j)
 do j = 1, nx
    vecC(j) = vecA(j)+vecB(j)
 end do
!$omp end parallel do

  write(*,*) 'Reduction sum: ', sum(vecC) !shape(vecC)


end program vectorsum
