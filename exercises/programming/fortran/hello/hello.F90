program hello
  implicit none
  integer :: a, b
  real :: r, rmax
  write (*,*) 'could you give a number for a:'
  read (*,*) a
  write (*,*) 'give rmax value:'
  read (*,*) rmax
  
  b=a*(a-1.2) 
  write (*,*) 'given value for a is:', a
  write (*,*) 'computed value for b is :', b
end program hello
