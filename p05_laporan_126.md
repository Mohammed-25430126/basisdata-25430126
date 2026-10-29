# Laporan Praktikum Basis Data - Modul 05

**Nama Mahasiswa:** Mohammed Abdulalem Abdulsalam  
**NIM:** 25430126  
**Kelas:** C  
**Topik Proyek:** Membangun Struktur Basis Data dengan DDL dan Constraint - Klinik Sehat Medika 126  

## 1. Tujuan Praktikum
1. Menerjemahkan skema relasional 3NF menjadi perintah CREATE TABLE dengan tipe data tepat.
2. Menerapkan constraint PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, DEFAULT, dan CHECK sesuai aturan bisnis.
3. Mengubah dan menghapus struktur dengan ALTER TABLE dan DROP TABLE dalam urutan yang benar.
4. Membuktikan constraint menolak data yang melanggar aturan dan membandingkan desain fisik dengan ERD.

## 2. Pemetaan Tipe Data dan Constraint
| Tabel | Kolom | Tipe Data | Constraint | Keterangan Aturan |
|---|---|---|---|---|
| pasien | id_pasien | INT | PRIMARY KEY, AUTO_INCREMENT | Identitas Unik Pasien |
| pasien | nik_pasien | CHAR(16) | UNIQUE, NOT NULL | NIK Unik |
| dokter | no_str | VARCHAR(30) | UNIQUE, NOT NULL | STR Dokter Unik |
| obat | stok | INT | CHECK (stok >= 0) | Mencegah Stok Negatif |
| detail_resep | jumlah_obat | INT | CHECK (jumlah_obat > 0) | Jumlah Obat Harus > 0 |

## 3. Jawaban Titik Analisis
- **Titik Analisis 1:** `ON DELETE CASCADE` dipakai pada `detail_resep` agar rincian resep ikut terhapus jika pemeriksaan dibatalkan, namun tidak dipakai pada tabel master obat untuk menjaga keutuhan riwayat transaksi historis.
- **Titik Analisis 2:** Error 1452 menjaga integritas Foreign Key, Error 4025 menjaga constraint CHECK (stok/harga), dan Error 1062 menjaga keunikan UNIQUE. Aturan yang melibatkan agregasi lintas baris ditunda pelaksanaannya ke Modul 14 (Trigger).
- **Titik Analisis 3:** Urutan `DROP TABLE` harus dimulai dari tabel anak (`pembayaran`, `detail_resep`) menuju tabel induk (`pasien`, `dokter`, `obat`) untuk mencegah Error 1451.

## 4. Bukti Git dan Sinkronisasi
- **Repository URL:** https://github.com/Mohammed-25430126/basisdata-25430126
- **Commit Message:** `p05: ddl klinik sehat medika dan laporan praktikum`
