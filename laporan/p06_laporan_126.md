# Laporan Praktikum Basis Data - Modul 06

**Nama Mahasiswa:** Mohammed Abdulalem Abdulsalam  
**NIM:** 25430126  
**Kelas:** C  
**Topik Proyek:** Mengisi, Mengubah, dan Menguji Data dengan DML - Klinik Sehat Medika 126  

## 1. Tujuan Praktikum
1. Menambah data dengan INSERT satu baris, banyak baris, dan INSERT ... SELECT.
2. Mengubah dan menghapus data dengan UPDATE dan DELETE secara aman memakai mode `sql_safe_updates`.
3. Menyusun skenario uji positif dan negatif serta mencatat hasilnya.
4. Menyiapkan data sampel proyek yang dapat dibangun ulang dari skrip.

## 2. Implementasi Data DML
- Berkas data sampel: `p06_data_126.sql` berhasil dibuat dan diuji pada basis data `klinik_126`.
- Data master (dokter, pasien, obat) dan data transaksi (pemeriksaan, detail_resep, pembayaran) telah diisi sesuai dengan parameter proyek.

## 3. Jawaban Titik Analisis (Titik Analisis 1, 2, 3)
- **Titik Analisis 1:** Perintah `INSERT ... SELECT` mengambil harga langsung dari tabel master `obat`. Cara ini jauh lebih aman dan akurat dibandingkan mengetik harga secara manual untuk menghindari kesalahan ketik. Jika harga obat berubah di masa depan, nota historis tetap aman karena menyimpan harga saat transaksi terjadi (`harga_saat_transaksi`).
- **Titik Analisis 2:** Menghapus data transaksi (seperti pemeriksaan) akan menghapus detail resepnya secara otomatis karena aturan `ON DELETE CASCADE`. Sebaliknya, menghapus data induk (seperti dokter atau pasien yang memiliki riwayat) ditolak oleh server (`ERROR 1451`) untuk menjaga integritas historis. Solusinya jika staf berhenti adalah dengan mengubah status akunnya menjadi nonaktif, bukan menghapus baris datanya.
- **Titik Analisis 3:** Pengujian UJ-10 yang melibatkan validasi stok melebihi batas tidak dapat dicegah oleh constraint `CHECK` sederhana karena `CHECK` hanya mengevaluasi satu baris secara mandiri, sedangkan validasi stok melibatkan perbandingan lintas data. Hal ini dicatat sebagai **utang desain** yang akan diselesaikan menggunakan *Trigger* pada Modul 14.

## 4. Bukti Git dan Sinkronisasi
- **Repository URL:** https://github.com/Mohammed-25430126/basisdata-25430126
- **Commit Message:** `p06: data dml dan skenario uji klinik sehat medika`
