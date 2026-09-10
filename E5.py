import csv

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df_005 = pd.read_csv(r'C:\Users\kushw\Downloads\E50.005.csv')
df_04 = pd.read_csv(r'C:\Users\kushw\Downloads\E50.4.csv')

Vgs_005 = df_005['gate OuterVoltage'].values
Id_005 = df_005['drain TotalCurrent'].values

Vgs_04 = df_04['gate OuterVoltage'].values
Id_04 = df_04['drain TotalCurrent'].values


#For Linear Plots
plt.figure(figsize=(8, 6))

plt.plot(Vgs_005, Id_005, label="Vds = 0.05 V")
plt.plot(Vgs_04, Id_04, label="Vds = 0.4 V")

plt.xlabel("Gate Voltage, Vgs (V)")
plt.ylabel("Drain Current, Id (A)")
plt.title("Id-Vg Characteristics")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

#For Logarithmic Plots
plt.figure(figsize=(8, 6))

plt.semilogy(Vgs_005, Id_005, label="Vds = 0.05 V")
plt.semilogy(Vgs_04, Id_04, label="Vds = 0.4 V")
plt.xlabel("Gate Voltage, Vgs (V)")         
plt.ylabel("Drain Current, Id (A)")
plt.title("Id-Vg Characteristics (Log Scale)")
plt.grid(True, which="both", ls="--")
plt.legend()
plt.tight_layout()
plt.show()

#Vth Calculation using Extrapolation Method

sqrt_Id_005 = np.sqrt(Id_005)
sqrt_Id_04 = np.sqrt(Id_04)

m1,c1 = np.polyfit(Vgs_005, sqrt_Id_005, 1)
m2,c2 = np.polyfit(Vgs_04, sqrt_Id_04, 1)

Vth_005 = -c1/m1
Vth_04 = -c2/m2

print(f"Vth for Vds = 0.05 V: {Vth_005:.2f} V")
print(f"Vth for Vds = 0.4 V: {Vth_04:.2f} V")

#Subthreshold Slope 

log_Id_005 = np.log10(Id_005)
log_Id_04 = np.log10(Id_04)

m3,c3 = np.polyfit(Vgs_005, log_Id_005, 1)
m4,c4 = np.polyfit(Vgs_04, log_Id_04, 1)

S_005 = 1/m3
S_04 = 1/m4

print(f"Subthreshold Slope for Vds = 0.05 V: {S_005*1000:.2f} mV/dec")
print(f"Subthreshold Slope for Vds = 0.4 V: {S_04*1000:.2f} mV/dec")



