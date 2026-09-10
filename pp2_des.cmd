File {
Grid= "n1_msh.tdr" Plot= "n2_des.tdr" Current= "n2_des.plt"
Output= "n2_des.log" Parameter= "pp2_des.par"
}
Electrode {
{ Name="source" Voltage=0.0 }
{ Name="drain" Voltage=0.0 }
{ Name="gate" Voltage=0.0 }
}
Physics {
AreaFactor = 1.0
Fermi
Mobility ( DopingDependence Enormal HighFieldSaturation( GradQuasiFermi ) )
Recombination ( SRH( DopingDependence TempDependence ) Auger )
EffectiveIntrinsicDensity( OldSlotboom )
}
Plot {
eDensity hDensity eCurrent/Vector hCurrent/Vector
ElectricField/Vector Potential SpaceCharge
Doping DonorConcentration AcceptorConcentration
eMobility eVelocity ConductionBandEnergy ValenceBandEnergy
}
Math {
Method = Super NumberOfThreads = 4
Extrapolate Derivatives RelErrControl
Digits = 5 ErrRef(electron) = 1e8 ErrRef(hole) = 1e8
Iterations = 15 NotDamped = 8
CDensityMin = 1e-20 ExitOnFailure
}
Solve {
Coupled( Iterations=1000 LineSearchDamping=1e-2 ) { Poisson }
Coupled( Iterations=100 ) { Poisson Electron Hole }
}

