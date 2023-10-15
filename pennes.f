      SUBROUTINE UMATHT(U,DUDT,DUDG,FLUX,DFDT,DFDG,
     1     STATEV,TEMP,DTEMP,DTEMDX,TIME,DTIME,PREDEF,DPRED,
     2     CMNAME,NTGRD,NSTATV,PROPS,NPROPS,COORDS,PNEWDT,
     3     NOEL,NPT,LAYER,KSPT,KSTEP,KINC)
C     
      INCLUDE 'ABA_PARAM.INC'
C     
      CHARACTER*80 CMNAME
      DIMENSION DUDG(NTGRD),FLUX(NTGRD),DFDT(NTGRD),
     1     DFDG(NTGRD,NTGRD),STATEV(NSTATV),DTEMDX(NTGRD),
     2     TIME(2),PREDEF(1),DPRED(1),PROPS(NPROPS),COORDS(3)
C     
!     To keep in the same order as entered in Abaqus
!     Tissue properties
      rho_t = PROPS(1)          ! Tissue density [kg/m^3]
      c_t = PROPS(2)            ! Tissue specific heat capacity [J/(kg*K)]
      cond_t = PROPS(3)         ! Tissue conductivity [W/(m K)]
      omega_p = PROPS(4)        ! Tissue perfusion rate [1/s]
      q_m = PROPS(5)            ! Tissue metabolic heat generation [W/m^3]
C     
!     Blood properties
      rho_b = PROPS(6)          ! Blood density [kg/m^3]
      c_b = PROPS(7)            ! Blood specific heat capacity [J/(kg*K)]
      T_b = PROPS(8)            ! Blood temperature [K]
C     
C     Flux calculation : 
      DO I=1, NTGRD
         FLUX(I) = - cond_t *DTEMDX(I)
         DFDG(I,I) = - cond_t 
      END DO
C     
C     Internal energy calculation :
      DU = c_t * DTEMP + (1/rho_t) * DTIME * (rho_b * c_b *
     1     omega_p * (TEMP - T_b) - q_m)
      DUDT = c_t + (1/rho_t) * DTIME * rho_b * c_b * omega_p
      U = U + DU
C      
C
      RETURN
      END
