!   
!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 
!   sp: Spring pendulum
!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 
! 
      SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP) 
!     ---------- ---- 
! 
!      IMPLICIT DOUBLE PRECISION (A-H,O-Z) 
!      DIMENSION U(NDIM),PAR(*),F(NDIM)
!   Configuration for Auto
      IMPLICIT NONE
      REAL(8),DIMENSION(NDIM),INTENT(in)::U
      REAL(8), DIMENSION(NDIM),INTENT(out)::F
      REAL(8), DIMENSION(*),INTENT(in):: PAR
      INTEGER, INTENT(in)::NDIM,IJAC
      REAL(8), DIMENSION(*)::DFDU,DFDP
      INTEGER,DIMENSION(*)::ICP   
!  Configuration for the system 
      INTEGER::I
      REAL(8),DIMENSION(2)::P,Q
      REAL(8),DIMENSION(4)::DH
! 
       Q=U(1:2)
       P=U(3:4)
       DH(1:2)=(1.0D0-PAR(1)/SQRT(DOT_PRODUCT(Q,Q)))*Q+(/0.D0,1.D0/)
       DH(3:4)=P
       F(1:2)=DH(3:4)
       F(3:4)=-DH(1:2)
       F=PAR(11)*F 
! 
      RETURN 
      END 
! 
      SUBROUTINE STPNT(NDIM,U,PAR,T) 
!     ---------- ----- 
! 
      IMPLICIT DOUBLE PRECISION (A-H,O-Z) 
      DIMENSION U(NDIM),PAR(*) 
! 
  
      INTEGER::I
       PAR(11)=0.01
       PAR(1)=1.0
       U(1:4)=(/(0.D0, I=1,4)/)
       U(2)=-PAR(1)-1.D0
! 
      RETURN 
      END 
! 
      SUBROUTINE BCND(NDIM,PAR,ICP,NBC,U0,U1,FB,IJAC,DBC) 
!     ---------- ---- 
! 
      IMPLICIT DOUBLE PRECISION (A-H,O-Z) 
      DIMENSION PAR(*),ICP(*),U0(NDIM),U1(NDIM),FB(NBC)
! 
       FB(1)=U0(1) 
       FB(2)=U1(1) 
       FB(3)=U0(4)
       FB(4)=U1(4)
! 
      RETURN 
      END 
! 
      SUBROUTINE PVLS(NDIM,U,PAR)
!     ---------- ----
!
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION U(NDIM),PAR(*)
      REAL(8)::q1,q2,p1,p2
      q1=GETP('BV0',1,U)
      q2=GETP('BV0',2,U)
      p1=GETP('BV0',3,U)
      p2=GETP('BV0',4,U)
      

      aux=SQRT(q1*q1+q2*q2)-PAR(1)
      PAR(2)=0.5*(p1*p1+p2*p2+aux*aux)+q2+par(1)+0.5
      PAR(3)=GETP('BV0',2,U)
      PAR(4)=GETP('BV0',3,U)
      PAR(5)=GETP('BV1',2,U)
      PAR(6)=GETP('BV1',3,U)
     RETURN
      END
! 
      SUBROUTINE ICND
      RETURN 
      END 
!
      SUBROUTINE FOPT 
      RETURN 
      END 
