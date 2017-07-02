program hello
use omp_lib
  implicit none
  integer :: omp_rank
 print *, 'Hello world!'
!$omp parallel private(omp_rank)
  omp_rank = omp_get_thread_num()
  print *, 'Hello world :) !!! by thread', omp_rank
!$omp end parallel

end program hello
