# LAPORAN PRAKTIKUM
**Modul 01: Inisialisasi Lingkungan & Manajemen Hak Akses**  
**Mata Kuliah:** Basis Data (Database Systems)  
**Proyek:** Klinik Sehat Medika 126  

| Informasi | Detail |
| :--- | :--- |
| **Nama Mahasiswa** | Mohammed Abdulalem Abdulsalam |
| **NIM** | 25430126 |
| **Kelas** | C |
| **Repositori GitHub** | [https://github.com/Mohammed-25430126/basisdata-25430126](https://github.com/Mohammed-25430126/basisdata-25430126) |

---

## Bab 1. Tujuan & Pendahuluan

### 1.1 Tujuan Praktikum
1. Melakukan inisialisasi lingkungan kerja database (XAMPP / MariaDB) yang terisolasi untuk kegiatan praktikum.
2. Menerapkan manajemen hak akses pengguna (*user privilege management*) berdasarkan Prinsip Hak Akses Minimum (*Principle of Least Privilege*).
3. Membuat database proyek `kopma_126` dan `klinik_126` beserta pengguna terbatas `mhs_126` dan `dev_126`.
4. Menyiapkan repositori Git sebagai sistem kontrol versi untuk seluruh skrip dan artefak praktikum.

### 1.2 Latar Belakang
Dalam pengelolaan sistem basis data, isolasi lingkungan kerja merupakan fondasi penting agar kegiatan pengembangan tidak mengganggu data produksi. Pada praktikum ini, lingkungan kerja diisolasi dengan membuat database khusus (`kopma_126` dan `klinik_126`) serta akun pengguna terbatas (`mhs_126` dan `dev_126`), sehingga setiap aktivitas eksperimen terdokumentasi dan dapat dipulihkan kembali.

Manajemen hak akses diterapkan melalui perintah `GRANT` dan `FLUSH PRIVILEGES` agar setiap pengguna hanya memperoleh izin seperlunya (*Principle of Least Privilege*). Hal ini mengurangi risiko kesalahan manusia maupun penyalahgunaan akses terhadap objek-objek database sistem.

Selain aspek database, kontrol versi menggunakan Git menjadi bagian integral dari praktikum. Repositori GitHub (`basisdata-25430126`) digunakan untuk menyimpan skrip SQL, berkas `.gitignore`, dan `README.md`, sehingga seluruh progres praktikum dapat dilacak, dikolaborasikan, dan diverifikasi oleh asisten/dosen.

---

## Bab 2. Implementasi & Langkah Kerja

### 2.1 Pembuatan Database & Pengguna
Tahap pertama adalah memverifikasi lingkungan MariaDB pada XAMPP. Perintah berikut dijalankan untuk memeriksa versi server dan pengguna yang sedang aktif:

**SQL — Verifikasi Versi & Pengguna**
```sql
SELECT VERSION(), CURRENT_USER();
