# project name
name mosfet_copy
# execution graph
job 3 -d "1"  -post { extract_vars "$nodedir" n3_des.out 3 }  -o n3_des "sdevice pp3_des.cmd"
job 1   -post { extract_vars "$nodedir" n1_dvs.out 1 }  -o n1_dvs "sde -l n1_dvs.cmd"
job 10 -d "1"  -post { extract_vars "$nodedir" n10_des.out 10 }  -o n10_des "sdevice pp10_des.cmd"
job 12 -d "1"  -post { extract_vars "$nodedir" n12_des.out 12 }  -o n12_des "sdevice pp12_des.cmd"
job 21 -d "1"  -post { extract_vars "$nodedir" n21_des.out 21 }  -o n21_des "sdevice pp21_des.cmd"
job 20 -d "1"  -post { extract_vars "$nodedir" n20_des.out 20 }  -o n20_des "sdevice pp20_des.cmd"
job 16 -d "1"  -post { extract_vars "$nodedir" n16_des.out 16 }  -o n16_des "sdevice pp16_des.cmd"
job 2 -d "1"  -post { extract_vars "$nodedir" n2_des.out 2 }  -o n2_des "sdevice pp2_des.cmd"
job 4 -d "1"  -post { extract_vars "$nodedir" n4_des.out 4 }  -o n4_des "sdevice pp4_des.cmd"
job 6 -d "1"  -post { extract_vars "$nodedir" n6_des.out 6 }  -o n6_des "sdevice pp6_des.cmd"
job 8 -d "1"  -post { extract_vars "$nodedir" n8_des.out 8 }  -o n8_des "sdevice pp8_des.cmd"
check MOSFET_dvs.cmd 1788779733
check Id_Vg_Last_des.cmd 1788778028
check sdevice.par 1788590443
check Id_Vg_des.cmd 1788780232
check Id_Vd_des.cmd 1788779569
check Eqm_des.cmd 1788551560
check Breakdown_des.cmd 1788778286
check global_tooldb 1697803711
check gtree.dat 1788780101
check ./PolySilicon.par 1697803594
check ./Nitride.par 1698676163
check ./SiO2.par 1697803594
check ./Silicide.par 1698676163
check ./Silicon.par 1697803594
check sdevice5_des.cmd 1788698310
# included files
file sdevice.par included ./Nitride.par
file sdevice.par included ./SiO2.par
file sdevice.par included ./Silicide.par
file sdevice.par included ./Silicon.par
file sdevice.par included ./PolySilicon.par
