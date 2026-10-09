# Dokumen Kebutuhan Data - Klinik Sehat Medika 126

## 1. Informasi Mahasiswa dan Proyek
- **Nama:** Mohammed Abdulalem Abdulsalam
- **NIM:** 25430126
- **Kelas:** C
- **Nama Klinik:** Klinik Sehat Medika 126

## 2. Parameter Personal P
- NIM: 25430126 (2 digit terakhir = 26)
- Rumus: P = (26 mod 9) + 1 = 8 + 1 = 9
- **Nilai P = 9**
  - Batas maksimal obat per resep (P + 2) = 11 item
  - Diskon pasien (P) = 9%
  - Estimasi transaksi harian (40 + 5xP) = 85 transaksi

## 3. Proses Bisnis Klinik
1. **PB-01:** Mendaftarkan Pasien Baru
2. **PB-02:** Mencatat Kunjungan & Pemeriksaan Medis
3. **PB-03:** Mengelola Resep & Penyerahan Obat
4. **PB-04:** Memproses Pembayaran Pasien

## 4. Daftar Entitas (Data yang Disimpan)
1. **Pasien:** id_pasien, nik_pasien, nama_pasien, no_hp_pasien
2. **Dokter:** id_dokter, nama_dokter, spesialisasi, no_str
3. **Pemeriksaan:** no_rekam_medis, tanggal_periksa, diagnosa
4. **Obat:** kode_obat, nama_obat, harga_jual, stok_obat
5. **Pembayaran:** no_nota, tanggal_bayar, total_bayar, diskon_9_persen

## 5. Aturan Bisnis
- AB-01: Pasien terdaftar berhak mendapat diskon 9% (Parameter P = 9).
- AB-02: Batas maksimal obat dalam satu resep adalah 11 item.
- AB-03: Stok obat tidak boleh bernilai negatif.
- AB-04: Harga obat pada nota adalah harga saat transaksi dan tidak berubah jika harga katalog naik.

## 6. Kebutuhan Non-Fungsional & Privasi
- Data rekam medis dan nomor HP pasien bersifat rahasia dan hanya boleh diakses oleh Dokter dan Pimpinan Klinik.
- Data transaksi disimpan minimal 5 tahun.