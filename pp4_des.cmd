File {
Grid = "n1_msh.tdr"
Plot = "n4_des.tdr"
Current = "n4_des.plt"
Output = "n4_des.log"
Parameter = "pp4_des.par"
}
Electrode {
{ Name="source" Voltage=0.0 }
{ Name="drain" Voltage=(0 at 0, 1 at 1) }
{ Name="gate" Voltage=0.3 }
}Physics {
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
)
EffectiveIntrinsicDensity( OldSlotboom )
}
Plot {
eDensity hDensity
eCurrent/Vector hCurrent/Vector
ElectricField/Vector Potential SpaceCharge
Doping DonorConcentration AcceptorConcentration
eMobility hMobility eVelocity
eQuasiFermi hQuasiFermi
ConductionBandEnergy ValenceBandEnergy
}
Math {
* Direct sparse solve. Best accuracy on a 2D mesh of this size.
* For a much finer or 3D mesh switch to: Method=ILS(set=1)
Method = Super
NumberOfThreads = 4
Extrapolate
Derivatives
RelErrControl
Digits = 5
ErrRef(electron) = 1e8
ErrRef(hole) = 1e8
Iterations = 15
NotDamped = 8
CDensityMin = 1e-20
ExitOnFailure
}
Solve {
Coupled( Iterations=1000 LineSearchDamping=1e-2 ) { Poisson }
Coupled( Iterations=100 ) { Poisson Electron Hole }
NewCurrentPrefix = "IdVd_"
Transient (
InitialTime=0 FinalTime=1
InitialStep= 1e-05
MinStep = 1e-14
MaxStep = 0.01
Increment=1.5 Decrement=2
) { Coupled { Poisson Electron Hole } }
}

