PROGRAM example

use tfolder ! $compiler -c tfolder.f90

 REAL(8) :: x

 write(*,*) 'x = ?'
 read(*,*) x
 write(*,*) 'xfold = ',tfold_scalar(x,10.0D0,0.1D0)

END PROGRAM example
