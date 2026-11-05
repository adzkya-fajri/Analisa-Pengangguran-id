# Rencana Implementasi Pembuatan Dokumen Laporan Akhir PSAJ (`laporan_MATH.typ`)

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Membangun dokumen laporan akhir PSAJ Matematika terintegrasi PPLG lengkap (`laporan_MATH.typ`) yang mengonversi materi `proposal.typ` dan hasil pipeline ekonometrika `src/laborcast/` menjadi laporan final 5 Bab yang siap dikompilasi menjadi `laporan_MATH.pdf`.

**Architecture:** Menggunakan format typesetting Typst berbasis template baku `template.typ`. Memanfaatkan aset visual yang ada di `assets/` dan menyusun struktur isi laporan ke dalam 5 bab baku PSAJ dengan penomoran sub-bab huruf (A, B, C, dst.) serta mengaitkan tautan repositori GitHub resmi.

**Tech Stack:** Typst 0.11+ / Typst CLI, Markdown, Python (LaborCast analytics data).

**Spec:** [`docs/desain_laporan_MATH.md`](file:///home/splev/Projects/psaj_mtk/docs/desain_laporan_MATH.md)

## Global Constraints
- Target output utama: `laporan_MATH.typ` dan `laporan_MATH.pdf`.
- Berkas template asli `main.typ` dan `template.typ` tidak boleh diubah/rusak.
- Tautan repositori yang dicantumkan: `https://github.com/adzkya-fajri/Analisa-Pengangguran-id`.
- Angka temuan wajib konsisten: Persamaan tren $\hat{Y} = 952{,}28 - 0{,}4680 \cdot t$, $R^2 = 0{,}9576$, proyeksi Agustus 2026 sebesar $4{,}11\%$, Februari 2026 sebesar $4{,}02\%$, rata-rata $4{,}065\%$, korelasi spasial Pearson $r = +0{,}6293$.

## Review Focus
- Validitas kompilasi Typst: Tidak ada error sintaks kurung, tanda baca rumus, atau referensi gambar.
- Kelengkapan format sub-bab baku A s.d. E/G di setiap bab.
- Ketepatan nama dan identitas anggota kelompok serta pembimbing/penguji.

---

### Task 1: Pembuatan Bagian Awal & Bab I s.d. Bab III pada `laporan_MATH.typ`

**Files:**
- Create: `laporan_MATH.typ`
- Context: `proposal.typ`, `template.typ`, `main.typ`

- [ ] **Step 1:** Buat kerangka berkas `laporan_MATH.typ` yang mengimpor `template.typ`, halaman sampul bertuliskan "LAPORAN PROYEK PENILAIAN SUMATIF AKHIR JENJANG", identitas tim (Adzkya, Aufa, Andrean), lembar pengesahan, kata pengantar, dan daftar isi otomatis.
- [ ] **Step 2:** Tuliskan BAB I (PENDAHULUAN) yang ditransformasikan dari `proposal.typ` Bab I ke dalam sub-bab huruf:
  - Sub-bab A: Latar Belakang Masalah (evaluasi pascapandemi COVID-19, isu pengangguran terdidik).
  - Sub-bab B: Rumusan Masalah.
  - Sub-bab C: Tujuan Penelitian.
  - Sub-bab D: Manfaat Penelitian.
  - Sub-bab E: Batasan Masalah.
- [ ] **Step 3:** Tuliskan BAB II (KAJIAN PUSTAKA) lengkap dengan sub-bab A s.d. G sesuai silabus PSAJ PPLG:
  - Sub-bab A: Tinjauan Objek Penelitian (Ketenagakerjaan BPS & Sakernas).
  - Sub-bab B: Konsep Statistika Deskriptif Berkelompok.
  - Sub-bab C: Konsep Visualisasi Data.
  - Sub-bab D: Konsep Analisis Korelasi dan Regresi Linear (OLS, Formula Kovariansi/Variansi, Interval Prediksi).
  - Sub-bab E: Desain Antarmuka (UI/UX - dashboard analitik & infografis).
  - Sub-bab F: Arsitektur Sistem (Modul data, model, evaluator, inference, pipeline).
  - Sub-bab G: Rencana Implementasi AI (Peramalan deret waktu OLS berlantai NAIRU).
- [ ] **Step 4:** Tuliskan BAB III (METODE PENELITIAN) dengan sub-bab huruf A s.d. D:
  - Sub-bab A: Waktu dan Tempat Penelitian (Laboratorium PPLG SMK Telkom Purwokerto).
  - Sub-bab B: Sumber dan Jenis Data (Data sekunder Sakernas 2015–2025 dan pendidikan 2018–2025).
  - Sub-bab C: Teknik Pengumpulan Data (Studi dokumentasi data terbuka BPS).
  - Sub-bab D: Teknik Analisis Data (Data cleansing, dekomposisi semester, OLS, validasi silang LOOCV, dan uji asumsi klasik).
- [ ] **Step 5:** Jalankan kompilasi typst parsial `typst compile laporan_MATH.typ` untuk memastikan halaman 1 s.d. Bab III terkompilasi tanpa error.

---

### Task 2: Implementasi BAB IV (Hasil Penelitian dan Pembahasan)

**Files:**
- Modify: `laporan_MATH.typ`
- Context: `experiments/ml_pipeline_tpt.py`, `assets/`, `docs/perbandingan_opsi_2_dan_3.md`

- [ ] **Step 1:** Susun Sub-bab A (Pengolahan Data Awal): dokumentasikan tabel time-series TPT 2015–2025, mekanisme penanganan *structural break* pandemi 2020, dan diferensial musiman semester Februari–Agustus ($0{,}09\%$).
- [ ] **Step 2:** Susun Sub-bab B (Tabel Distribusi Frekuensi & Ukuran Pemusatan Data): sajikan sebaran TPT 38 provinsi tahun 2025, hitung mean, median, modus, kuartil, dan standar deviasi secara matematis.
- [ ] **Step 3:** Susun Sub-bab C (Penyajian Visual Data): sematkan gambar `assets/grafik_tren_proyeksi_tpt.png` dan `assets/histogram_tpt_provinsi.png` dengan deskripsi analisis pola tren.
- [ ] **Step 4:** Susun Sub-bab D (Uji Korelasi Variabel): paparkan korelasi Pearson antara rasio tamatan SMA+ ($X$) dengan TPT provinsi ($Y$) ($r = +0{,}6293$, $R^2 = 39{,}60\%$) serta interpretasi fenomena pengangguran terdidik (*educated unemployment*).
- [ ] **Step 5:** Susun Sub-bab E (Pemodelan Regresi Linear & Evaluasi):
  - Uraikan perhitungan manual analitik OLS ($\sum x, \sum y, \sum xy, \sum x^2$).
  - Sajikan formulasi akhir $\hat{Y} = 952{,}28 - 0{,}4680 \cdot t$.
  - Sajikan tabel perbandingan 5 model benchmark (Linear OLS, Polinomial, Holt ES, SMA, NAIRU).
  - Sertakan uji asumsi klasik Gauss-Markov (Shapiro-Wilk $p=0{,}8508$, Durbin-Watson $d=2{,}10$, Breusch-Pagan).
  - Rincikan hasil proyeksi 2026: Agustus ($4{,}11\%$), Februari ($4{,}02\%$), rata-rata tahunan ($4{,}065\%$) serta interval prediksi 95% ($[3{,}50\% \text{ s.d. } 4{,}89\%]$).
- [ ] **Step 6:** Susun Sub-bab F (Pitching Produk): penyampaian manfaat sistem LaborCast bagi pemangku kepentingan (BKK sekolah dan Disnakertrans).
- [ ] **Step 7:** Jalankan `typst compile laporan_MATH.typ` dan verifikasi visual tabel dan gambar.

---

### Task 3: Implementasi BAB V, Daftar Pustaka, Lampiran, & Verifikasi Akhir

**Files:**
- Modify: `laporan_MATH.typ`
- Test/Verification: `typst compile laporan_MATH.typ laporan_MATH.pdf`

- [ ] **Step 1:** Susun BAB V (PENUTUP):
  - Sub-bab A (Kesimpulan): ringkasan model matematis dan angka proyeksi TPT 2026.
  - Sub-bab B (Saran): rekomendasi mitigasi ketenagakerjaan bagi BKK SMK dan kebijakan daerah.
- [ ] **Step 2:** Susun bagian DAFTAR PUSTAKA berformat APA (literatur BPS, ekonometrika Gujarati/Wooldridge, rekayasa perangkat lunak, dan dokumentasi Scikit-Learn/NumPy).
- [ ] **Step 3:** Susun bagian LAMPIRAN:
  - Tautan resmi repositori GitHub: `https://github.com/adzkya-fajri/Analisa-Pengangguran-id`.
  - Logbook progres pengerjaan proyek PSAJ.
  - Lampiran data empiris ringkas 38 provinsi.
- [ ] **Step 4:** Kompilasi dokumen secara menyeluruh ke `laporan_MATH.pdf` dan pastikan tidak ada peringatan (*warnings*) atau pemotongan layout.
- [ ] **Step 5:** Lakukan commit git untuk menyimpan dokumen laporan baru ini ke repositori.
