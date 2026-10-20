# Dokumen Normalisasi - Klinik Sehat Medika 126

## 1. Identitas Proyek
- **Nama:** Mohammed Abdulalem Abdulsalam
- **NIM:** 25430126
- **Kelas:** C
- **Proyek:** Klinik Sehat Medika 126

## 2. Titik Awal UNF (Unnormalized Form)
> KUNJUNGAN_UNF (no_rekam_medis, tgl_pemeriksaan, id_dokter, nama_dokter, id_pasien, nama_pasien, no_hp_pasien, { kode_obat, nama_obat, jumlah_obat, harga_satuan }, total_biaya)

## 3. Tahapan Normalisasi
- **1NF (First Normal Form):** Menghilangkan grup berulang (*repeating group*) pada daftar obat resep, sehingga setiap sel bernilai atomik dan membentuk kunci primer komposit `(no_rekam_medis, kode_obat)`.
- **2NF (Second Normal Form):** Menghilangkan ketergantungan parsial. Atribut yang hanya bergantung pada sebagian kunci komposit dipisah ke tabel masternya masing-masing (`Pasien`, `Dokter`, `Obat`).
- **3NF (Third Normal Form):** Menghilangkan ketergantungan transitif. Seluruh atribut non-kunci kini hanya bergantung sepenuhnya pada kunci primer masing-masing tabel tanpa ada rantai ketergantungan antar atribut non-kunci.

## 4. Dependensi Fungsional (FD) Berbasis Aturan Bisnis
- `FD1`: no_rekam_medis -> tgl_pemeriksaan, id_dokter, id_pasien (AB-01)
- `FD2`: id_dokter -> nama_dokter, spesialisasi (AB-03)
- `FD3`: id_pasien -> nama_pasien, no_hp_pasien (AB-02)
- `FD4`: kode_obat -> nama_obat, harga_jual (AB-04)
- `FD5`: (no_rekam_medis, kode_obat) -> jumlah_obat, harga_saat_transaksi (AB-05)

## 5. Skema Relasional Akhir (3NF)
1. **PASIEN** (`id_pasien`, `nik_pasien`, `nama_pasien`, `no_hp_pasien`)
2. **DOKTER** (`id_dokter`, `nama_dokter`, `spesialisasi`, `no_str`)
3. **OBAT** (`kode_obat`, `nama_obat`, `harga_jual`, `stok`)
4. **PEMERIKSAAN** (`no_rekam_medis`, `tgl_pemeriksaan`, `id_pasien*`, `id_dokter*`)
5. **DETAIL_RESEP** (`no_rekam_medis*`, `kode_obat*`, `jumlah_obat`, `harga_saat_transaksi`)
6. **PEMBAYARAN** (`no_nota`, `tgl_bayar`, `no_rekam_medis*`, `total_bayar`, `diskon_9_persen`)
