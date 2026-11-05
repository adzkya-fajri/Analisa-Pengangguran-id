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
  #v(0.8cm)
  #text(weight: "bold", size: 14pt, tracking: 0.5pt)[LAPORAN PROYEK] \
  #v(0.3em)
  #text(weight: "bold", size: 13pt)[PENILAIAN SUMATIF AKHIR JENJANG (PSAJ)] \
  #v(0.3em)
  #text(weight: "bold", size: 13pt)[TAHUN AJARAN 2026/2027]

  #v(1.5em)

  #text(weight: "bold", size: 14pt)[
    SISTEM PERAMALAN TINGKAT PENGANGGURAN TERBUKA INDONESIA
    TARGET TAHUN 2026 BERBASIS REGRESI LINIER SEDERHANA
    DAN ANALISIS SPASIO-TEMPORAL PENDIDIKAN
  ]

  #v(1.5em)
  #image("assets/telkom-logo.png", width: 3.5cm)
  #v(1.5em)

  Disusun oleh:

  #v(0.5em)
  #align(left)[
    #pad(left: 3cm)[
      #set text(size: 12pt)
      + Adzkya Gharizi Fajri Anwar (NIS 541241008)
      + Aufa Rakha Aesar Aulayain (NIS 541241028)
      + Andrean Rayhan Wijaya (NIS 54124018)
    ]
  ]

  #v(1cm)

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
    #set text(font: ("TeX Gyre Termes", "Liberation Serif"), size: 11pt)
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

Laporan ini disusun sebagai pertanggungjawaban komprehensif atas penyelesaian proyek akhir integratif pada Program Keahlian Pengembangan Perangkat Lunak dan Gim (PPLG) SMK Telkom Purwokerto. Fokus utama dari riset dan implementasi sistem ini adalah memadukan kompetensi Matematika Terapan---khususnya statistika deskriptif, analisis korelasi Pearson, dan estimasi Ordinary Least Squares (OLS)---dengan rekayasa perangkat lunak modern menggunakan bahasa pemrograman Python serta pustaka analitik bereputasi tinggi. Melalui sistem *LaborCast* dan kajian *EduLabor*, proyek ini berhasil membangun model peramalan makroekonomi yang transparan, teruji secara statistik ekonometrika, dan memiliki relevansi tinggi terhadap isu pasar kerja nasional.

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

Tingkat Pengangguran Terbuka (TPT) merupakan salah satu indikator makroekonomi paling krusial yang digunakan oleh pemerintah, pelaku industri, dan institusi pendidikan untuk mengukur derajat penyerapan tenaga kerja serta stabilitas perekonomian nasional. Secara berkala, Badan Pusat Statistik (BPS) menerbitkan angka TPT resmi melalui Survei Angkatan Kerja Nasional (Sakernas) dua kali dalam setahun, yakni pada bulan Februari dan Agustus.

Berdasarkan publikasi empiris BPS periode Agustus pascapandemi COVID-19, tren TPT nasional memperlihatkan lintasan pemulihan yang sangat teratur. Pandemi global pada tahun 2020 menciptakan patahan struktural (*structural break*) tajam yang menekan pasar kerja, sehingga TPT nasional melonjak hingga mencapai puncak $7,07%$. Namun demikian, seiring pemulihan aktivitas ekonomi, TPT nasional secara konsisten berkurang dari tahun ke tahun: $6,49%$ pada 2021, $5,86%$ pada 2022, $5,32%$ pada 2023, $4,91%$ pada 2024, dan berhasil menyentuh angka $4,85%$ pada Agustus 2025.

Pola penurunan yang konsisten dan monoton pascapandemi tersebut mengindikasikan adanya hubungan linear negatif yang kuat antara pergeseran waktu (tahun) dengan penurunan angka pengangguran terbuka. Fenomena keteraturan empiris ini membuka peluang strategis untuk dimodelkan secara matematis menggunakan metode Regresi Linier Sederhana berbasis *Ordinary Least Squares* (OLS). Melalui metode OLS, hubungan linier antara waktu sebagai variabel bebas ($X$) dan TPT sebagai variabel terikat ($Y$) dapat dirumuskan secara analitik dengan meminimalkan jumlah kuadrat galat (*error sum of squares*).

Meskipun demikian, pemodelan deret waktu makro semata belum cukup untuk menggambarkan realitas pasar kerja di tingkat daerah. Analisis komparatif 38 provinsi di Indonesia tahun 2025 menunjukkan adanya disparitas yang tajam, di mana angka TPT terendah berada di Provinsi Bali ($1,49%$) dan tertinggi di Provinsi Papua ($6,96%$) serta Banten ($6,68%$). Di samping itu, pengamatan spasial menunjukkan paradoks ketenagakerjaan di mana daerah dengan proporsi lulusan pendidikan menengah atas (SMA/SMK ke atas) yang tinggi justru cenderung mencatat angka pengangguran terbuka yang lebih tinggi akibat dinamika *educated unemployment* dan ekspektasi upah formal.

Menjawab tantangan tersebut, penelitian ini mengembangkan sistem terintegrasi yang diberi nama *LaborCast* (mesin peramalan deret waktu berbasis OLS dan benchmark multi-model) dan modul *EduLabor* (analisis spasio-temporal keterkaitan pendidikan dan pengangguran provinsi). Integrasi ini menghubungkan teori matematika kejuruan dengan implementasi rekayasa perangkat lunak modern menggunakan ekosistem Python (`NumPy`, `Pandas`, `Scikit-Learn`, dan `SciPy`). Kode sumber dan artefak sistem ini dikelola secara terbuka dan transparan pada repositori GitHub resmi: #link("https://github.com/adzkya-fajri/Analisa-Pengangguran-id").

#subbab("B", "Rumusan Masalah")

Berdasarkan konteks latar belakang yang telah dipaparkan, rumusan masalah dalam penelitian ini dirumuskan sebagai berikut:
+ Bagaimana pola tren historis dan karakteristik statistik deskriptif data TPT nasional Indonesia periode pemulihan pascapandemi (2020--2025) berdasarkan data resmi BPS Sakernas?
+ Bagaimana formulasi analitik dan komputasional model Regresi Linier Sederhana berbasis OLS dalam memproyeksikan TPT nasional untuk horizon target tahun 2026?
+ Seberapa tinggi tingkat akurasi dan keandalan model OLS dibandingkan terhadap empat model *benchmark* lainnya (Polinomial, Holt's Exponential Smoothing, Moving Average, dan NAIRU Asymptotic Decay), serta bagaimana hasil uji asumsi klasik residunya?
+ Bagaimana hubungan korelasi spasial antara persentase penduduk berpendidikan SMA ke atas dengan sebaran TPT di 38 provinsi Indonesia pada tahun 2025?

#subbab("C", "Tujuan Penelitian")

Tujuan yang ingin dicapai melalui pelaksanaan penelitian dan pengembangan sistem ini meliputi:
+ Menganalisis secara kuantitatif dinamika data runtun waktu TPT nasional (2015--2025) dan data spasial 38 provinsi tahun 2025 bersumber dari publikasi BPS.
+ Membangun modul analitik *LaborCast* berbasis Python untuk menghasilkan persamaan regresi OLS resmi: $hat(Y) = 952,28 - 0,4680 dot t$.
+ Mengevaluasi performa model menggunakan metrik standar industri (MAE, RMSE, MAPE, dan $R^2$) serta menguji asumsi klasik Gauss-Markov (normalitas Shapiro-Wilk, autokorelasi Durbin-Watson, dan heteroskedastisitas).
+ Menghasilkan angka proyeksi TPT nasional untuk target tahun 2026 sebesar $4,11%$ (Agustus), $4,02%$ (Februari), dan $4,065%$ (rata-rata tahunan), dilengkapi interval prediksi pada tingkat keyakinan 95%.
+ Menemukan koefisien korelasi Pearson antara tingkat pendidikan menengah ke atas dengan TPT provinsi sebagai masukan rekomendasi strategis bagi bursa kerja vokasi SMK.

#subbab("D", "Manfaat Penelitian")

Pelaksanaan proyek integratif ini memberikan manfaat multiaspek sebagai berikut:
+ *Bagi Siswa (Pengembang)*: Mengasah kemampuan berpikir komputasional (*computational thinking*) dalam mentransformasikan teori matematika murni (persamaan garis lurus, matriks kovariansi, dan uji hipotesis) menjadi arsitektur perangkat lunak yang modular, teruji unit-test, dan siap pakai.
+ *Bagi Sekolah (SMK Telkom Purwokerto)*: Menyediakan bukti portofolio nyata mengenai integrasi kurikulum Matematika Terapan dan kompetensi kejuruan PPLG bereputasi tinggi yang mematuhi standar pengujian perangkat lunak industri.
+ *Bagi Pemangku Kepentingan dan Kebijakan Publik*: Memberikan rujukan proyeksi ketenagakerjaan yang akurat dan berbasis bukti empiris (*evidence-based policy*) guna membantu Bursa Kerja Khusus (BKK) dan pemerintah daerah dalam mengantisipasi pasokan tenaga kerja lulusan baru tahun 2026.

#subbab("E", "Batasan Masalah")

Agar pembahasan penelitian tetap fokus, mendalam, dan terukur, batasan masalah ditetapkan sebagai berikut:
+ *Cakupan Data Temporal*: Data latih utama pemodelan tren OLS menggunakan runtun waktu Sakernas periode Agustus tahun 2020 hingga 2025 ($n = 6$ tahun) untuk menjamin homogenitas struktural pascapandemi COVID-19.
+ *Cakupan Data Spasial*: Analisis korelasi pendidikan menggunakan data cross-section 38 provinsi di Indonesia tahun 2025 berdasarkan dataset resmi BPS.
+ *Target Peramalan*: Proyeksi difokuskan pada peramalan satu tahun ke depan (*one-step-ahead forecast*) menuju tahun target kalender 2026.
+ *Metode Utama*: Menggunakan Regresi Linier Sederhana metode OLS analitik yang divalidasi silang menggunakan teknik *Leave-One-Out Cross-Validation* (LOOCV) serta dibandingkan terhadap empat model deret waktu dasar.
+ *Lingkungan Perangkat Lunak*: Pengembangan pipeline dilakukan menggunakan Python 3.10+ dengan pustaka `NumPy`, `Pandas`, `Scikit-Learn`, `SciPy`, dan `Matplotlib`.

#pagebreak()

// ============================================================
//  BAB II — KAJIAN PUSTAKA
// ============================================================
#mulai-bab("II", 2, "KAJIAN PUSTAKA")

#subbab("A", "Tinjauan Objek Penelitian")

Objek utama penelitian ini adalah dinamika makroekonomi ketenagakerjaan di Indonesia, khususnya indikator Tingkat Pengangguran Terbuka (TPT) dan indikator pendidikan penduduk usia 25 tahun ke atas dengan kualifikasi minimal SMA/SMK sederajat. Badan Pusat Statistik (BPS) mendefinisikan TPT sebagai persentase jumlah pengangguran terhadap total angkatan kerja:

$ "TPT" = P / A times 100% $

di mana $P$ melambangkan total penduduk yang menganggur (mencari kerja, mempersiapkan usaha, putus asa mencari kerja, atau sudah diterima namun belum aktif bekerja) dan $A$ merepresentasikan seluruh angkatan kerja yang aktif (penduduk bekerja ditambah pengangguran).

Survei ketenagakerjaan dilakukan secara berkala dua kali dalam setahun:
+ *Periode Februari*: Mencerminkan pasar kerja awal tahun yang cenderung memiliki angka partisipasi kerja stabil sebelum masuknya lulusan baru lembaga pendidikan formal.
+ *Periode Agustus*: Mencerminkan pasar kerja pertengahan tahun yang secara reguler menyerap limpahan lulusan baru (*fresh graduates*) dari jenjang sekolah menengah (SMA/SMK) maupun perguruan tinggi.

Perbedaan siklus ini menimbulkan kesenjangan musiman (*seasonal gap*) historis yang konsisten, di mana TPT periode Agustus rata-rata berada sekitar $0,09%$ poin lebih tinggi daripada periode Februari pascapandemi.

#subbab("B", "Konsep Statistika Deskriptif Berkelompok")

Statistika deskriptif berfungsi untuk mereduksi, meringkas, dan menyajikan sekumpulan data numerik agar karakteristik distribusinya dapat dipahami dengan jelas. Pada data spasial 38 provinsi, analisis dilakukan dengan menyusun tabel distribusi frekuensi berkelompok melalui kaidah empiris Sturges:

$ k = 1 + 3,322 dot log_(10)(n) $

di mana $k$ menyatakan jumlah kelas interval dan $n$ melambangkan banyaknya sampel pengamatan ($n = 38$). Lebar atau panjang interval kelas ($c$) dihitung berdasarkan rasio jangkauan data (*range* $R = X_"max" - X_"min"$) terhadap jumlah kelas ($c = R / k$).

Parameter pemusatan dan penyebaran data yang dihitung mencakup:
+ *Rata-rata Hitung (Mean)*: Titik keseimbangan massa data, dirumuskan sebagai $overline(X) = (1/n) sum_(i=1)^n X_i$.
+ *Median*: Nilai tengah data setelah diurutkan, membagi populasi menjadi dua bagian yang berbobot sama.
+ *Standar Deviasi ($s$)*: Pengukur dispersi atau variasi data terhadap rata-rata hitungnya, dirumuskan sebagai:
  $ s = sqrt( (sum_(i=1)^n (X_i - overline(X))^2) / (n - 1) ) $

#subbab("C", "Konsep Visualisasi Data")

Visualisasi data memegang peranan krusial dalam menyederhanakan interpretasi tren numerik yang kompleks. Dalam proyek *LaborCast*, perancangan visual menerapkan standar integritas grafik sebagai berikut:
+ *Diagram Garis Runtun Waktu (Time-Series Plot)*: Memetakan pergerakan tahun kalender pada sumbu horizontal ($X$) dan nilai persentase TPT pada sumbu vertikal ($Y$). Garis regresi analitik ditampilkan berdampingan dengan pita bayangan interval prediksi (*prediction interval*) 95% untuk mencerminkan ketidakpastian proyeksi masa depan.
+ *Histogram Distribusi dan Kurva Kerapatan*: Menggambarkan frekuensi empiris persebaran TPT 38 provinsi guna memeriksa tingkat kemencengan (*skewness*) sebaran data antardaerah.
+ *Diagram Pencar (Scatter Plot) dan Matriks Diagnostik*: Menghubungkan variabel prediktor dengan respon, serta menampilkan sebaran residu terhadap nilai terpasang (*fitted values*) dan plot kuantil normal (Q-Q plot) guna verifikasi visual asumsi Gauss-Markov.

#subbab("D", "Konsep Analisis Korelasi dan Regresi Linear")

*1. Analisis Korelasi Pearson ($r$)*

Koefisien korelasi linier *Product Moment* Pearson mengukur derajat asosiasi dan arah hubungan antara dua variabel kuantitatif kontinu ($X$ dan $Y$), dengan domain nilai $-1 <= r <= +1$:

$ r = (n sum X_i Y_i - (sum X_i)(sum Y_i)) / (sqrt(n sum X_i^2 - (sum X_i)^2) dot sqrt(n sum Y_i^2 - (sum Y_i)^2)) $

Korelasi positif ($r > 0$) mengindikasikan bahwa peningkatan variabel $X$ beriringan dengan peningkatan variabel $Y$, sedangkan korelasi negatif ($r < 0$) menunjukkan hubungan yang berbanding terbalik.

*2. Estimasi Parameter Regresi Linier Sederhana (OLS)*

Persamaan garis regresi linier dinyatakan secara definitif sebagai:

$ hat(Y) = a + b X $

di mana parameter kemiringan lereng ($b$) dan konstanta perpotongan sumbu ($a$) dihitung dengan meminimalkan jumlah kuadrat galat:

$ b = (n sum X_i Y_i - (sum X_i)(sum Y_i)) / (n sum X_i^2 - (sum X_i)^2) = "Cov"(X, Y) / "Var"(X) $

$ a = overline(Y) - b overline(X) $

*3. Estimasi Interval Prediksi (Prediction Interval 95%)*

Untuk menghitung ketidakpastian proyeksi nilai individu baru pada horizon masa depan $X_0$, galat baku prediksi (*standard error of prediction* $s_e$) dirumuskan sebagai:

$ s_"pred" = s_e dot sqrt(1 + 1/n + (X_0 - overline(X))^2 / (sum_(i=1)^n (X_i - overline(X))^2)) $

di mana $s_e = sqrt(sum e_i^2 / (n - 2))$. Batas interval prediksi pada tingkat signifikansi $alpha = 0,05$ adalah:

$ "PI"_(95%) = hat(Y)_0 plus.minus t_(alpha/2, n-2) dot s_"pred" $

#subbab("E", "Desain Antarmuka (UI/UX)")

Dalam implementasi diseminasi hasil peramalan, sistem *LaborCast* merancang luaran antarmuka visual berupa poster infografis beresolusi tinggi dan struktur dashboard analitik interaktif. Perancangan UI/UX mengikuti prinsip kesederhanaan visual (*clarity*), keterbacaan tipografi (*readability*), dan hierarki informasi berbasis data:
+ *Header Card*: Menampilkan indikator angka ringkasan utama (Target TPT 2026: $4,11%$, laju penurunan $-0,468%$ poin/tahun, dan akurasi $R^2 = 95,76%$).
+ *Interactive Canvas*: Menyajikan grafik interaktif pergerakan historis TPT 2015--2025 beserta proyeksi berbayang hingga 2026.
+ *Comparative Matrix*: Memaparkan posisi disparitas 38 provinsi dalam bentuk tabel berbobot warna (*heat-table*) dan peta klaster regional.

#subbab("F", "Arsitektur Sistem")

Perangkat lunak *LaborCast* dibangun menggunakan arsitektur modular berorientasi objek yang memisahkan tanggung jawab fungsional secara ketat (*Separation of Concerns*):
+ `laborcast.data`: Menangani ingesti data CSV, validasi integritas skema, pembersihan nilai kosong, dan normalisasi runtun waktu.
+ `laborcast.models`: Berisi kelas abstrak `BaseModel` serta kelas implementasi konkrit (`LinearTrendModel`, `PolynomialTrendModel`, `ExponentialSmoothingModel`, `MovingAverageModel`, dan `NAIRUAsymptoticModel`).
+ `laborcast.evaluator`: Menghitung metrik performa (MAE, RMSE, MAPE, $R^2$) serta uji asumsi klasik residu ekonometrika.
+ `laborcast.inference`: Mengelola pembentukan prediksi skenario tunggal maupun skenario komparatif berlantai alami.
+ `laborcast.persistence`: Menyediakan mekanisme serialisasi model teruji ke format `joblib` dan metadata `json`.
+ `laborcast.pipeline`: Mengorkestrasi seluruh siklus komputasi dari hulu ke hilir (*end-to-end execution*).

#subbab("G", "Rencana Implementasi AI")

Penerapan kecerdasan buatan (*Artificial Intelligence*) dalam proyek ini berfokus pada pemodelan prediktif berbasis statistika inferensial dan pembelajaran mesin kuantitatif:
+ *Masalah yang Diselesaikan*: Menyediakan estimasi objektif angka pengangguran masa depan (2026) pascapemulihan COVID-19 guna menggantikan estimasi intuitif non-kuantitatif.
+ *Jenis Model*: Model regresi OLS linier terlatih yang dipadukan dengan kendala batas lantai alami NAIRU (*Non-Accelerating Inflation Rate of Unemployment*) pada ambang $3,50%$.
+ *Kebutuhan Data*: Angka runtun waktu TPT resmi BPS (2020--2025) yang bersih dari distorsi anomali pra-pandemi.
+ *Ukuran Keberhasilan*: Model harus mencapai koefisien determinasi $R^2 >= 0,90$, MAPE validasi silang $< 10%$ (kategori *highly accurate*), dan lolos uji normalitas residu Shapiro-Wilk ($p > 0,05$).

#pagebreak()

// ============================================================
//  BAB III — METODE PENELITIAN
// ============================================================
#mulai-bab("III", 3, "METODE PENELITIAN")

#subbab("A", "Waktu dan Tempat Penelitian")

Penelitian, eksplorasi data, rekayasa perangkat lunak, serta penyusunan laporan ini dilaksanakan pada semester ganjil dan genap Tahun Ajaran 2026/2027, bertempat di Laboratorium Pengembangan Perangkat Lunak dan Gim (PPLG), SMK Telkom Purwokerto, Jalan D.I. Panjaitan No. 128, Purwokerto Selatan, Kabupaten Banyumas, Jawa Tengah.

#subbab("B", "Sumber dan Jenis Data")

Data yang dihimpun dan digunakan dalam penelitian ini merupakan *data sekunder kuantitatif* yang diunduh secara resmi dari portal data Badan Pusat Statistik Republik Indonesia (BPS RI):
+ *Dataset Runtun Waktu TPT Nasional (2015--2025)*: Memuat angka pengangguran terbuka periode Februari, Agustus, dan rata-rata tahunan nasional. Sub-sampel tahun 2020--2025 ($n = 6$) dijadikan basis pelatihan model OLS.
+ *Dataset Spasial TPT 38 Provinsi (2025)*: Memuat angka pengangguran terbuka menurut 38 provinsi di Indonesia (Dataset $Y$).
+ *Dataset Pendidikan SMA ke Atas 38 Provinsi (2018--2025)*: Memuat persentase penduduk berumur 25 tahun ke atas dengan ijazah tertinggi minimal SMA/SMK sederajat (Dataset $X$).

#subbab("C", "Teknik Pengumpulan Data")

Teknik pengumpulan data dilakukan melalui studi dokumentasi digital dan ekstraksi dataset terbuka BPS (*open government data*). Langkah-langkah pengumpulan mencakup:
+ Pengunduhan tabel publikasi berkala Sakernas BPS dalam format CSV dan Excel melalui portal resmi BPS.
+ Penstrukturan berkas ke dalam direktori repositori `experiments/datasets/`.
+ Verifikasi otomatis struktur tabel menggunakan kelas `DatasetValidator` untuk memastikan ketiadaan nilai hilang (*missing values*), pengecekan urutan kronologis waktu, dan batasan rentang persentase logis antara $0%$ hingga $100%$.

#subbab("D", "Teknik Analisis Data")

Alur analisis data dan rekayasa model dilakukan melalui tahapan komputasi yang ketat dan sistematis:
+ *Pembersihan dan Pra-proses Data*: Menyamakan penamaan entitas provinsi di seluruh tabel tahunan serta menghitung rata-rata selisih musiman (*seasonal gap*) antara semester Februari dan Agustus.
+ *Perhitungan Analitik OLS*: Menghitung matriks variansi-kovariansi untuk memperoleh koefisien lereng ($b$) dan konstanta ($a$) secara eksak.
+ *Pengujian Model Benchmark*: Membandingkan performa OLS terhadap model Polinomial Kuadratik, Pemulusan Eksponensial Holt, Rata-rata Bergerak, dan Peluruhan NAIRU.
+ *Validasi Silang (LOOCV)*: Menguji kekokohan model melalui skema *Leave-One-Out Cross-Validation* untuk mencegah gejala *overfitting* pada sampel berukuran terbatas.
+ *Uji Asumsi Klasik Residu*: Memverifikasi asumsi kelayakan ekonometrika Gauss-Markov menggunakan uji normalitas Shapiro-Wilk, autokorelasi Durbin-Watson, dan heteroskedastisitas Breusch-Pagan.
+ *Inferensi dan Estimasi Proyeksi*: Menghitung nilai titik proyeksi TPT tahun 2026 beserta rentang toleransi interval prediksi pada derajat kepercayaan 95%.

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
    [Pustaka Komputasi & ML], [NumPy 1.26+, Pandas 2.2+, Scikit-Learn 1.4+, SciPy 1.12+],
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
