program basic
  use mpi
  use iso_fortran_env, only : REAL64

  implicit none
  !  include 'mpif.h'
  integer, parameter :: size = 10000000
  integer :: rc, myid, ntasks, count
  integer :: status(MPI_STATUS_SIZE,2)
  integer :: message(size)
  integer :: receiveBuffer(size)
  integer :: source, destination
  integer :: requests(2)

  real(REAL64) :: t0, t1 

  call MPI_INIT(rc)
  call MPI_COMM_RANK(MPI_COMM_WORLD, myid, rc)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, ntasks, rc)

  message = myid

  if (myid < ntasks-1) then
     destination = myid + 1
  else
     destination = MPI_PROC_NULL
  end if

  ! Send and receive as defined in exercise
  if (myid > 0) then
     source = myid - 1
  else
     source = MPI_PROC_NULL
  end if

  ! Start measuring the time spent in communication
  call mpi_barrier(mpi_comm_world, rc)
  t0 = mpi_wtime()

  ! TODO: Implement the message passing using non-blocking
  !       sends and receives

  write(*,'(A10,I3,A20,I8,A,I3,A,I3)') 'Sender: ', myid, &
       ' Sent elements: ', size, &
       '. Tag: ', myid + 1, '. Receiver: ', destination

  ! TODO: Add here a synchronization call so that you can be sure
  !       that the message has been received

  call MPI_GET_COUNT(status(:,1), MPI_INTEGER, count, rc)
  write(*,'(A10,I3,A20,I8,A,I3,A,I3)') 'Receiver: ', myid, &
       'received elements: ', count, &
       '. Tag: ', status(MPI_TAG, 1), &
       '. Sender:   ', status(MPI_SOURCE, 1)

  ! Finalize measuring the time and print it out
  t1 = mpi_wtime()
  call mpi_barrier(mpi_comm_world, rc)
  call flush(6)

  write(*, '(A20, I3, A, F6.3)') 'Time elapsed in rank', myid, ':', t1-t0

  call MPI_FINALIZE(rc)
end program basic
