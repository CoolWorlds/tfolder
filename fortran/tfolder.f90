MODULE tfolder

 implicit none

 CONTAINS

 ! =============================================================================
 FUNCTION tfold_scalar(t,P,tau)

 ! Folds a scalar, t, using with a reference time (tau) and period (P), to 
 ! give tfold

  implicit none

  REAL(8), INTENT(IN) :: t
  REAL(8), INTENT(IN) :: P, tau
  REAL(8) :: tfold_scalar

  tfold_scalar = t - P*DNINT( (t-tau)/P ) - tau

 END FUNCTION
 ! =============================================================================

 ! =============================================================================
 FUNCTION tfold_vector(n,t,P,tau)

 ! Folds a vector, t(n), using with a reference time (tau) and period (P), to 
 ! give tfold

  implicit none

  INTEGER :: i
  INTEGER, INTENT(IN) :: n
  REAL(8), DIMENSION(n), INTENT(IN) :: t
  REAL(8), INTENT(IN) :: P, tau
  REAL(8), DIMENSION(n) :: tfold_vector

  DO i=1,n
    tfold_vector(i) = t(i) - P*DNINT( (t(i)-tau)/P ) - tau
  END DO

 END FUNCTION
 ! =============================================================================

 ! =============================================================================
 FUNCTION intransit_scalar(t,P,tau,dur)

 ! Checks if a point occurs inside transit or not, based on inputted period (P), 
 ! epoch (tau) and duration (dur)

  implicit none

  REAL(8), INTENT(IN) :: t
  REAL(8), INTENT(IN) :: P, tau, dur
  LOGICAL :: intransit_scalar

  IF( DABS(tfold_scalar(t,P,tau)) .LE. 0.5D0*dur ) THEN
    intransit_scalar = .TRUE.
  ELSE
    intransit_scalar = .FALSE.
  END IF

 END FUNCTION
 ! =============================================================================

 ! =============================================================================
 FUNCTION intransit_vector(n,t,P,tau,dur)

 ! Checks if a point occurs inside transit or not, based on inputted period (P), 
 ! epoch (tau) and duration (dur)

  implicit none

  INTEGER :: i
  INTEGER, INTENT(IN) :: n
  REAL(8), DIMENSION(n), INTENT(IN) :: t
  REAL(8), INTENT(IN) :: P, tau, dur
  LOGICAL, DIMENSION(n) :: intransit_vector

  DO i=1,n
    IF( DABS(tfold_scalar(t(i),P,tau)) .LE. 0.5D0*dur ) THEN
      intransit_vector(i) = .TRUE.
    ELSE
      intransit_vector(i) = .FALSE.
    END IF
  END DO 

 END FUNCTION
 ! =============================================================================

END MODULE tfolder
