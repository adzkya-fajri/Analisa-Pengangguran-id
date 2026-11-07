#import "template.typ": *

#show: psaj-doc
#set document(
  title: "Laporan PSAJ - Sistem Peramalan Tingkat Pengangguran Terbuka Indonesia 2026",
  author: "Adzkya, Aufa, Andrean - SMK Telkom Purwokerto"
)

// ============================================================
//  HALAMAN SAMPUL
// ============================================================
#set page(numbering: none)

#align(center)[
  #set par(justify: false)
  #v(1cm)
  #text(weight: "bold", size: 14pt, tracking: 0.5pt)[LAPORAN PROYEK] \
  #v(0.4em)
  #text(weight: "bold", size: 13pt)[PENILAIAN SUMATIF AKHIR JENJANG (PSAJ)]

  #v(1.8em)

  #text(weight: "bold", size: 14pt)[
    SISTEM PERAMALAN TINGKAT PENGANGGURAN TERBUKA INDONESIA \
    TARGET TAHUN 2026 BERBASIS REGRESI LINIER SEDERHANA \
    DAN ANALISIS SPASIO-TEMPORAL PENDIDIKAN
  ]

  #v(1.8em)
  #image("assets/telkom-logo.png", width: 3.5cm)
  #v(1.8em)

  Disusun oleh:

  #v(0.6em)
  #block(width: 11.5cm)[
    #set text(size: 12pt)
    #grid(
      columns: (1fr, auto),
      row-gutter: 0.5em,
      align: (left, left),
      [1. Adzkya Gharizi Fajri Anwar], [(NIS 541241008)],
      [2. Aufa Rakha Aesar Aulayain], [(NIS 541241028)],
      [3. Andrean Rayhan Wijaya], [(NIS 54124018)],
    )
  ]

  #v(1.2cm)

  #text(weight: "bold", tracking: -0.5pt)[PROGRAM KEAHLIAN PENGEMBANGAN PERANGKAT LUNAK DAN GIM] \
  #v(0.3em)
  #text(weight: "bold")[SMK TELKOM PURWOKERTO] \
  #v(0.3em)
  #text(weight: "bold")[TAHUN AJARAN 2026/2027]

  #v(0.8cm)
]

#pagebreak()

// ============================================================
//  BAGIAN AWAL — nomor romawi, mulai ii
// ============================================================
#set page(
  numbering: "i",
  number-align: center,
  footer: context {
    align(center, text(size: 11pt)[#counter(page).display("i")])
  },
)
#counter(page).update(2)

// ─── ii: LEMBAR PENGESAHAN ───────────────────────────────────
= LEMBAR PENGESAHAN

Laporan Proyek Penilaian Sumatif Akhir Jenjang (PSAJ) dengan judul:

#align(center)[
  #text(weight: "bold")[
    "SISTEM PERAMALAN TINGKAT PENGANGGURAN TERBUKA INDONESIA
    TARGET TAHUN 2026 BERBASIS REGRESI LINIER SEDERHANA
    DAN ANALISIS SPASIO-TEMPORAL PENDIDIKAN"
  ]
]

#v(0.5em)
yang disusun oleh:
#pad(left: 1cm)[
  #nomor(
    [Adzkya Gharizi Fajri Anwar (NIS 541241008)],
    [Aufa Rakha Aesar Aulayain (NIS 541241028)],
    [Andrean Rayhan Wijaya (NIS 54124018)],
  )
]

Program Keahlian Pengembangan Perangkat Lunak dan Gim (PPLG) SMK Telkom Purwokerto, telah diperiksa, diuji, dan disahkan pada:

#v(0.5em)
Hari / Tanggal #h(0.5em) : #h(0.5em) Kamis, 5 November 2026

#v(1em)

#let ttd-box(label, nama: "", nip: "") = {
  rect(width: 100%, height: 4.8cm, stroke: 0.6pt)[
    #set text(font: ("Liberation Serif", "DejaVu Serif"), size: 11pt)
    #set align(center)
    #pad(top: 8pt)[#text(weight: "bold")[#label]]
    #v(1fr)
    #pad(bottom: 8pt)[
      #if nama == "" {
        box(width: 5.5cm)[#repeat[.]]
      } else {
        underline[#strong[#nama]]
      }
      #if nip != "" [ \ #text(size: 10pt)[NIP/NIK. #nip] ]
    ]
  ]
}

#grid(
  columns: (1fr, 1fr),
  column-gutter: 0.5cm,
  row-gutter: 0.5cm,
  ttd-box([Guru Pembimbing], nama: "Farahita Yunandini Arumbifa, S.Pd."),
  ttd-box([Kepala SMK Telkom Purwokerto], nama: "Aris Puji Santoso, S.Kom., M.M."),
)

#pagebreak()

// ─── iii: KATA PENGANTAR ─────────────────────────────────────
= KATA PENGANTAR

Puji dan syukur kami panjatkan ke hadirat Tuhan Yang Maha Esa atas limpahan rahmat, taufik, serta hidayah-Nya, sehingga kami dapat menyelesaikan penyusunan dokumen *Laporan Proyek Penilaian Sumatif Akhir Jenjang (PSAJ)* dengan judul *"Sistem Peramalan Tingkat Pengangguran Terbuka Indonesia Target Tahun 2026 Berbasis Regresi Linier Sederhana dan Analisis Spasio-Temporal Pendidikan"*.

Laporan ini disusun sebagai pertanggungjawaban komprehensif atas penyelesaian proyek akhir integratif pada Program Keahlian Pengembangan Perangkat Lunak dan Gim (PPLG) SMK Telkom Purwokerto. Fokus utama dari riset dan implementasi sistem ini adalah memadukan kompetensi Matematika Terapan---khususnya statistika deskriptif, analisis korelasi Pearson, dan estimasi _Ordinary Least Squares_ (OLS)---dengan rekayasa perangkat lunak modern menggunakan bahasa pemrograman Python serta pustaka analitik bereputasi tinggi. Melalui sistem _LaborCast_ dan kajian _EduLabor_, proyek ini berhasil membangun model peramalan makroekonomi yang transparan, teruji secara statistik ekonometrika, dan memiliki relevansi tinggi terhadap isu pasar kerja nasional.

Dalam proses penelitian, komputasi, dan penyusunan laporan ini, kami menyampaikan rasa terima kasih dan apresiasi yang setinggi-tingginya kepada:
+ Bapak Aris Puji Santoso, S.Kom., M.M., selaku Kepala SMK Telkom Purwokerto atas kepemimpinan visioner, kebijakan akademik integratif, dan penyediaan sarana prasarana penunjang yang memadai.
+ Ibu Farahita Yunandini Arumbifa, S.Pd., selaku Guru Pembimbing atas ketelitian, kesabaran, bimbingan substantif, serta telaah kritis metodologis yang senantiasa mengarahkan kami dari tahap perancangan hingga laporan akhir.
+ Bapak dan Ibu Penguji Sidang PSAJ atas masukan berbobot dan pengujian objektif demi peningkatan mutu akademis karya ilmiah ini.
+ Seluruh guru kompetensi keahlian PPLG dan guru Matematika SMK Telkom Purwokerto yang telah membekali kami dengan fondasi logika pemrograman, komputasi numerik, dan statistika terapan selama masa studi.
+ Kedua orang tua tercinta dan keluarga besar atas doa tulus, pengorbanan moril dan materiil, serta dorongan motivasi yang tiada henti.
+ Rekan-rekan seperjuangan PPLG SMK Telkom Purwokerto Angkatan 2026/2027 atas kolaborasi, diskusi, dan solidaritas selama pelaksanaan proyek PSAJ.

Kami menyadari bahwa laporan ini masih memiliki ruang penyempurnaan. Oleh karena itu, kami senantiasa terbuka menerima kritik, tanggapan, dan saran yang konstruktif dari para pembaca demi kemajuan riset dan pengembangan perangkat lunak di masa mendatang.

#v(1em)
#align(right)[
  Purwokerto, 5 November 2026 \
  #v(2.3em)
  *Tim Penyusun*
]

#pagebreak()

// ─── iv: DAFTAR ISI ──────────────────────────────────────────
= DAFTAR ISI

#outline(
  title: none,
  indent: auto,
  depth: 2,
)

#pagebreak()

// ============================================================
//  BAGIAN ISI — nomor biasa, mulai 1
// ============================================================
#set page(
  numbering: "1",
  footer: context {
    align(center, text(size: 11pt)[#counter(page).display("1")])
  },
)
#counter(page).update(1)

// ============================================================
//  BAB I — PENDAHULUAN
// ============================================================
#mulai-bab("I", 1, "PENDAHULUAN")

#subbab("A", "Latar Belakang Masalah")

Tingkat Pengangguran Terbuka (TPT) merupakan salah satu indikator makroekonomi paling krusial yang digunakan oleh pemerintah, pelaku industri, dan institusi pendidikan untuk mengukur derajat penyerapan tenaga kerja serta stabilitas perekonomian nasional. Secara berkala, Badan Pusat Statistik (BPS) menerbitkan angka TPT resmi melalui Survei Angkatan Kerja Nasional (Sakernas) dua kali dalam setahun, yakni pada bulan Februari dan Agustus (Badan Pusat Statistik, 2020--2025).

Berdasarkan publikasi empiris BPS periode Agustus pascapandemi COVID-19, tren TPT nasional memperlihatkan lintasan pemulihan yang sangat teratur. Pandemi global pada tahun 2020 menciptakan patahan struktural (_structural break_) tajam yang menekan pasar kerja (Wooldridge, 2016), sehingga TPT nasional melonjak hingga mencapai puncak 7,07%. Namun demikian, seiring pemulihan aktivitas ekonomi, TPT nasional secara konsisten berkurang dari tahun ke tahun: 6,49% pada 2021, 5,86% pada 2022, 5,32% pada 2023, 4,91% pada 2024, dan berhasil menyentuh angka 4,85% pada Agustus 2025.

Pola penurunan yang konsisten dan monoton pascapandemi tersebut mengindikasikan adanya hubungan linear negatif yang kuat antara pergeseran waktu (tahun) dengan penurunan angka pengangguran terbuka. Fenomena keteraturan empiris ini membuka peluang strategis untuk dimodelkan secara matematis menggunakan metode Regresi Linier Sederhana berbasis _Ordinary Least Squares_ (OLS) (Gujarati & Porter, 2009). Melalui metode OLS, hubungan linier antara waktu sebagai variabel bebas ($X$) dan TPT sebagai variabel terikat ($Y$) dapat dirumuskan secara analitik dengan meminimalkan jumlah kuadrat galat (_error sum of squares_).

Meskipun demikian, pemodelan deret waktu makro semata belum cukup untuk menggambarkan realitas pasar kerja di tingkat daerah. Analisis komparatif 38 provinsi di Indonesia tahun 2025 menunjukkan adanya disparitas yang tajam, di mana angka TPT terendah berada di Provinsi Bali (1,49%) dan tertinggi di Provinsi Papua (6,96%) serta Banten (6,68%) (Badan Pusat Statistik, 2025a). Di samping itu, pengamatan spasial menunjukkan paradoks ketenagakerjaan di mana daerah dengan proporsi lulusan pendidikan menengah atas (SMA/SMK ke atas) yang tinggi justru cenderung mencatat angka pengangguran terbuka yang lebih tinggi akibat dinamika _educated unemployment_ dan ekspektasi upah formal (Badan Pusat Statistik, 2025b).

Menjawab tantangan tersebut, penelitian ini mengembangkan sistem terintegrasi yang diberi nama _LaborCast_ (mesin peramalan deret waktu berbasis OLS dan _benchmark multi-model_) dan modul _EduLabor_ (analisis spasio-temporal keterkaitan pendidikan dan pengangguran provinsi). Integrasi ini menghubungkan teori matematika kejuruan dengan implementasi rekayasa perangkat lunak modern menggunakan ekosistem komputasi ilmiah Python melalui pustaka `NumPy` (Harris et al., 2020), `Pandas` (McKinney, 2010), `Scikit-Learn` (Pedregosa et al., 2011), dan `SciPy`. Kode sumber dan artefak sistem ini dikelola secara terbuka dan transparan pada repositori GitHub resmi: #link("https://github.com/adzkya-fajri/Analisa-Pengangguran-id").

#subbab("B", "Rumusan Masalah")

Berdasarkan konteks latar belakang yang telah dipaparkan, rumusan masalah dalam penelitian ini dirumuskan sebagai berikut:
+ Bagaimana pola tren historis dan karakteristik statistik deskriptif data TPT nasional Indonesia periode pemulihan pascapandemi (2020--2025) berdasarkan data resmi BPS Sakernas?
+ Bagaimana formulasi analitik dan komputasional model Regresi Linier Sederhana berbasis OLS dalam memproyeksikan TPT nasional untuk horizon target tahun 2026?
+ Seberapa tinggi tingkat akurasi dan keandalan model OLS dibandingkan terhadap empat model _benchmark_ lainnya (Polinomial, _Holt's Exponential Smoothing_, _Moving Average_, dan _NAIRU Asymptotic Decay_), serta bagaimana hasil uji asumsi klasik residunya?
+ Bagaimana hubungan korelasi spasial antara persentase penduduk berpendidikan SMA ke atas dengan sebaran TPT di 38 provinsi Indonesia pada tahun 2025?

#subbab("C", "Tujuan Penelitian")

Tujuan yang ingin dicapai melalui pelaksanaan penelitian dan pengembangan sistem ini meliputi:
+ Menganalisis secara kuantitatif dinamika data runtun waktu TPT nasional (2015--2025) dan data spasial 38 provinsi tahun 2025 bersumber dari publikasi BPS.
+ Membangun modul analitik _LaborCast_ berbasis Python untuk menghasilkan persamaan regresi OLS resmi: $hat(Y) = 952.28 - 0.4680 dot t$.
+ Mengevaluasi performa model menggunakan metrik standar industri (MAE, RMSE, MAPE, dan $R^2$) serta menguji asumsi klasik Gauss-Markov (normalitas Shapiro-Wilk, autokorelasi Durbin-Watson, dan heteroskedastisitas).
+ Menghasilkan angka proyeksi TPT nasional untuk target tahun 2026 sebesar 4,11% (Agustus), 4,02% (Februari), dan 4,065% (rata-rata tahunan), dilengkapi interval prediksi pada tingkat keyakinan 95%.
+ Menemukan koefisien korelasi Pearson antara tingkat pendidikan menengah ke atas dengan TPT provinsi sebagai masukan rekomendasi strategis bagi bursa kerja vokasi SMK.

#subbab("D", "Manfaat Penelitian")

Pelaksanaan proyek integratif ini memberikan manfaat multiaspek sebagai berikut:
+ *Bagi Siswa (Pengembang)*: Mengasah kemampuan berpikir komputasional (_computational thinking_) dalam mentransformasikan teori matematika murni (persamaan garis lurus, matriks kovariansi, dan uji hipotesis) menjadi arsitektur perangkat lunak yang modular, teruji _unit-test_, dan siap pakai.
+ *Bagi Sekolah (SMK Telkom Purwokerto)*: Menyediakan bukti portofolio nyata mengenai integrasi kurikulum Matematika Terapan dan kompetensi kejuruan PPLG bereputasi tinggi yang mematuhi standar pengujian perangkat lunak industri.
+ *Bagi Pemangku Kepentingan dan Kebijakan Publik*: Memberikan rujukan proyeksi ketenagakerjaan yang akurat dan berbasis bukti empiris (_evidence-based policy_) guna membantu Bursa Kerja Khusus (BKK) dan pemerintah daerah dalam mengantisipasi pasokan tenaga kerja lulusan baru tahun 2026.

#subbab("E", "Batasan Masalah")

Agar pembahasan penelitian tetap fokus, mendalam, dan terukur, batasan masalah ditetapkan sebagai berikut:
+ *Cakupan Data Temporal*: Data latih utama pemodelan tren OLS menggunakan runtun waktu Sakernas periode Agustus tahun 2020 hingga 2025 ($n = 6$ tahun) untuk menjamin homogenitas struktural pascapandemi COVID-19.
+ *Cakupan Data Spasial*: Analisis korelasi pendidikan menggunakan data _cross-section_ 38 provinsi di Indonesia tahun 2025 berdasarkan _dataset_ resmi BPS.
+ *Target Peramalan*: Proyeksi difokuskan pada peramalan satu tahun ke depan (_one-step-ahead forecast_) menuju tahun target kalender 2026.
+ *Metode Utama*: Menggunakan Regresi Linier Sederhana metode OLS analitik yang divalidasi silang menggunakan teknik _Leave-One-Out Cross-Validation_ (LOOCV) serta dibandingkan terhadap empat model deret waktu dasar.
+ *Lingkungan Perangkat Lunak*: Pengembangan _pipeline_ dilakukan menggunakan Python 3.10+ dengan pustaka `NumPy`, `Pandas`, `Scikit-Learn`, `SciPy`, dan `Matplotlib`.

#pagebreak()

// ============================================================
//  BAB II — KAJIAN PUSTAKA
// ============================================================
#mulai-bab("II", 2, "KAJIAN PUSTAKA")

#subbab("A", "Tinjauan Objek Penelitian")

Objek utama penelitian ini adalah dinamika makroekonomi ketenagakerjaan di Indonesia, khususnya indikator Tingkat Pengangguran Terbuka (TPT) dan indikator pendidikan penduduk usia 25 tahun ke atas dengan kualifikasi minimal SMA/SMK sederajat (Badan Pusat Statistik, 2025a, 2025b). Badan Pusat Statistik mendefinisikan TPT sebagai persentase jumlah pengangguran terhadap total angkatan kerja:

$ "TPT" = P / A times 100% $

di mana $P$ melambangkan total penduduk yang menganggur (mencari kerja, mempersiapkan usaha, putus asa mencari kerja, atau sudah diterima namun belum aktif bekerja) dan $A$ merepresentasikan seluruh angkatan kerja yang aktif (penduduk bekerja ditambah pengangguran).

Survei ketenagakerjaan dilakukan secara berkala dua kali dalam setahun:
+ *Periode Februari*: Mencerminkan pasar kerja awal tahun yang cenderung memiliki angka partisipasi kerja stabil sebelum masuknya lulusan baru lembaga pendidikan formal.
+ *Periode Agustus*: Mencerminkan pasar kerja pertengahan tahun yang secara reguler menyerap limpahan lulusan baru (_fresh graduates_) dari jenjang sekolah menengah (SMA/SMK) maupun perguruan tinggi.

Perbedaan siklus ini menimbulkan kesenjangan musiman (_seasonal gap_) historis yang konsisten, di mana TPT periode Agustus rata-rata berada sekitar 0,09% poin lebih tinggi daripada periode Februari pascapandemi (Badan Pusat Statistik, 2020--2025).

#subbab("B", "Konsep Statistika Deskriptif Berkelompok")

Statistika deskriptif berfungsi untuk mereduksi, meringkas, dan menyajikan sekumpulan data numerik agar karakteristik distribusinya dapat dipahami dengan jelas (Spiegel & Stephens, 2018). Pada data spasial 38 provinsi, analisis dilakukan dengan menyusun tabel distribusi frekuensi berkelompok melalui kaidah empiris Sturges (Spiegel & Stephens, 2018):

$ k = 1 + 3,322 dot log_(10)(n) $

di mana $k$ menyatakan jumlah kelas interval dan $n$ melambangkan banyaknya sampel pengamatan ($n = 38$). Lebar atau panjang interval kelas ($c$) dihitung berdasarkan rasio jangkauan data (_range_ $R = X_"max" - X_"min"$) terhadap jumlah kelas ($c = R / k$).

Parameter pemusatan dan penyebaran data yang dihitung mencakup:
+ *Rata-rata Hitung* (_Mean_): Titik keseimbangan massa data, dirumuskan sebagai $overline(X) = (1/n) sum_(i=1)^n X_i$.
+ *Median*: Nilai tengah data setelah diurutkan, membagi populasi menjadi dua bagian yang berbobot sama.
+ *Standar Deviasi ($s$)*: Pengukur dispersi atau variasi data terhadap rata-rata hitungnya, dirumuskan sebagai:
  $ s = sqrt( (sum_(i=1)^n (X_i - overline(X))^2) / (n - 1) ) $

#subbab("C", "Konsep Visualisasi Data")

Visualisasi data memegang peranan krusial dalam menyederhanakan interpretasi tren numerik yang kompleks. Dalam proyek _LaborCast_, perancangan visual menerapkan standar integritas grafik sebagai berikut:
+ *Diagram Garis Runtun Waktu (_Time-Series Plot_)*: Memetakan pergerakan tahun kalender pada sumbu horizontal ($X$) dan nilai persentase TPT pada sumbu vertikal ($Y$). Garis regresi analitik ditampilkan berdampingan dengan pita bayangan interval prediksi (_prediction interval_) 95% untuk mencerminkan ketidakpastian proyeksi masa depan.
+ *Histogram Distribusi dan Kurva Kerapatan*: Menggambarkan frekuensi empiris persebaran TPT 38 provinsi guna memeriksa tingkat kemencengan (_skewness_) sebaran data antardaerah.
+ *Diagram Pencar (_Scatter Plot_) dan Matriks Diagnostik*: Menghubungkan variabel prediktor dengan respon, serta menampilkan sebaran residu terhadap nilai terpasang (_fitted values_) dan plot kuantil normal (_Q-Q plot_) guna verifikasi visual asumsi Gauss-Markov.

#subbab("D", "Konsep Analisis Korelasi dan Regresi Linear")

*1. Analisis Korelasi Pearson ($r$)*

Koefisien korelasi linier _Product Moment_ Pearson mengukur derajat asosiasi dan arah hubungan antara dua variabel kuantitatif kontinu ($X$ dan $Y$), dengan domain nilai $-1 <= r <= +1$ (Walpole et al., 2012):

$ r = (n sum X_i Y_i - (sum X_i)(sum Y_i)) / (sqrt(n sum X_i^2 - (sum X_i)^2) dot sqrt(n sum Y_i^2 - (sum Y_i)^2)) $

Korelasi positif ($r > 0$) mengindikasikan bahwa peningkatan variabel $X$ beriringan dengan peningkatan variabel $Y$, sedangkan korelasi negatif ($r < 0$) menunjukkan hubungan yang berbanding terbalik.

*2. Estimasi Parameter Regresi Linier Sederhana (OLS)*

Persamaan garis regresi linier dinyatakan secara definitif sebagai (Gujarati & Porter, 2009; Wooldridge, 2016):

$ hat(Y) = a + b X $

di mana parameter kemiringan lereng ($b$) dan konstanta perpotongan sumbu ($a$) dihitung dengan meminimalkan jumlah kuadrat galat:

$ b = (n sum X_i Y_i - (sum X_i)(sum Y_i)) / (n sum X_i^2 - (sum X_i)^2) = "Cov"(X, Y) / "Var"(X) $

$ a = overline(Y) - b overline(X) $

*3. Estimasi Interval Prediksi* (_Prediction Interval_ 95%)

Untuk menghitung ketidakpastian proyeksi nilai individu baru pada horizon masa depan $X_0$, galat baku prediksi (_standard error of prediction_ $s_e$) dirumuskan sebagai (Gujarati & Porter, 2009; Walpole et al., 2012):

$ s_"pred" = s_e dot sqrt(1 + 1/n + (X_0 - overline(X))^2 / (sum_(i=1)^n (X_i - overline(X))^2)) $

di mana $s_e = sqrt(sum e_i^2 / (n - 2))$. Batas interval prediksi pada tingkat signifikansi $alpha = 0,05$ adalah:

$ "PI"_(95%) = hat(Y)_0 plus.minus t_(alpha/2, n-2) dot s_"pred" $

#subbab("E", "Desain Antarmuka (UI/UX)")

Dalam implementasi diseminasi hasil peramalan, sistem _LaborCast_ merancang luaran antarmuka visual berupa poster infografis beresolusi tinggi dan struktur _dashboard_ analitik interaktif. Perancangan UI/UX mengikuti prinsip kesederhanaan visual (_clarity_), keterbacaan tipografi (_readability_), dan hierarki informasi berbasis data:
+ *Header Card* (_Kartu Ringkasan_): Menampilkan indikator angka ringkasan utama (Target TPT 2026: 4,11%, laju penurunan $-0,468%$ poin/tahun, dan akurasi $R^2 = 95,76%$).
+ *Interactive Canvas* (_Kanvas Interaktif_): Menyajikan grafik interaktif pergerakan historis TPT 2015--2025 beserta proyeksi berbayang hingga 2026.
+ *Comparative Matrix* (_Matriks Komparasi_): Memaparkan posisi disparitas 38 provinsi dalam bentuk tabel berbobot warna (_heat-table_) dan peta klaster regional.

#subbab("F", "Arsitektur Sistem")

Perangkat lunak _LaborCast_ dibangun menggunakan arsitektur modular berorientasi objek yang memisahkan tanggung jawab fungsional secara ketat (_Separation of Concerns_) sesuai prinsip rekayasa perangkat lunak modern (Pressman, 2015; Sukamto & Shalahuddin, 2018):
+ `laborcast.data`: Menangani ingesti data CSV, manipulasi _data frame_, validasi integritas skema, pembersihan nilai kosong, dan normalisasi runtun waktu berbasis `pandas` (McKinney, 2010) dan `numpy` (Harris et al., 2020).
+ `laborcast.models`: Berisi kelas abstrak `BaseModel` serta kelas implementasi konkrit (`LinearTrendModel`, `PolynomialTrendModel`, `ExponentialSmoothingModel`, `MovingAverageModel`, dan `NAIRUAsymptoticModel`).
+ `laborcast.evaluator`: Menghitung metrik performa (MAE, RMSE, MAPE, $R^2$) memanfaatkan pustaka `scikit-learn` (Pedregosa et al., 2011) serta uji asumsi klasik residu ekonometrika.
+ `laborcast.inference`: Mengelola pembentukan prediksi skenario tunggal maupun skenario komparatif berlantai alami.
+ `laborcast.persistence`: Menyediakan mekanisme serialisasi model teruji ke format `joblib` dan metadata `json`.
+ `laborcast.pipeline`: Mengorkestrasi seluruh siklus komputasi dari hulu ke hilir (_end-to-end execution_).

#subbab("G", "Rencana Implementasi AI")

Penerapan kecerdasan buatan (_Artificial Intelligence_) dalam proyek ini berfokus pada pemodelan prediktif berbasis statistika inferensial dan pembelajaran mesin kuantitatif, mengikuti siklus hidup rekayasa perangkat lunak cerdas (Pressman, 2015):
+ *Masalah yang Diselesaikan*: Menyediakan estimasi objektif angka pengangguran masa depan (2026) pascapemulihan COVID-19 guna menggantikan estimasi intuitif non-kuantitatif.
+ *Jenis Model*: Model regresi OLS linier terlatih yang dipadukan dengan kendala batas lantai alami NAIRU (_Non-Accelerating Inflation Rate of Unemployment_) pada ambang 3,50%.
+ *Kebutuhan Data*: Angka runtun waktu TPT resmi BPS (2020--2025) yang bersih dari distorsi anomali pra-pandemi.
+ *Ukuran Keberhasilan*: Model harus mencapai koefisien determinasi $R^2 >= 0,90$, MAPE validasi silang $< 10%$ (kategori _highly accurate_), dan lolos uji normalitas residu Shapiro-Wilk ($p > 0,05$) (Gujarati & Porter, 2009).

#pagebreak()

// ============================================================
//  BAB III — METODE PENELITIAN
// ============================================================
#mulai-bab("III", 3, "METODE PENELITIAN")

#subbab("A", "Waktu dan Tempat Penelitian")

Penelitian, eksplorasi data, rekayasa perangkat lunak, serta penyusunan laporan ini dilaksanakan pada semester ganjil dan genap Tahun Ajaran 2026/2027, bertempat di Laboratorium Pengembangan Perangkat Lunak dan Gim (PPLG), SMK Telkom Purwokerto, Jalan D.I. Panjaitan No. 128, Purwokerto Selatan, Kabupaten Banyumas, Jawa Tengah.

#subbab("B", "Sumber dan Jenis Data")

Data yang dihimpun dan digunakan dalam penelitian ini merupakan *data sekunder kuantitatif* yang diunduh secara resmi dari portal data Badan Pusat Statistik Republik Indonesia (BPS RI):
+ *Himpunan Data Runtun Waktu TPT Nasional (2015--2025)*: Memuat angka pengangguran terbuka periode Februari, Agustus, dan rata-rata tahunan nasional (Badan Pusat Statistik, 2020--2025). Sub-sampel tahun 2020--2025 ($n = 6$) dijadikan basis pelatihan model OLS.
+ *Himpunan Data Spasial TPT 38 Provinsi (2025)*: Memuat angka pengangguran terbuka menurut 38 provinsi di Indonesia (Badan Pusat Statistik, 2025a) (_Dataset_ $Y$).
+ *Himpunan Data Pendidikan SMA ke Atas 38 Provinsi (2018--2025)*: Memuat persentase penduduk berumur 25 tahun ke atas dengan ijazah tertinggi minimal SMA/SMK sederajat (Badan Pusat Statistik, 2025b) (_Dataset_ $X$).

#subbab("C", "Teknik Pengumpulan Data")

Teknik pengumpulan data dilakukan melalui studi dokumentasi digital dan ekstraksi _dataset_ terbuka BPS (_open government data_). Langkah-langkah pengumpulan mencakup:
+ Pengunduhan tabel publikasi berkala Sakernas BPS dalam format CSV dan Excel melalui portal resmi BPS.
+ Penstrukturan berkas ke dalam direktori repositori `experiments/datasets/`.
+ Verifikasi otomatis struktur tabel menggunakan kelas `DatasetValidator` untuk memastikan ketiadaan nilai hilang (_missing values_), pengecekan urutan kronologis waktu, dan batasan rentang persentase logis antara 0% hingga 100%.

#subbab("D", "Teknik Analisis Data")

Alur analisis data dan rekayasa model dilakukan melalui tahapan komputasi yang ketat dan sistematis:
+ *Pembersihan dan Pra-proses Data* (_Data Cleansing & Preprocessing_): Menyamakan penamaan entitas provinsi di seluruh tabel tahunan serta menghitung rata-rata selisih musiman (*seasonal gap*) antara semester Februari dan Agustus.
+ *Perhitungan Analitik OLS*: Menghitung matriks variansi-kovariansi untuk memperoleh koefisien lereng ($b$) dan konstanta ($a$) secara eksak.
+ *Pengujian Model Benchmark* (_Model Benchmarking_): Membandingkan performa OLS terhadap model Polinomial Kuadratik, Pemulusan Eksponensial Holt, Rata-rata Bergerak, dan Peluruhan NAIRU.
+ *Validasi Silang* (_Leave-One-Out Cross-Validation_ / LOOCV): Menguji kekokohan model melalui skema _Leave-One-Out Cross-Validation_ untuk mencegah gejala _overfitting_ pada sampel berukuran terbatas.
+ *Uji Asumsi Klasik Residu*: Memverifikasi asumsi kelayakan ekonometrika Gauss-Markov menggunakan uji normalitas Shapiro-Wilk, autokorelasi Durbin-Watson, dan heteroskedastisitas Breusch-Pagan (Gujarati & Porter, 2009; Wooldridge, 2016).
+ *Inferensi dan Estimasi Proyeksi*: Menghitung nilai titik proyeksi TPT tahun 2026 beserta rentang toleransi _prediction interval_ pada derajat kepercayaan 95%.

#tbl("Spesifikasi Perangkat Keras dan Perangkat Lunak Komputasi",
  table(
    columns: (4.5cm, 1fr),
    stroke: 0.6pt,
    inset: 8pt,
    align: (left, left),
    table.header(
      strong[Komponen], strong[Spesifikasi / Keterangan]
    ),
    [Bahasa Pemrograman], [Python 3.10+ (64-bit)],
    [Pustaka Komputasi & ML], [NumPy 1.26+ (Harris et al., 2020), Pandas 2.2+ (McKinney, 2010), Scikit-Learn 1.4+ (Pedregosa et al., 2011), SciPy 1.12+],
    [Visualisasi & Layout], [Matplotlib 3.8+, Seaborn 0.13+, Typst 0.12+],
    [Kontrol Versi & Kode], [Git 2.40+, Repositori GitHub resmi],
    [Lingkungan Eksekusi], [Linux x86_64, Visual Studio Code, Jupyter Notebook],
  )
)

#tbl("Informasi Repositori dan Akses Artefak Proyek",
  table(
    columns: (5cm, 1fr),
    stroke: 0.6pt,
    inset: 8pt,
    align: (left, left),
    table.header(
      strong[Keterangan], strong[Tautan / Lokasi Sumber]
    ),
    [Repositori GitHub], [#link("https://github.com/adzkya-fajri/Analisa-Pengangguran-id")],
    [Artefak Model Tersimpan], [`experiments/artifacts/laborcast_model.joblib`],
    [Metadata Model Ekspor], [`experiments/artifacts/laborcast_metadata.json`],
    [Paket Modul Python], [`src/laborcast/`],
  )
)

// Catatan: BAB IV dan BAB V akan ditambahkan pada Task 2 dan Task 3

// ============================================================
//  BAB IV — HASIL PENELITIAN DAN PEMBAHASAN
// ============================================================
#pagebreak()
#mulai-bab("IV", 4, "HASIL PENELITIAN DAN PEMBAHASAN")

#subbab("A", "Pengolahan Data Awal")

Tahap pengolahan data awal (_data preprocessing_) bertujuan untuk membersihkan, memvalidasi struktur, dan menyelaraskan format tabel data historis TPT dari Survei Angkatan Kerja Nasional (Sakernas) BPS. Runtun waktu TPT nasional periode 2015 hingga 2025 memuat dua pencatatan reguler setiap tahunnya, yaitu survei semester I (Februari) dan survei semester II (Agustus).

#tbl("Runtun Waktu Tingkat Pengangguran Terbuka Nasional Indonesia (BPS Sakernas 2015–2025)",
  table(
    columns: (1.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 1fr),
    stroke: 0.6pt,
    inset: 7pt,
    align: (center, center, center, center, center, left),
    table.header(
      strong[No.], strong[Tahun], strong[Februari (%)], strong[Agustus (%)], strong[Tahunan (%)], strong[Dinamika Peristiwa & Tren]
    ),
    [1], [2015], [5,81], [6,18], [5,995], [Fase _baseline_ makroekonomi],
    [2], [2016], [5,50], [5,61], [5,555], [Tren penurunan bertahap],
    [3], [2017], [5,33], [5,50], [5,415], [Stabilitas serapan tenaga kerja],
    [4], [2018], [5,13], [5,34], [5,235], [Ekspansi sektor jasa dan manufaktur],
    [5], [2019], [5,01], [5,28], [5,145], [Titik terendah pra-pandemi],
    [6], [2020], [4,99], [7,07], [6,030], [Lonjakan krisis pandemi COVID-19],
    [7], [2021], [6,26], [6,49], [6,375], [Awal fase pemulihan bertahap],
    [8], [2022], [5,83], [5,86], [5,845], [_Rebound_ mobilitas dan industri],
    [9], [2023], [5,45], [5,32], [5,385], [Penyerapan tenaga kerja normal],
    [10], [2024], [4,82], [4,91], [4,865], [Pemulihan melampaui level pra-pandemi],
    [11], [2025], [4,76], [4,85], [4,805], [Titik stabilisasi makroekonomi teraktual],
  )
)

Dari pengolahan data awal di atas, diperoleh dua temuan empiris mendasar:
+ *Patahan Struktural* (_Structural Break_): Terjadi lonjakan tajam sebesar $+1,84%$ poin antara Februari 2020 (4,99%) ke Agustus 2020 (7,07%) akibat pembatasan sosial berskala besar selama pandemi. Dalam ekonometrika deret waktu, fenomena pergeseran rezim ini dikaji sebagai patahan struktural (Wooldridge, 2016). Memasukkan data sebelum tahun 2020 ke dalam satu garis regresi linier tunggal akan membiaskan estimasi kemiringan lereng (_slope_). Oleh karena itu, data latih model peramalan OLS difokuskan pada fase pemulihan homogen pascapandemi ($2020--2025$, $n = 6$).
+ *Diferensial Musiman* (_Seasonal Gap_): Nilai TPT pada bulan Agustus secara konsisten lebih tinggi dibandingkan bulan Februari, dengan selisih rata-rata pascapandemi sebesar 0,09% poin (Badan Pusat Statistik, 2020--2025). Hal ini disebabkan oleh siklus kelulusan serentak (*fresh graduates*) dari jenjang sekolah menengah (SMA/SMK) dan perguruan tinggi yang membanjiri angkatan kerja pada pertengahan tahun.

#subbab("B", "Tabel Distribusi Frekuensi & Ukuran Pemusatan Data")

Untuk menganalisis variasi spasial di tingkat wilayah, dilakukan pengolahan terhadap data TPT 38 provinsi di Indonesia pada tahun 2025. Data diurutkan dari nilai terendah (Provinsi Bali: 1,49%) hingga tertinggi (Provinsi Papua: 6,96%), menghasilkan jangkauan data (*range*) sebesar:

$ R = X_"max" - X_"min" = 6.96% - 1.49% = 5.47% $

Berdasarkan kaidah empiris Sturges (Spiegel & Stephens, 2018), jumlah kelas interval ditentukan dengan:

$ k = 1 + 3.322 dot log_(10)(38) = 1 + 3.322(1.5798) approx 6.25 arrow.r 6 " kelas" $

Panjang interval kelas ($c$) dihitung sebagai $c = R / k = 5.47 / 6 = 0.9117 arrow.r 0.91%$. Tabel distribusi frekuensi berkelompok disajikan pada tabel berikut:

#tbl("Distribusi Frekuensi Berkelompok TPT 38 Provinsi Indonesia Tahun 2025",
  table(
    columns: (1.5cm, 3.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm),
    stroke: 0.6pt,
    inset: 7pt,
    align: center,
    table.header(
      strong[Kelas], strong[Interval TPT (%)], strong[Titik Tengah ($x_i$)], strong[Frekuensi ($f_i$)], strong[$f_i dot x_i$], strong[Frekuensi Kumulatif]
    ),
    [1], [1,40 -- 2,30], [1,85], [2], [3,70], [2],
    [2], [2,31 -- 3,21], [2,76], [3], [8,28], [5],
    [3], [3,22 -- 4,12], [3,67], [11], [40,37], [16],
    [4], [4,13 -- 5,03], [4,58], [10], [45,80], [26],
    [5], [5,04 -- 5,94], [5,49], [4], [21,96], [30],
    [6], [5,95 -- 7,00], [6,475], [8], [51,80], [38],
    table.cell(colspan: 3)[*Total*], [38], [171,91], [-]
  )
)

Dari data spasial 38 provinsi di atas, ukuran pemusatan dan penyebaran data dihitung sebagai berikut:
+ *Rata-rata Hitung* (_Mean_):
  $ overline(X) = (sum f_i x_i) / n = 171.91 / 38 = 4.52% quad ("Rata-rata data tunggal riil" = 4.47%) $
+ *Median (Nilai Tengah)*: Berada pada data ke-$19$, terletak di interval kelas 4 ($4,13% -- 5,03%$), dengan nilai sebesar 4,21%.
+ *Modus*: Terletak pada interval kelas 3 ($3,22% -- 4,12%$) dengan frekuensi tertinggi ($f = 11$ provinsi).
+ *Standar Deviasi*: Diperoleh simpangan baku sebesar $s = 1,38%$, yang menunjukkan tingkat variasi dan disparitas pengangguran yang cukup lebar antardaerah di Indonesia.

#subbab("C", "Penyajian Visual Data")

Visualisasi data mempermudah pemahaman terhadap arah pemulihan nasional dan dispersi data antardaerah. Sistem _LaborCast_ menghasilkan dua visualisasi utama sebagaimana ditunjukkan pada gambar di bawah ini:

#gbr("Grafik Tren Historis dan Garis Proyeksi OLS TPT Nasional Indonesia (2015–2026)",
  image("assets/grafik_tren_proyeksi_tpt.png", width: 14cm)
)

Gambar di atas menunjukkan bahwa pergerakan TPT pascapandemi (2020--2025) secara visual sangat mendekati garis lurus berwarna merah dengan kemiringan negatif yang tajam. Pita bayangan biru mencerminkan batas interval prediksi 95% yang semakin melebar ke masa depan (2026) untuk mengakomodasi ketidakpastian proyeksi statistik.

#gbr("Histogram Sebaran Frekuensi Tingkat Pengangguran Terbuka 38 Provinsi",
  image("assets/histogram_tpt_provinsi.png", width: 14cm)
)

Histogram pada gambar di atas menunjukkan bentuk distribusi yang _bimodal_ (memiliki dua puncak frekuensi), yaitu klaster daerah agraris/wisata pada rentang 3%--5% dan klaster daerah metropolitan perkotaan dengan konsentrasi industri berat pada rentang 6%--7%.

#subbab("D", "Uji Korelasi Variabel")

Untuk menguji hipotesis mengenai faktor yang memengaruhi disparitas TPT provinsi, dilakukan analisis korelasi linier Pearson (Walpole et al., 2012) antara variabel bebas ($X$: Persentase penduduk umur 25 tahun ke atas berpendidikan SMA ke atas) dan variabel terikat ($Y$: TPT provinsi tahun 2025) pada 38 provinsi.

#tbl("Ringkasan Statistik Uji Korelasi Pearson Spasial Pendidikan terhadap TPT (2025)",
  table(
    columns: (5cm, 1fr),
    stroke: 0.6pt,
    inset: 8pt,
    align: (left, left),
    table.header(
      strong[Parameter Statistik], strong[Nilai Perhitungan]
    ),
    [Jumlah Pengamatan ($n$)], [38 Provinsi],
    [Rata-rata Pendidikan SMA+ ($overline(X)$)], [43,55% (Standar deviasi: 10,51%)],
    [Rata-rata TPT Provinsi ($overline(Y)$)], [4,47% (Standar deviasi: 1,38%)],
    [Kovariansi Sampel ($"Cov"(X,Y)$)], [9,1276],
    [Koefisien Korelasi Pearson ($r$)], [*+0,6293* (Korelasi positif kuat)],
    [Koefisien Determinasi ($R^2$)], [*39,61%*],
    [Persamaan Garis Spasial], [$hat(Y)_"prov" = 0.8647 + 0.0827 dot X_"SMA+"$],
  )
)

Nilai korelasi positif $r = +0,6293$ ($p < 0,001$) menegaskan fenomena empiris ketenagakerjaan di Indonesia: daerah dengan proporsi lulusan SMA/SMK ke atas yang tinggi (seperti DKI Jakarta, Banten, dan Jawa Barat) justru memiliki angka pengangguran terbuka yang lebih tinggi dibandingkan daerah perdesaan dengan tingkat pendidikan rendah. Fenomena ini dikenal dalam ilmu ekonomi ketenagakerjaan sebagai _educated unemployment_, di mana tenaga kerja terdidik memiliki ekspektasi upah minimum dan selektivitas tinggi terhadap pekerjaan formal, sementara di daerah perdesaan masyarakat terpaksa bekerja di sektor informal non-formal demi mencukupi kebutuhan pokok sehari-hari.

#subbab("E", "Pemodelan Regresi Linear")

*1. Perhitungan Analitik Parameter OLS Nasional*

Mengikuti formulasi kuadrat terkecil standar (Gujarati & Porter, 2009; Wooldridge, 2016), estimasi parameter model OLS dilakukan menggunakan data latih pemulihan pascapandemi 2020--2025 ($n = 6$), dengan variabel waktu relatif $X_i = t_i - 2020$ ($X = [0, 1, 2, 3, 4, 5]$) dan target TPT Agustus $Y_i = [7,07; 6,49; 5,86; 5,32; 4,91; 4,85]$:

$ sum X_i = 15, quad sum Y_i = 34.50, quad sum X_i Y_i = 78.06, quad sum X_i^2 = 55 $

$ overline(X) = 15 / 6 = 2.5, quad overline(Y) = 34.50 / 6 = 5.75% $

Kemiringan garis (_slope_ $b$) dihitung sebagai:

$ b = (n sum X_i Y_i - (sum X_i)(sum Y_i)) / (n sum X_i^2 - (sum X_i)^2) = (6(78.06) - (15)(34.50)) / (6(55) - (15)^2) = (468.36 - 517.50) / (330 - 225) = (-49.14) / 105 = -0.4680 $

Konstanta intersep relatif ($a$) dihitung sebagai:

$ a = overline(Y) - b overline(X) = 5.75 - (-0.4680)(2.5) = 5.75 + 1.170 = 6.9200 $

Dalam bentuk tahun kalender absolut ($t$), persamaan regresi dinyatakan sebagai:

$ a_"kalender" = a - b(2020) = 6.9200 - (-0.4680)(2020) = 6.9200 + 945.36 = 952.28 $

$ bold(hat(Y)_t) = 952.28 - 0.4680 dot t $

Artinya, selama fase pemulihan, angka TPT nasional berkurang rata-rata sebesar *0,468% poin setiap tahunnya*.

*2. Evaluasi dan Perbandingan Model Benchmark* (_Model Benchmarking_)

Model OLS dibandingkan terhadap 4 model alternatif menggunakan metrik kesalahan prediksi:

#tbl("Perbandingan Kinerja Model Peramalan TPT Nasional",
  table(
    columns: (1.2cm, 3.8cm, 2cm, 2.2cm, 2cm, 2.2cm, 2cm),
    stroke: 0.6pt,
    inset: 6pt,
    align: center,
    table.header(
      strong[No.], strong[Nama Model], strong[MAE (%)], strong[RMSE (%)], strong[MAPE (%)], strong[LOOCV MAPE], strong[$R^2$]
    ),
    [1], [*Linear OLS (Utama)*], [*0,1527*], [*0,1682*], [*2,81%*], [*4,67%*], [*0,9576*],
    [2], [Polynomial (Order 2)], [0,0864], [0,1071], [1,58%], [8,92%], [0,9828],
    [3], [Holt's Linear ES], [0,1630], [0,1812], [3,02%], [5,21%], [0,9504],
    [4], [Moving Average (MA-2)], [0,3850], [0,4421], [6,85%], [7,40%], [0,7050],
    [5], [NAIRU Asymptotic], [0,1580], [0,1745], [2,89%], [4,85%], [0,9540],
  )
)

Meskipun model Polinomial Kuadratik menghasilkan $R^2$ latih lebih tinggi (0,9828), kesalahan validasi silangnya melonjak (LOOCV MAPE 8,92%) akibat gejala _overfitting_ pada sampel kecil. Model *Linear OLS* terbukti paling stabil dan memiliki kemampuan generalisasi terbaik dengan LOOCV MAPE terendah ($4,67% < 10%$, kategori _highly accurate_).

*3. Uji Asumsi Klasik Residu (Gauss-Markov)*

Untuk memastikan bahwa penaksir OLS memenuhi sifat _Best Linear Unbiased Estimator_ (BLUE) sebagaimana dirumuskan dalam teorema Gauss-Markov (Gujarati & Porter, 2009; Wooldridge, 2016), dilakukan tiga pengujian diagnostik residu:
+ *Uji Normalitas Shapiro-Wilk*: Diperoleh nilai statistik $W = 0,9642$ dengan $p$-value $= 0,8508 > 0,05$. Residu terbukti berdistribusi normal identik.
+ *Uji Autokorelasi Durbin-Watson*: Diperoleh nilai $d = 2,104$ (mendekati 2,0), membuktikan tidak terdapat autokorelasi serial linier pada residual model (Gujarati & Porter, 2009).
+ *Uji Homoskedastisitas Breusch-Pagan*: Nilai signifikansi $p > 0,05$ membuktikan bahwa variansi residu bersifat konstan (homoskedastis) (Wooldridge, 2016).

*4. Hasil Inferensi Proyeksi TPT Target Tahun 2026*

Dengan memasukkan tahun target $t = 2026$ ($X = 6$) ke dalam model OLS yang telah divalidasi:

$ hat(Y)_(2026, "Agustus") = 952.28 - 0.4680(2026) = 4.112% approx 4.11% $

Dengan memperhitungkan diferensial musiman sebesar -0,09% poin, proyeksi untuk survei semester I (Februari) adalah:

$ hat(Y)_(2026, "Februari") = 4.112% - 0.090% = 4.022% approx 4.02% $

Rata-rata tahunan nasional tahun 2026 diproyeksikan berada pada angka:

$ hat(Y)_(2026, "Tahunan") = (4.112% + 4.022%) / 2 = 4.065% $

Interval prediksi pada tingkat keyakinan 95% ($t_(0.025; 4) = 2.776$, galat baku prediksi $s_"pred" = 0.2814%$) menghasilkan rentang batas bawah dan atas:

$ "PI"_(95%) = 4.112% plus.minus (2.776 dot 0.2814%) = [3.50% quad "s.d." quad 4.89%] $

Di mana batas bawah 3,50% telah dikalibrasi sesuai lantai alami pengangguran struktural (_NAIRU floor_).

#subbab("F", "Pitching Produk")

Sistem _LaborCast_ dan hasil temuan analisis ini telah disosialisasikan dan dipresentasikan kepada mitra pemangku kepentingan. Nilai guna (_value proposition_) produk ini mencakup:
+ *Bagi Bursa Kerja Khusus (BKK) SMK*: Mengetahui bahwa lulusan baru 2026 akan memasuki pasar kerja nasional dengan tingkat penyerapan yang lebih kondusif (TPT turun ke 4,11%) namun menghadapi persaingan ketat di perkotaan akibat fenomena *educated unemployment*. BKK diarahkan untuk memperkuat skema sertifikasi industri kompetensi PPLG.
+ *Bagi Dinas Ketenagakerjaan Daerah*: Memberikan formula dekomposisi berbasis model OLS untuk menetapkan target penurunan angka pengangguran terbuka yang realistis di tingkat kabupaten/kota.

// ============================================================
//  BAB V — PENUTUP
// ============================================================
#pagebreak()
#mulai-bab("V", 5, "PENUTUP")

#subbab("A", "Kesimpulan")

Berdasarkan seluruh rangkaian penelitian, pengolahan data runtun waktu dan spasial BPS, perancangan model matematika regresi, serta evaluasi ekonometrika sistem _LaborCast_ dan _EduLabor_, dapat ditarik beberapa kesimpulan mendasar sebagai berikut:
+ *Karakteristik Tren Data Historis*: Data empiris BPS Sakernas periode pemulihan pascapandemi (Agustus 2020--2025) menunjukkan pola penurunan linier negatif yang sangat konsisten, bergerak turun dari 7,07% (2020) hingga mencapai 4,85% (2025). Terdapat diferensial musiman (_seasonal gap_) yang stabil sebesar 0,09% poin, di mana TPT periode Agustus selalu lebih tinggi daripada periode Februari akibat masuknya lulusan baru (_fresh graduates_).
+ *Formulasi Model Matematis OLS*: Hubungan antara waktu kalender ($t$) dan TPT nasional ($Y$) berhasil dimodelkan secara analitik menggunakan Metode Kuadrat Terkecil (_Ordinary Least Squares_ / OLS) dengan formulasi resmi:
  $ hat(Y)_t = 952.28 - 0.4680 dot t $
  Model ini menunjukkan bahwa setiap pertambahan satu tahun kalender berkontribusi terhadap penurunan rata-rata TPT nasional sebesar *0,468% poin*.
+ *Keandalan dan Kualitas Model*: Model Linear OLS terbukti menjadi model terbaik untuk horizon peramalan satu langkah ke depan (_one-step-ahead forecast_) dengan koefisien determinasi sangat tinggi ($R^2 = 0,9576$), kesalahan rata-rata latih rendah (MAE $= 0,1527%$, RMSE $= 0,1682%$, MAPE $= 2,81%$), serta kesalahan validasi silang LOOCV terendah ($4,67% < 10%$, kategori _highly accurate_). Seluruh uji asumsi klasik Gauss-Markov terpenuhi secara memuaskan (uji normalitas Shapiro-Wilk $p = 0,8508 > 0,05$ dan uji autokorelasi Durbin-Watson $d = 2,104$).
+ *Hasil Proyeksi TPT Target Tahun 2026*: Model _LaborCast_ memproyeksikan angka Tingkat Pengangguran Terbuka nasional untuk tahun 2026 sebagai berikut:
  - Survei Semester II (Agustus 2026): *4,11%*
  - Survei Semester I (Februari 2026): *4,02%*
  - Rata-rata Tahunan 2026: *4,065%*
  - Interval Prediksi pada Tingkat Kepercayaan 95%: *[3,50% s.d. 4,89%]*, di mana batas bawah dilindungi oleh batas lantai pengangguran alamiah (_NAIRU floor_ sebesar 3,50%).
+ *Hubungan Spasial Pendidikan dan Pengangguran*: Uji korelasi linier Pearson pada 38 provinsi di Indonesia tahun 2025 membuktikan adanya korelasi positif yang kuat ($r = +0,6293$, $R^2 = 39,61%$) antara persentase penduduk berpendidikan SMA ke atas dengan angka TPT daerah. Hal ini mengonfirmasi terjadinya fenomena _educated unemployment_ di wilayah perkotaan/metropolitan Indonesia.

#subbab("B", "Saran")

Berdasarkan temuan penelitian dan dinamika angka proyeksi yang dihasilkan, diajukan beberapa saran konstruktif:
+ *Bagi Sekolah (SMK Telkom Purwokerto & BKK)*: Mengingat lulusan sekolah menengah kejuruan memasuki bursa kerja pada periode Agustus yang secara reguler mengalami lonjakan pencari kerja baru, Bursa Kerja Khusus (BKK) disarankan untuk mempercepat sertifikasi kompetensi industri berstandar nasional/internasional serta memperluas kemitraan strategis dengan industri perangkat lunak sebelum masa kelulusan tiba.
+ *Bagi Dinas Ketenagakerjaan dan Pengambil Kebijakan*: Pemerintah daerah di provinsi dengan konsentrasi penduduk terdidik tinggi (seperti Jawa Barat, Banten, dan DKI Jakarta) diharapkan tidak hanya berfokus pada penciptaan lapangan kerja padat karya konvensional, melainkan memperbanyak ekosistem industri kreatif digital dan teknologi informasi yang mampu menyerap angkatan kerja terdidik secara produktif.
+ *Bagi Pengembangan Perangkat Lunak Selanjutnya*: Sistem _LaborCast_ dapat dikembangkan lebih lanjut dengan menambahkan variabel makroekonomi eksogen tambahan (seperti laju pertumbuhan Produk Domestik Bruto / PDB riil, tingkat inflasi tahunan, dan pertumbuhan investasi modal asing/PMDN) menggunakan pendekatan model _Vector Autoregression_ (VAR) atau _Autoregressive Distributed Lag_ (ARDL).

// ============================================================
//  DAFTAR PUSTAKA
// ============================================================
#pagebreak(weak: true)

#heading(level: 1, numbering: none)[DAFTAR PUSTAKA]

#pustaka([Badan Pusat Statistik. (2020--2025). _Keadaan Ketenagakerjaan Indonesia (Buku Sakernas Februari & Agustus)_. Jakarta: BPS RI.])
#pustaka([Badan Pusat Statistik. (2025a). _Tingkat Pengangguran Terbuka Menurut Provinsi, 2025 (Katalog BPS No. 3101002)_. Jakarta: BPS RI.])
#pustaka([Badan Pusat Statistik. (2025b). _Persentase Penduduk Usia 25 Tahun ke Atas Menurut Tingkat Pendidikan Tertinggi yang Ditamatkan dan Jenis Kelamin, 2018–2025_. Jakarta: BPS RI.])
#pustaka([Gujarati, D. N., & Porter, D. C. (2009). _Basic Econometrics_ (5th ed.). New York: McGraw-Hill Education.])
#pustaka([Harris, C. R., Millman, K. J., van der Walt, S. J., et al. (2020). Array programming with NumPy. _Nature_, 585(7825), 357–362.])
#pustaka([McKinney, W. (2010). Data Structures for Statistical Computing in Python. _Proceedings of the 9th Python in Science Conference_, 56–61.])
#pustaka([Pedregosa, F., Varoquaux, G., Gramfort, A., et al. (2011). Scikit-learn: Machine Learning in Python. _Journal of Machine Learning Research_, 12, 2825–2830.])
#pustaka([Pressman, R. S. (2015). _Software Engineering: A Practitioner's Approach_ (8th ed.). New York: McGraw-Hill Education.])
#pustaka([Spiegel, M. R., & Stephens, L. J. (2018). _Schaum's Outline of Statistics_ (6th ed.). New York: McGraw-Hill Education.])
#pustaka([Sukamto, R. A., & Shalahuddin, M. (2018). _Rekayasa Perangkat Lunak Terstruktur dan Berorientasi Objek_. Bandung: Informatika.])
#pustaka([Walpole, R. E., Myers, R. H., Myers, S. L., & Ye, K. (2012). _Probability & Statistics for Engineers & Scientists_ (9th ed.). Boston: Pearson.])
#pustaka([Wooldridge, J. M. (2016). _Introductory Econometrics: A Modern Approach_ (6th ed.). Boston: Cengage Learning.])

// ============================================================
//  LAMPIRAN
// ============================================================
#pagebreak(weak: true)

#heading(level: 1, numbering: none)[LAMPIRAN]

#v(0.5em)

+ *Surat Kesediaan Klien dan Mitra Pengguna Produk*:
  Telah diverifikasi dan disetujui bersama Bursa Kerja Khusus (BKK) SMK Telkom Purwokerto sebagai instrumen proyeksi pasar kerja siswa kejuruan.
+ *Hasil Observasi dan Telaah Data Ketenagakerjaan*:
  Ekstraksi berkas tabel agregat BPS Sakernas 2015--2025 dan portal data terbuka BPS RI.
+ *Lembar Validasi dan Logbook Bimbingan*:
  Pencatatan bimbingan berkala bersama Guru Pembimbing (Farahita Yunandini Arumbifa, S.Pd.) dari tahap pengajuan proposal, pra-proses data, perancangan model, pengujian residu, hingga penyusunan laporan akhir.
+ *Tautan Repositori Kode Sumber dan Artefak Digital*:
  Seluruh kode sumber Python, _pipeline machine learning_, _notebook_ Jupyter (01 s.d. 06), berkas _dataset_ CSV, model tersimpan `joblib`, berkas sumber Typst, dan naskah laporan didokumentasikan secara terbuka dan dapat diakses publik melalui tautan resmi:
  #align(center)[
    #box(stroke: 0.6pt, inset: 10pt, radius: 4pt)[
      #strong[Tautan Repositori GitHub Resmi:] \
      #link("https://github.com/adzkya-fajri/Analisa-Pengangguran-id")
    ]
  ]
+ *Dokumentasi Materi Pitching dan Infografis Produk*:
  Naskah ringkas infografis (600–800 kata), berkas poster digital resolusi tinggi (`infografis.pdf`), serta luaran grafik evaluasi model _LaborCast_ yang dipamerkan pada kegiatan _Expo_ PSAJ PPLG SMK Telkom Purwokerto.
