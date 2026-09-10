import csv

import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt

df_2_id_Vd = pd.read_csv(r'D:\EDA\E10_2_Id_Vd.csv')
df_2_id_Vg = pd.read_csv(r'D:\EDA\E10_2_Id_Vg.csv')

df_827_id_Vd = pd.read_csv(r'D:\EDA\E10_827_Id_Vd.csv')
df_827_id_Vg = pd.read_csv(r'D:\EDA\E10_827_Id_Vg.csv')

df_normal_id_Vd = pd.read_csv(r'D:\EDA\E10_normal_Id_Vd.csv')
df_normal_id_Vg = pd.read_csv(r'D:\EDA\E10_normal_Id_Vg.csv')

Vds_2 = df_2_id_Vd['drain OuterVoltage'].values
Id_2d = df_2_id_Vd['drain TotalCurrent'].values
Vgs_2 = df_2_id_Vg['gate OuterVoltage'].values
Id_2g = df_2_id_Vg['drain TotalCurrent'].values

Vds_827 = df_827_id_Vd['drain OuterVoltage'].values
Id_827d = df_827_id_Vd['drain TotalCurrent'].values
Vgs_827 = df_827_id_Vg['gate OuterVoltage'].values
Id_827g = df_827_id_Vg['drain TotalCurrent'].values

Vds_normal = df_normal_id_Vd['drain OuterVoltage'].values
Id_normald = df_normal_id_Vd['drain TotalCurrent'].values
Vgs_normal = df_normal_id_Vg['gate OuterVoltage'].values
Id_normalg = df_normal_id_Vg['drain TotalCurrent'].values



plt.figure(figsize=(8, 6))

plt.plot(Vds_2, Id_2d, label="Vgs = 1.5 V")


plt.xlabel("Drain Voltage, Vds(V)")
plt.ylabel("Drain Current, Id(A)")

plt.title("Id-Vds Characteristics")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

plt.figure(figsize=(8, 6))

plt.plot(Vgs_2, Id_2g, label="Vds = 1.1 V")


plt.xlabel("Gate Voltage, Vgs(V)")
plt.ylabel("Drain Current, Id(A)")

plt.title("Id-Vgs Characteristics")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

plt.figure(figsize=(8, 6))

plt.plot(Vds_827, Id_827d, label="Vgs = 1.5 V")


plt.xlabel("Drain Voltage, Vds(V)")
plt.ylabel("Drain Current, Id(A)")

plt.title("Id-Vds Characteristics")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

plt.figure(figsize=(8, 6))

plt.plot(Vgs_827, Id_827g, label="Vds = 1.1 V")


plt.xlabel("Gate Voltage, Vgs(V)")
plt.ylabel("Drain Current, Id(A)")

plt.title("Id-Vgs Characteristics")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

plt.figure(figsize=(8, 6))

plt.plot(Vds_normal, Id_normald, label="Vgs = 1.5 V")


plt.xlabel("Drain Voltage, Vds(V)")
plt.ylabel("Drain Current, Id(A)")

plt.title("Id-Vds Characteristics")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()


plt.figure(figsize=(8, 6))

plt.plot(Vgs_normal, Id_normalg, label="Vds = 1.1 V")


plt.xlabel("Gate Voltage, Vgs(V)")
plt.ylabel("Drain Current, Id(A)")

plt.title("Id-Vds Characteristics")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

