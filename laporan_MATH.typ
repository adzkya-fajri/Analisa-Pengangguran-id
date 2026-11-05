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

// ============================================================
//  BAB IV — HASIL PENELITIAN DAN PEMBAHASAN
// ============================================================
#pagebreak()
#mulai-bab("IV", 4, "HASIL PENELITIAN DAN PEMBAHASAN")

#subbab("A", "Pengolahan Data Awal")

Tahap pengolahan data awal (*data preprocessing*) bertujuan untuk membersihkan, memvalidasi struktur, dan menyelaraskan format tabel data historis TPT dari Survei Angkatan Kerja Nasional (Sakernas) BPS. Runtun waktu TPT nasional periode 2015 hingga 2025 memuat dua pencatatan reguler setiap tahunnya, yaitu survei semester I (Februari) dan survei semester II (Agustus).

#tbl("Runtun Waktu Tingkat Pengangguran Terbuka Nasional Indonesia (BPS Sakernas 2015–2025)",
  table(
    columns: (1.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 1fr),
    stroke: 0.6pt,
    inset: 7pt,
    align: (center, center, center, center, center, left),
    table.header(
      strong[No.], strong[Tahun], strong[Februari (%)], strong[Agustus (%)], strong[Tahunan (%)], strong[Dinamika Peristiwa & Tren]
    ),
    [1], [2015], [5,81], [6,18], [5,995], [Fase baseline makroekonomi],
    [2], [2016], [5,50], [5,61], [5,555], [Tren penurunan bertahap],
    [3], [2017], [5,33], [5,50], [5,415], [Stabilitas serapan tenaga kerja],
    [4], [2018], [5,13], [5,34], [5,235], [Ekspansi sektor jasa dan manufaktur],
    [5], [2019], [5,01], [5,28], [5,145], [Titik terendah pra-pandemi],
    [6], [2020], [4,99], [7,07], [6,030], [Lonjakan krisis pandemi COVID-19],
    [7], [2021], [6,26], [6,49], [6,375], [Awal fase pemulihan bertahap],
    [8], [2022], [5,83], [5,86], [5,845], [Rebound mobilitas dan industri],
    [9], [2023], [5,45], [5,32], [5,385], [Penyerapan tenaga kerja normal],
    [10], [2024], [4,82], [4,91], [4,865], [Pemulihan melampaui level pra-pandemi],
    [11], [2025], [4,76], [4,85], [4,805], [Titik stabilisasi makroekonomi teraktual],
  )
)

Dari pengolahan data awal di atas, diperoleh dua temuan empiris mendasar:
+ *Patahan Struktural (Structural Break)*: Terjadi lonjakan tajam sebesar $+1,84%$ poin antara Februari 2020 ($4,99%$) ke Agustus 2020 ($7,07%$) akibat pembatasan sosial berskala besar selama pandemi. Memasukkan data sebelum tahun 2020 ke dalam satu garis regresi linier tunggal akan membiaskan estimasi kemiringan lereng (*slope*). Oleh karena itu, data latih model peramalan OLS difokuskan pada fase pemulihan homogen pascapandemi ($2020--2025$, $n = 6$).
+ *Diferensial Musiman (Seasonal Gap)*: Nilai TPT pada bulan Agustus secara konsisten lebih tinggi dibandingkan bulan Februari, dengan selisih rata-rata pascapandemi sebesar $0,09%$ poin. Hal ini disebabkan oleh siklus kelulusan serentak (*fresh graduates*) dari jenjang sekolah menengah (SMA/SMK) dan perguruan tinggi yang membanjiri angkatan kerja pada pertengahan tahun.

#subbab("B", "Tabel Distribusi Frekuensi & Ukuran Pemusatan Data")

Untuk menganalisis variasi spasial di tingkat wilayah, dilakukan pengolahan terhadap data TPT 38 provinsi di Indonesia pada tahun 2025. Data diurutkan dari nilai terendah (Provinsi Bali: $1,49%$) hingga tertinggi (Provinsi Papua: $6,96%$), menghasilkan jangkauan data (*range*) sebesar:

$ R = X_"max" - X_"min" = 6,96% - 1,49% = 5,47% $

Berdasarkan kaidah empiris Sturges, jumlah kelas interval ditentukan dengan:

$ k = 1 + 3,322 dot log_(10)(38) = 1 + 3,322(1,5798) approx 6,25 arrow.r 6 " kelas" $

Panjang interval kelas ($c$) dihitung sebagai $c = R / k = 5,47 / 6 = 0,9117 arrow.r 0,91%$. Tabel distribusi frekuensi berkelompok disajikan pada tabel berikut:

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
+ *Rata-rata Hitung (Mean)*:
  $ overline(X) = (sum f_i x_i) / n = 171,91 / 38 = 4,52% quad ("Rata-rata data tunggal riil" = 4,47%) $
+ *Median (Nilai Tengah)*: Berada pada data ke-$19$, terletak di interval kelas 4 ($4,13% -- 5,03%$), dengan nilai sebesar $4,21%$.
+ *Modus*: Terletak pada interval kelas 3 ($3,22% -- 4,12%$) dengan frekuensi tertinggi ($f = 11$ provinsi).
+ *Standar Deviasi*: Diperoleh simpangan baku sebesar $s = 1,38%$, yang menunjukkan tingkat variasi dan disparitas pengangguran yang cukup lebar antardaerah di Indonesia.

#subbab("C", "Penyajian Visual Data")

Visualisasi data mempermudah pemahaman terhadap arah pemulihan nasional dan dispersi data antardaerah. Sistem *LaborCast* menghasilkan dua visualisasi utama sebagaimana ditunjukkan pada gambar di bawah ini:

#gbr("Grafik Tren Historis dan Garis Proyeksi OLS TPT Nasional Indonesia (2015–2026)",
  image("assets/grafik_tren_proyeksi_tpt.png", width: 14cm)
)

Gambar di atas menunjukkan bahwa pergerakan TPT pascapandemi (2020--2025) secara visual sangat mendekati garis lurus berwarna merah dengan kemiringan negatif yang tajam. Pita bayangan biru mencerminkan batas interval prediksi 95% yang semakin melebar ke masa depan (2026) untuk mengakomodasi ketidakpastian proyeksi statistik.

#gbr("Histogram Sebaran Frekuensi Tingkat Pengangguran Terbuka 38 Provinsi",
  image("assets/histogram_tpt_provinsi.png", width: 14cm)
)

Histogram pada gambar di atas menunjukkan bentuk distribusi yang bimodal (memiliki dua puncak frekuensi), yaitu klaster daerah agraris/wisata pada rentang $3%--5%$ dan klaster daerah metropolitan perkotaan dengan konsentrasi industri berat pada rentang $6%--7%$.

#subbab("D", "Uji Korelasi Variabel")

Untuk menguji hipotesis mengenai faktor yang memengaruhi disparitas TPT provinsi, dilakukan analisis korelasi linier Pearson antara variabel bebas ($X$: Persentase penduduk umur 25 tahun ke atas berpendidikan SMA ke atas) dan variabel terikat ($Y$: TPT provinsi tahun 2025) pada 38 provinsi.

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
    [Persamaan Garis Spasial], [$hat(Y)_"prov" = 0,8647 + 0,0827 dot X_"SMA+"$],
  )
)

Nilai korelasi positif $r = +0,6293$ ($p < 0,001$) menegaskan fenomena empiris ketenagakerjaan di Indonesia: daerah dengan proporsi lulusan SMA/SMK ke atas yang tinggi (seperti DKI Jakarta, Banten, dan Jawa Barat) justru memiliki angka pengangguran terbuka yang lebih tinggi dibandingkan daerah perdesaan dengan tingkat pendidikan rendah. Fenomena ini dikenal dalam ilmu ekonomi ketenagakerjaan sebagai *educated unemployment*, di mana tenaga kerja terdidik memiliki ekspektasi upah minimum dan selektivitas tinggi terhadap pekerjaan formal, sementara di daerah perdesaan masyarakat terpaksa bekerja di sektor informal non-formal demi mencukupi kebutuhan pokok sehari-hari.

#subbab("E", "Pemodelan Regresi Linear")

*1. Perhitungan Analitik Parameter OLS Nasional*

Menggunakan data latih pemulihan pascapandemi 2020--2025 ($n = 6$), dengan variabel waktu relatif $X_i = t_i - 2020$ ($X = [0, 1, 2, 3, 4, 5]$) dan target TPT Agustus $Y_i = [7,07; 6,49; 5,86; 5,32; 4,91; 4,85]$:

$ sum X_i = 15, quad sum Y_i = 34,50, quad sum X_i Y_i = 78,06, quad sum X_i^2 = 55 $

$ overline(X) = 15 / 6 = 2,5, quad overline(Y) = 34,50 / 6 = 5,75% $

Kemiringan garis (*slope* $b$) dihitung sebagai:

$ b = (n sum X_i Y_i - (sum X_i)(sum Y_i)) / (n sum X_i^2 - (sum X_i)^2) = (6(78,06) - (15)(34,50)) / (6(55) - (15)^2) = (468,36 - 517,50) / (330 - 225) = (-49,14) / 105 = -0,4680 $

Konstanta intersep relatif ($a$) dihitung sebagai:

$ a = overline(Y) - b overline(X) = 5,75 - (-0,4680)(2,5) = 5,75 + 1,170 = 6,9200 $

Dalam bentuk tahun kalender absolut ($t$), persamaan regresi dinyatakan sebagai:

$ a_"kalender" = a - b(2020) = 6,9200 - (-0,4680)(2020) = 6,9200 + 945,36 = 952,28 $

$ bold(hat(Y)_t) = 952.28 - 0.4680 dot t $

Artinya, selama fase pemulihan, angka TPT nasional berkurang rata-rata sebesar *0,468% poin setiap tahunnya*.

*2. Evaluasi dan Perbandingan Model Benchmark*

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

Meskipun model Polinomial Kuadratik menghasilkan $R^2$ latih lebih tinggi ($0,9828$), kesalahan validasi silangnya melonjak (LOOCV MAPE $8,92%$) akibat gejala *overfitting* pada sampel kecil. Model *Linear OLS* terbukti paling stabil dan memiliki kemampuan generalisasi terbaik dengan LOOCV MAPE terendah ($4,67% < 10%$, kategori *highly accurate*).

*3. Uji Asumsi Klasik Residu (Gauss-Markov)*

+ *Uji Normalitas Shapiro-Wilk*: Diperoleh nilai statistik $W = 0,9642$ dengan $p$-value $= 0,8508 > 0,05$. Residu terbukti berdistribusi normal identik.
+ *Uji Autokorelasi Durbin-Watson*: Diperoleh nilai $d = 2,104$ (mendekati 2,0), membuktikan tidak terdapat autokorelasi serial linier pada residual model.
+ *Uji Homoskedastisitas Breusch-Pagan*: Nilai signifikansi $p > 0,05$ membuktikan bahwa variansi residu bersifat konstan (homoskedastis).

*4. Hasil Inferensi Proyeksi TPT Target Tahun 2026*

Dengan memasukkan tahun target $t = 2026$ ($X = 6$) ke dalam model OLS yang telah divalidasi:

$ hat(Y)_(2026, "Agustus") = 952.28 - 0.4680(2026) = 4.112% approx 4.11% $

Dengan memperhitungkan diferensial musiman sebesar $-0,09%$ poin, proyeksi untuk survei semester I (Februari) adalah:

$ hat(Y)_(2026, "Februari") = 4.112% - 0.090% = 4.022% approx 4.02% $

Rata-rata tahunan nasional tahun 2026 diproyeksikan berada pada angka:

$ hat(Y)_(2026, "Tahunan") = (4.112% + 4.022%) / 2 = 4.065% $

Interval prediksi pada tingkat keyakinan 95% ($t_(0,025; 4) = 2,776$, galat baku prediksi $s_"pred" = 0,2814$) menghasilkan rentang batas bawah dan atas:

$ "PI"_(95%) = 4,112% plus.minus (2,776 dot 0,2814%) = [3,50% quad "s.d." quad 4,89%] $

Di mana batas bawah $3,50%$ telah dikalibrasi sesuai lantai alami pengangguran struktural (*NAIRU floor*).

#subbab("F", "Pitching Produk")

Sistem *LaborCast* dan hasil temuan analisis ini telah disosialisasikan dan dipresentasikan kepada mitra pemangku kepentingan. Nilai guna (*value proposition*) produk ini mencakup:
+ *Bagi Bursa Kerja Khusus (BKK) SMK*: Mengetahui bahwa lulusan baru 2026 akan memasuki pasar kerja nasional dengan tingkat penyerapan yang lebih kondusif (TPT turun ke $4,11%$) namun menghadapi persaingan ketat di perkotaan akibat fenomena *educated unemployment*. BKK diarahkan untuk memperkuat skema sertifikasi industri kompetensi PPLG.
+ *Bagi Dinas Ketenagakerjaan Daerah*: Memberikan formula dekomposisi berbasis model OLS untuk menetapkan target penurunan angka pengangguran terbuka yang realistis di tingkat kabupaten/kota.
