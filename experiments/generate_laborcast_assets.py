import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

os.makedirs('experiments/datasets', exist_ok=True)
os.makedirs('assets', exist_ok=True)

# 1. Dataset Deret Waktu Sakernas BPS 2015-2025
ts_data = {
    'Tahun': [2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025],
    'TPT_Februari': [5.81, 5.50, 5.33, 5.10, 4.98, 4.94, 6.26, 5.83, 5.45, 4.82, 4.76],
    'TPT_Agustus': [6.18, 5.61, 5.50, 5.34, 5.23, 7.07, 6.49, 5.86, 5.32, 4.91, 4.85]
}
df_ts = pd.DataFrame(ts_data)
df_ts.to_csv('experiments/datasets/tpt_nasional_timeseries_2015_2025.csv', index=False)
print("Dataset created: experiments/datasets/tpt_nasional_timeseries_2015_2025.csv")

# 2. Plot Tren Historis dan Proyeksi OLS Pascapandemi (Target 2026)
fig, ax = plt.subplots(figsize=(11, 5.8), dpi=300)

# Plot TPT Februari
ax.plot(df_ts['Tahun'], df_ts['TPT_Februari'], '^--', color='#0284c7', linewidth=1.8, markersize=6,
        label='TPT Aktual (Februari)')

# Plot TPT Agustus (Basis Model OLS)
ax.plot(df_ts['Tahun'], df_ts['TPT_Agustus'], 'o-', color='#1e3a8a', linewidth=2.2, markersize=6,
        label='TPT Aktual (Agustus - Basis Model)')

# Anotasi Syok Pandemi COVID-19 (Agustus 2020)
ax.annotate('Syok Pandemi COVID-19\nAgustus 2020 (7.07%)', xy=(2020, 7.07), xytext=(2017.2, 7.15),
            arrowprops=dict(facecolor='#dc2626', shrink=0.08, width=1.5, headwidth=6),
            fontweight='bold', color='#dc2626', fontsize=9.5)

# OLS 2020-2025 (Agustus)
x_post = np.array([2020, 2021, 2022, 2023, 2024, 2025])
y_post = np.array([7.07, 6.49, 5.86, 5.32, 4.91, 4.85])
b, a = np.polyfit(x_post - 2020, y_post, 1)

# Proyeksi OLS sampai 2026 saja
x_proj = np.array([2025, 2026])
y_proj = a + b * (x_proj - 2020)
ax.plot(x_proj, y_proj, '--s', color='#16a34a', linewidth=2.2, markersize=7,
        label=r'Proyeksi OLS: $\hat{Y} = 952.28 - 0.468 \cdot t$ (Target 2026)')

# Titik Target 2026 dan Anotasi
ax.plot(2026, y_proj[-1], 'o', color='#dc2626', markersize=9, zorder=7)
ax.annotate(f'Target 2026: {y_proj[-1]:.2f}%', xy=(2026, y_proj[-1]), xytext=(2023.7, 3.85),
            arrowprops=dict(facecolor='#dc2626', shrink=0.08, width=1.5, headwidth=6),
            fontweight='bold', color='#dc2626', fontsize=9.5,
            bbox=dict(boxstyle='round,pad=0.35', facecolor='#fee2e2', edgecolor='#dc2626', alpha=0.95))

# Ambang batas alami (NAIRU)
ax.axhline(3.5, color='#9333ea', linestyle=':', linewidth=1.4, label='Lantai Alami (NAIRU ~3.5%)')

ax.set_title('Tren Dinamika TPT Nasional BPS (2015–2025) & Proyeksi Target 2026', fontsize=13, fontweight='bold', pad=14)
ax.set_xlabel('Tahun', fontsize=11, fontweight='bold', labelpad=8)
ax.set_ylabel('TPT (%)', fontsize=11, fontweight='bold', labelpad=8)
ax.set_xticks(range(2015, 2027))
ax.set_xlim(2014.5, 2026.8)
ax.set_ylim(3.0, 7.8)
ax.grid(True, linestyle='--', alpha=0.5)
ax.legend(frameon=True, facecolor='white', framealpha=0.95, loc='upper right', fontsize=9.5)
plt.tight_layout()
plt.savefig('assets/grafik_tren_proyeksi_tpt.png', dpi=300)
plt.close()
print("Figure created: assets/grafik_tren_proyeksi_tpt.png")

# 3. Histogram Distribusi TPT 38 Provinsi 2025
df_y = pd.read_csv('experiments/datasets/Tingkat Pengangguran Terbuka Menurut Provinsi, 2025 (dataset Y).csv', skiprows=3)
df_y.columns = ['Provinsi', 'Februari', 'Agustus', 'Tahunan']
y_prov = pd.to_numeric(df_y[df_y['Provinsi'] != 'INDONESIA']['Agustus'], errors='coerce').dropna().values

fig, ax = plt.subplots(figsize=(9, 5), dpi=300)
edges = [1.485, 2.405, 3.325, 4.245, 5.165, 6.085, 7.005]
counts, _, patches = ax.hist(y_prov, bins=edges, edgecolor='black', color='#3b82f6', alpha=0.75)
for patch, cnt in zip(patches, counts):
    if cnt > 0:
        ax.text(patch.get_x() + patch.get_width()/2, patch.get_height() + 0.3, f'{int(cnt)}', ha='center', fontweight='bold')

ax.set_title('Histogram Distribusi TPT 38 Provinsi Indonesia (Agustus 2025)', fontsize=12, fontweight='bold', pad=12)
ax.set_xlabel('Kelas Interval TPT (%)', fontsize=10)
ax.set_ylabel('Frekuensi Provinsi', fontsize=10)
ax.set_xticks(edges)
ax.set_ylim(0, 15)
ax.grid(True, linestyle='--', alpha=0.5)
plt.tight_layout()
plt.savefig('assets/histogram_tpt_provinsi.png')
plt.close()
print("Figure created: assets/histogram_tpt_provinsi.png")
