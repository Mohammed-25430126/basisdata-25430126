-- =================================================================
-- Skrip DDL Modul 5 - Klinik Sehat Medika 126
-- Nama : Mohammed Abdulalem Abdulsalam
-- NIM  : 25430126
-- =================================================================

CREATE DATABASE IF NOT EXISTS klinik_126 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE klinik_126;

-- 1. Hapus tabel jika sudah ada (Urutan dari tabel anak ke induk)
DROP TABLE IF EXISTS pembayaran;
DROP TABLE IF EXISTS detail_resep;
DROP TABLE IF EXISTS pemeriksaan;
DROP TABLE IF EXISTS obat;
DROP TABLE IF EXISTS dokter;
DROP TABLE IF EXISTS pasien;

-- 2. Buat Tabel Induk (Master)
CREATE TABLE pasien (
    id_pasien   INT             NOT NULL AUTO_INCREMENT,
    nik_pasien  CHAR(16)        NOT NULL,
    nama_pasien VARCHAR(100)    NOT NULL,
    no_hp_pasien VARCHAR(15)    NULL,
    PRIMARY KEY (id_pasien),
    CONSTRAINT uq_pasien_nik UNIQUE (nik_pasien)
) ENGINE=InnoDB;

CREATE TABLE dokter (
    id_dokter    INT            NOT NULL AUTO_INCREMENT,
    nama_dokter  VARCHAR(100)   NOT NULL,
    spesialisasi VARCHAR(50)    NOT NULL,
    no_str       VARCHAR(30)    NOT NULL,
    PRIMARY KEY (id_dokter),
    CONSTRAINT uq_dokter_str UNIQUE (no_str)
) ENGINE=InnoDB;

CREATE TABLE obat (
    kode_obat   VARCHAR(10)     NOT NULL,
    nama_obat   VARCHAR(100)    NOT NULL,
    harga_jual  DECIMAL(12,2)   NOT NULL,
    stok        INT             NOT NULL DEFAULT 0,
    PRIMARY KEY (kode_obat),
    CONSTRAINT ck_obat_harga CHECK (harga_jual >= 0),
    CONSTRAINT ck_obat_stok  CHECK (stok >= 0)
) ENGINE=InnoDB;

-- 3. Buat Tabel Transaksi & Detail (Anak)
CREATE TABLE pemeriksaan (
    no_rekam_medis  CHAR(12) NOT NULL,
    tgl_pemeriksaan DATETIME NOT NULL,
    id_pasien       INT      NOT NULL,
    id_dokter       INT      NOT NULL,
    PRIMARY KEY (no_rekam_medis),
    CONSTRAINT fk_pemeriksaan_pasien FOREIGN KEY (id_pasien) 
        REFERENCES pasien (id_pasien) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pemeriksaan_dokter FOREIGN KEY (id_dokter) 
        REFERENCES dokter (id_dokter) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE detail_resep (
    no_rekam_medis        CHAR(12)      NOT NULL,
    kode_obat             VARCHAR(10)   NOT NULL,
    jumlah_obat           INT           NOT NULL,
    harga_saat_transaksi  DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (no_rekam_medis, kode_obat),
    CONSTRAINT fk_detail_pemeriksaan FOREIGN KEY (no_rekam_medis) 
        REFERENCES pemeriksaan (no_rekam_medis) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detail_obat FOREIGN KEY (kode_obat) 
        REFERENCES obat (kode_obat) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_detail_jumlah CHECK (jumlah_obat > 0)
) ENGINE=InnoDB;

CREATE TABLE pembayaran (
    no_nota         CHAR(12)      NOT NULL,
    tgl_bayar       DATETIME      NOT NULL,
    no_rekam_medis  CHAR(12)      NOT NULL,
    total_bayar     DECIMAL(12,2) NOT NULL,
    diskon_persen   DECIMAL(5,2)  NOT NULL DEFAULT 9.00,
    PRIMARY KEY (no_nota),
    CONSTRAINT uq_pembayaran_rm UNIQUE (no_rekam_medis),
    CONSTRAINT fk_pembayaran_pemeriksaan FOREIGN KEY (no_rekam_medis) 
        REFERENCES pemeriksaan (no_rekam_medis) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_pembayaran_total CHECK (total_bayar >= 0)
) ENGINE=InnoDB;
