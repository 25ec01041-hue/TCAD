import csv

import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt

df_03 = pd.read_csv(r'C:\Users\kushw\Downloads\E6a.csv')
df_06 = pd.read_csv(r'C:\Users\kushw\Downloads\E6b.csv')
df_09 = pd.read_csv(r'C:\Users\kushw\Downloads\E6c.csv')
df_15 = pd.read_csv(r'C:\Users\kushw\Downloads\E6d.csv')

Vds_03 = df_03['drain OuterVoltage'].values
Id_03 = df_03['drain TotalCurrent'].values

Vds_06 = df_06['drain OuterVoltage'].values
Id_06 = df_06['drain TotalCurrent'].values

Vds_09 = df_09['drain OuterVoltage'].values
Id_09 = df_09['drain TotalCurrent'].values

Vds_15 = df_15['drain OuterVoltage'].values
Id_15 = df_15['drain TotalCurrent'].values

plt.figure(figsize=(8, 6))

plt.plot(Vds_03, Id_03, label="Vgs = 0.3 V")
plt.plot(Vds_06, Id_06, label="Vgs = 0.6 V")
plt.plot(Vds_09, Id_09, label="Vgs = 0.9 V")
plt.plot(Vds_15, Id_15, label="Vgs = 1.5 V")

plt.xlabel("Drain Voltage, Vds(V)")
plt.ylabel("Drain Current, Id(A)")

plt.title("Id-Vds Characteristics")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

#Calculation of r0 and gd for 1.5 V

gd_15 = np.gradient(Id_15, Vds_15)

r0_15 = 1 / gd_15

print(f"Output Resistance (r0) for Vgs = 1.5 V: {r0_15[-1]/1000:.2f} kOhm")
print(f"Transconductance (gd) for Vgs = 1.5 V: {gd_15[-1]:.6f} S")



