# Laporan Praktikum Basis Data - Modul 02
**Nama Mahasiswa:** Mohammed Abdulalem Abdulsalam  
**NIM:** 25430126  
**Kelas:** C  
**Topik Proyek:** Analisis Kebutuhan Pengelolaan Data - Klinik Sehat Medika 126  

---

## 1. Tujuan Praktikum
1. Mengidentifikasi aktivitas organisasi, aktor, dan proses bisnis dari narasi studi kasus.
2. Menurunkan elemen data, entitas kandidat, dan aturan bisnis dari dokumen sumber.
3. Menyusun matriks CRUD dan kamus data awal yang mencantumkan penanggung jawab data (*data steward*).
4. Menulis pernyataan kebutuhan data dan informasi yang spesifik dan dapat diuji.

---

## 2. Ringkasan Dasar Teori
Analisis kebutuhan merupakan tahap paling awal dan paling krusial dalam siklus perancangan basis data. Kegagalan atau kesalahan pada tahap ini (seperti salah menentukan elemen data atau mengabaikan harga historis) akan berdampak sangat mahal pada tahap desain berikutnya. Data dipandang sebagai aset organisasi yang harus dikelola mutunya, memiliki aturan bisnis yang jelas, serta penanggung jawab (*data steward*) yang berwenang.

---

## 3. Jawaban Titik Analisis (Titik Analisis 1 - 3)

- **Titik Analisis 1 (Harga Historis):**  
  Harga obat atau layanan harus disimpan langsung pada detail transaksi (bukan hanya mengambil dari tabel master obat) untuk merekam harga historis saat transaksi terjadi. Hal ini memastikan laporan keuangan masa lalu tidak berubah meskipun harga katalog obat naik di masa depan.

- **Titik Analisis 2 (Nilai Turunan / Derived Values):**  
  - *Alasan TIDAK menyimpan:* Menghindari redundansi data dan inkonsistensi, karena subtotal atau total dapat dihitung secara dinamis dari rumus `(qty * harga)`.
  - *Alasan YA menyimpan:* Mengoptimalkan performa kueri (*query performance*) pada pelaporan skala besar agar sistem tidak perlu menghitung ulang jutaan baris data secara terus-menerus.

- **Titik Analisis 3 (Entitas Yatim / Missing Process):**  
  Tidak adanya proses dengan huruf `C` (Create) pada entitas Pemasok menandakan adanya proses bisnis yang terlewat, yaitu proses "Kelola Data Pemasok". Proses ini wajib ditambahkan ke dalam daftar proses bisnis agar data pemasok dapat dimasukkan ke sistem secara sah.

---

## 4. Hasil Latihan dan Modifikasi (Perbaikan Pernyataan Kabur)
Tiga pernyataan kebutuhan yang kabur telah diperbaiki agar spesifik dan dapat diuji:
1. **Keamanan Data:** *"Data rekam medis dan nomor HP pasien bersifat rahasia, hanya dapat diakses oleh Dokter yang bertugas dan Pimpinan Klinik."*
2. **Kecepatan Pencarian:** *"Pencarian data obat atau pasien berdasarkan ID atau nama harus menghasilkan respons dalam waktu kurang dari 2 detik."*
3. **Akurasi Stok:** *"Jumlah stok obat di sistem tidak boleh bernilai negatif dan harus sesuai 100% dengan jumlah fisik di gudang."*

---

## 5. Milestone Proyek 2 (Klinik Sehat Medika 126)
Dokumen spesifikasi kebutuhan data untuk proyek individu telah disusun lengkap pada berkas **`p02_kebutuhan_data_126.md`** dengan ketentuan:
- **Parameter P (NIM 25430126):** $P = (26 \pmod 9) + 1 = 9$.
- **Ketentuan Turunan P:** Batas maksimal obat per resep = 11 item ($P+2$), persentase diskon pasien = 9% ($P$), dan estimasi transaksi harian = 85 transaksi.
- Memuat minimal 4 proses bisnis, entitas kandidat lengkap, aturan bisnis, matriks CRUD, serta kamus data awal dengan kolom *data steward*.

---

## 6. Pernyataan Penggunaan AI
Menggunakan bantuan kecerdasan buatan (Gemini) sebagai asisten diskusi akademik untuk memahami konsep penyusunan matriks CRUD, kamus data, dan verifikasi perhitungan parameter personal.

---

## 7. Bukti Git dan Sinkronisasi
- **Repository URL:** `https://github.com/Mohammed-25430126/basisdata-25430126`
- **Commit Message:** `p02: dokumen kebutuhan data klinik dan laporan praktikum`
