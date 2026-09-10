#define tend 1
#define Vg 0
#define Vd 10

File {
    Grid= "@tdr@"
    Plot= "@tdrdat@"
    Current= "@plot@"
    Output= "@log@"
    Parameter= "@parameter@"
}

Electrode {
   { Name="source"    Voltage=0.0 }
   { Name="drain"     Voltage= (0 at 0, Vd at tend) }
   { Name="gate"      Voltage= Vg }
}

Physics {

   AreaFactor = 1.0

   Fermi

   Mobility (
      DopingDependence
      Enormal
      HighFieldSaturation( GradQuasiFermi )
   )

   Recombination (
      SRH( DopingDependence TempDependence )
      Auger
      Avalanche( vanOverstraeten Eparallel )
   )

   EffectiveIntrinsicDensity( OldSlotboom )
}

Plot {
   eDensity hDensity
   eCurrent/Vector hCurrent/Vector
   ElectricField/Vector Potential SpaceCharge
   Doping DonorConcentration AcceptorConcentration
   eMobility hMobility
   eQuasiFermi hQuasiFermi
   ConductionBandEnergy ValenceBandEnergy
   ImpactIonization
}

Math {
	Method = Super NumberOfThreads = 4
	Derivatives RelErrControl
	Digits = 5 ErrRef(electron) = 1e8 ErrRef(hole) = 1e8
	Iterations = 25 NotDamped = 12
	CDensityMin = 1e-20 ExitOnFailure
}

Solve {
	Coupled( Iterations=1000 LineSearchDamping=1e-2 ) { Poisson }
	Coupled( Iterations=100 ) { Poisson Electron Hole }
	
	NewCurrentPrefix = "BV_"
	Transient (
		InitialTime=0 FinalTime=tend
		InitialStep= @<tend*1e-5/abs(Vd)>@
		MinStep = @<tend*1e-14>@
		MaxStep = @<tend*0.5>@
		Increment=1.5 Decrement=2
		BreakCriteria { Current( Contact="drain" Absval=1e-4 ) }
	) { Coupled { Poisson Electron Hole } }
}
