module io

contains

  ! Reads the temperature distribution from an input file
  subroutine read_field(field, filename)
    implicit none

    real, dimension(:,:), allocatable, intent(out) :: field
    character(len=*), intent(in) :: filename
    character(len=9) :: arrsize != '# 200 200'
    integer :: nx, ny, alloc_stat, i, j

    ! TODO: implement function that will:
    ! open the file
    ! read the first header line to get nx and ny
    ! allocate matrix called field
    ! read rest of the file into field
    ! close the file

  open(unit=10, file='bottle.dat', status='old', form='formatted', access='direct', action='read')
  open(unit=11, file='field', status= 'new', form= 'formatted', access= 'stream', action= 'write')
  read(10, arrsize, fmt= '(2X,I3)') nx
  read(10, arrsize, fmt= '(6X,I3)') ny
  
  allocate (field(nx,ny), stat=alloc_stat)
  if (alloc_stat /=0) call abort()

  do i=1, nx
     do j=1, ny
        write(11,*) field(i,j)
     end do
  end do
  close(10)
  close(11)








  end subroutine read_field

  ! Output routine, saves the temperature distribution as a png image
  subroutine write_field(field, iter)
    use iso_fortran_env, only : REAL64
    use pngwriter
    implicit none

    integer, parameter :: dp = REAL64
    real, intent(in) :: field(:,:)
    integer, intent(in) :: iter

    character(len=85) :: filename
    integer :: nx, ny, stat

    nx = size(field, 1)
    ny = size(field, 2)


    write(filename,'(A5,I4.4,A4,A)')  'heat_', iter, '.png'
    stat = save_png(real(field, kind=dp), nx, ny, filename)

  end subroutine write_field

end module io
