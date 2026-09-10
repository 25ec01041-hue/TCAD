
File {
    Grid= "n1_msh.tdr"
    Plot= "n12_des.tdr"
    Current= "n12_des.plt"
    Output= "n12_des.log"
    Parameter= "pp12_des.par"
}

Electrode {
   { Name="source"    Voltage=0.0 }
   { Name="drain"     Voltage= (0 at 0, 10 at 1) }
   { Name="gate"      Voltage= 0 }
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

Physics(RegionInterface = "R.GateOx/R.Substrate"){
	Traps(FixedCharge Conc= 3.448e10)
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
	ExcludeTouchingContactParts
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
		InitialTime=0 FinalTime=1
		InitialStep= 1e-06
		MinStep = 1e-14
		MaxStep = 0.5
		Increment=1.5 Decrement=2
		BreakCriteria { Current( Contact="drain" Absval=1e-4 ) }
	) { Coupled { Poisson Electron Hole } }
}

