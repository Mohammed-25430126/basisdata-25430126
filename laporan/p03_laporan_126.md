# Laporan Praktikum Basis Data - Modul 03
**Nama Mahasiswa:** Mohammed Abdulalem Abdulsalam  
**NIM:** 25430126  
**Kelas:** C  
**Topik Proyek:** Pemodelan Data dengan Entity Relationship Diagram (ERD) - Klinik Sehat Medika 126  

---

## 1. Tujuan Praktikum
1. Mengidentifikasi entitas, atribut, dan kunci (PK/FK) dari dokumen kebutuhan data.
2. Menentukan relasi beserta kardinalitas dan partisipasinya berdasarkan aturan bisnis (AB).
3. Memecah relasi banyak-ke-banyak menjadi entitas asosiatif (*associative entity*).
4. Menggambar ERD notasi Crow's Foot dan memvalidasinya terhadap kebutuhan informasi (KI).

---

## 2. Ringkasan Dasar Teori
ERD merupakan hasil dari tahap desain konseptual basis data. Pada tahap ini, entitas, atribut, dan hubungan antar entitas digambarkan secara visual tanpa terikat pada DBMS tertentu. Penggunaan kardinalitas dan partisipasi (*Crow's Foot Notation*) memastikan bahwa seluruh batasan dari aturan bisnis terpenuhi dengan akurat.

---

## 3. Jawaban Titik Analisis (Titik Analisis 1 - 3)
- **Titik Analisis 1:** Penggunaan `id_pasien` sebagai Primary Key lebih disukai dibandingkan NIM karena stabilitas dan independensinya terhadap perubahan format data di masa depan, mencegah kerusakan Foreign Key.
- **Titik Analisis 2:** Batasan "minimal satu" pada relasi detail dipaksakan oleh aturan bisnis (seperti AB-01), yang memerlukan validasi tambahan di level aplikasi/transaksi.
- **Titik Analisis 3:** Penambahan atribut atau relasi petugas pada transaksi pembelian/penerimaan diperlukan untuk melacak tanggung jawab operasional secara transparan.

---

## 4. Milestone Proyek 3 (Klinik Sehat Medika 126)
- **Desain ERD:** Telah dirancang menggunakan notasi Crow's Foot yang mencakup entitas Pasien, Dokter, Pemeriksaan, Obat, Pembayaran, dan Detail Resep (sebagai entitas asosiatif).
- **Parameter P (NIM 25430126):** Nilai $P = 9$, diterapkan pada batas maksimal item resep ($P+2 = 11$) dan persentase diskon pasien (9%).
- **Validasi KI:** Seluruh kebutuhan informasi (KI-01 sampai KI-04) berhasil ditelusuri melalui jalur relasi ERD yang dibangun.

---

## 5. Tinjauan Klien (Simulasi Uظän)
- **Umpan Balik 1 (Teman Sejawat):** "Pastikan relasi antara dokter dan resep obat tercatat dengan jelas."  
  *Keputusan:* Diterima, dengan menambahkan relasi langsung melalui tabel pemeriksaan medis.
- **Umpan Balik 2:** "Tambahkan pencatatan metode pembayaran."  
  *Keputusan:* Diterima, ditambahkan atribut `metode_bayar` pada entitas Pembayaran.

---

## 6. Bukti Git dan Sinkronisasi
- **Repository URL:** `https://github.com/Mohammed-25430126/basisdata-25430126`
- **Commit Message:** `p03: erd klinik sehat medika dan laporan praktikum`
