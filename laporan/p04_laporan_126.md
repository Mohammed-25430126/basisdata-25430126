# Laporan Praktikum Basis Data - Modul 04

**Nama Mahasiswa:** Mohammed Abdulalem Abdulsalam  
**NIM:** 25430126  
**Kelas:** C  
**Topik Proyek:** Normalisasi dan Skema Relasional - Klinik Sehat Medika 126  

## 1. Tujuan Praktikum
1. Mengidentifikasi anomali ubah, sisip, dan hapus pada data yang belum dinormalisasi.
2. Menuliskan dependensi fungsional dari aturan bisnis.
3. Menormalisasi relasi hingga bentuk normal ketiga (3NF) dan memeriksa BCNF.
4. Memutuskan penyimpanan nilai turunan dan mendokumentasikan skema relasional akhir.

## 2. Ringkasan Dasar Teori
Normalisasi adalah proses pengujian struktur basis data untuk menghilangkan anomali data melalui tahapan UNF, 1NF, 2NF, hingga 3NF berdasarkan dependensi fungsional.

## 3. Jawaban Titik Analisis
- **Titik Analisis 1:** Harga saat transaksi disimpan di tabel detail untuk mempertahankan nilai historis meskipun harga master berubah.
- **Titik Analisis 2:** Perbedaan keputusan penyimpanan total operasional vs arsip didasarkan pada dinamika data (data dinamis dihitung, arsip/historis disimpan permanen).
- **Titik Analisis 3:** Relasi pemasok dipindah ke tabel terstruktur untuk menghindari redundansi dan anomali ubah data pemasok.

## 4. Bukti Git dan Sinkronisasi
- **Repository URL:** https://github.com/Mohammed-25430126/basisdata-25430126
- **Commit Message:** `p04: normalisasi klinik sehat medika dan laporan praktikum`
