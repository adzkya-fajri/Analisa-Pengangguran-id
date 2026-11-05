# Dokumen Desain: Transformasi Proposal ke Laporan Akhir PSAJ Matematika (`laporan_MATH.typ`)

**Tautan Repositori:** [https://github.com/adzkya-fajri/Analisa-Pengangguran-id](https://github.com/adzkya-fajri/Analisa-Pengangguran-id)  
**Tanggal:** 2026-11-05  
**Penyusun:** Tim PSAJ Matematika - PPLG SMK Telkom Purwokerto (Adzkya, Aufa, Andrean)

---

## 1. Konteks dan Tujuan (Intent & Why)
Mengubah materi proyek **LaborCast & EduLabor** yang sebelumnya berformat rencana pada `proposal.typ` dan pipeline eksperimen menjadi **Laporan Akhir PSAJ Matematika Terintegrasi PPLG** yang lengkap dan siap sidang. Dokumen disusun dalam berkas sumber baru bernama `laporan_MATH.typ` yang dikompilasi ke `laporan_MATH.pdf`, mempertahankan struktur layout baku sekolah pada `template.typ`.

---

## 2. Ruang Lingkup Kerja (Goals & Non-Goals)
* **Goals:**
  - Membuat berkas `laporan_MATH.typ` tanpa merusak template asli `main.typ`.
  - Mengonversi kalimat rencana (*"akan dilaksanakan"*) menjadi kalimat laporan evaluatif (*"telah dilaksanakan"*).
  - Menyelaraskan struktur sub-bab ke format huruf baku template PSAJ: **A, B, C, dst.**
  - Mengintegrasikan temuan matematis riil:
    * Persamaan OLS: $\hat{Y} = 952{,}28 - 0{,}4680 \cdot t$ ($R^2 = 0{,}9576$).
    * Proyeksi TPT 2026: Agustus ($4{,}11\%$), Februari ($4{,}02\%$), rata-rata tahunan ($4{,}065\%$).
    * Korelasi Pearson Spasial 38 Provinsi: $r = +0{,}6293$.
    * Evaluasi 5 Model Benchmark & Uji Asumsi Klasik Residu Gauss-Markov.
  - Memastikan kompilasi Typst menghasilkan `laporan_MATH.pdf` tanpa galat.
* **Non-Goals:**
  - Mengubah kode analitik yang ada pada `src/laborcast/`.
  - Mengubah makro format baku sekolah pada `template.typ`.

---

## 3. Pendekatan Eksekusi: Bertahap per Tonggak (*Milestone-Based*)
Pengerjaan dibagi ke dalam 3 tahap berurutan:
1. **Tahap 1:** Sampul, Lembar Pengesahan, Kata Pengantar, Daftar Isi, Bab I (Pendahuluan), Bab II (Kajian Pustaka), dan Bab III (Metode Penelitian).
2. **Tahap 2:** Bab IV (Hasil Penelitian dan Pembahasan) — menyajikan pengolahan data awal, tabel distribusi frekuensi, visualisasi data, uji korelasi Pearson, pemodelan OLS & perbandingan model, serta pitching produk.
3. **Tahap 3:** Bab V (Penutup), Daftar Pustaka, Lampiran (termasuk pencantuman tautan repositori GitHub), dan verifikasi kompilasi `laporan_MATH.pdf`.
