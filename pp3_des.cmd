
File {
    Grid= "n1_msh.tdr"
    Plot= "n3_des.tdr"
    Current= "n3_des.plt"
    Output= "n3_des.log"
    Parameter= "pp3_des.par"
}

Electrode {
   { Name="source"    Voltage=0.0 }
   { Name="drain"     Voltage= 1.1 }
   { Name="gate"      Voltage=(0 at 0, 3	 at 1) }

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
}

Math {
*  Direct sparse solve. Fastest and most robust at this mesh size (<50k nodes).
*  For a much finer mesh switch to: Method=ILS(set=1)
   Method     = Super
   Number_of_Threads = 4

*  Extrapolate the next bias point from the previous two: usually halves the
*  Newton iterations on a smooth sweep.
   Extrapolate
   Derivatives
   RelErrControl
   Digits     = 5
   ErrRef(electron) = 1e8
   ErrRef(hole)     = 1e8
   Iterations = 15000
   Notdamped  = 50000
   CDensityMin      = 1e-20
   ExitOnFailure
}

Solve {
    Coupled(Iterations= 1000000 LineSearchDamping= 1e-2) { Poisson }
    Coupled(Iterations= 100000) { Poisson Electron Hole }
    
    NewCurrent = "IdVg_"
    Transient (
        InitialTime= 0 FinalTime= 1  
        InitialStep= 3.33333333333e-06 MinStep = 1e-14 Maxstep= 0.01 
        Increment= 1.5 Decrement= 2
    ) { coupled { Poisson Electron Hole } }
    System ("rm n3_des.plt")   
}

