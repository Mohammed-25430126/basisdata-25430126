-- =================================================================
-- Skrip DML Data Sampel Modul 6 - Klinik Sehat Medika 126
-- Nama : Mohammed Abdulalem Abdulsalam
-- NIM  : 25430126
-- =================================================================

USE klinik_126;

-- 1. Mengisi Data Induk (Master Data: Dokter)
INSERT INTO dokter (nama_dokter, spesialisasi, no_str) VALUES
  ('Dr. Ahmad Fauzi, Sp.PD', 'Penyakit Dalam', 'STR-12345-01'),
  ('Dr. Siti Aminah, Sp.A', 'Anak', 'STR-12345-02'),
  ('Dr. Budi Santoso, Umum', 'Umum', 'STR-12345-03'),
  ('Dr. Dewi Lestari, Sp.KFR', 'Rehabilitasi Medis', 'STR-12345-04'),
  ('Dr. Eko Prasetyo, Sp.M', 'Mata', 'STR-12345-05');

-- 2. Mengisi Data Induk (Master Data: Pasien)
INSERT INTO pasien (nik_pasien, nama_pasien, no_hp_pasien) VALUES
  ('3201123456780001', 'Rian Hidayat', '081234567890'),
  ('3201123456780002', 'Dewi Sartika', '081234567891'),
  ('3201123456780003', 'Andi Pratama', '081234567892'),
  ('3201123456780004', 'Siska Melina', '081234567893'),
  ('3201123456780005', 'Joko Widodo', '081234567894');

-- 3. Mengisi Data Induk (Master Data: Obat)
INSERT INTO obat (kode_obat, nama_obat, harga_jual, stok) VALUES
  ('OBT-001', 'Paracetamol 500mg', 5000.00, 150),
  ('OBT-002', 'Amoxicillin 500mg', 12000.00, 80),
  ('OBT-003', 'Antasida Doen', 7500.00, 100),
  ('OBT-004', 'Vitamin C 500mg', 4000.00, 200),
  ('OBT-005', 'Ibuprofen 400mg', 8500.00, 90);

-- 4. Mengisi Data Transaksi (Pemeriksaan / Rekam Medis)
INSERT INTO pemeriksaan (no_rekam_medis, tgl_pemeriksaan, id_pasien, id_dokter) VALUES
  ('RM-2611-001', '2026-11-01 09:00:00', 1, 1),
  ('RM-2611-002', '2026-11-01 10:30:00', 2, 2),
  ('RM-2611-003', '2026-11-01 11:15:00', 3, 3);

-- 5. Mengisi Data Detail Resep (Menggunakan INSERT ... SELECT agar aman sesuai harga obat)
INSERT INTO detail_resep (no_rekam_medis, kode_obat, jumlah_obat, harga_saat_transaksi)
SELECT 'RM-2611-001', kode_obat, 2, harga_jual FROM obat WHERE kode_obat = 'OBT-001';

INSERT INTO detail_resep (no_rekam_medis, kode_obat, jumlah_obat, harga_saat_transaksi)
SELECT 'RM-2611-002', kode_obat, 1, harga_jual FROM obat WHERE kode_obat = 'OBT-002';

INSERT INTO detail_resep (no_rekam_medis, kode_obat, jumlah_obat, harga_saat_transaksi)
SELECT 'RM-2611-003', kode_obat, 3, harga_jual FROM obat WHERE kode_obat = 'OBT-004';

-- 6. Mengisi Data Pembayaran
INSERT INTO pembayaran (no_nota, tgl_bayar, no_rekam_medis, total_bayar, diskon_persen) VALUES
  ('NT-2611-001', '2026-11-01 09:30:00', 'RM-2611-001', 10000.00, 9.00),
  ('NT-2611-002', '2026-11-01 11:00:00', 'RM-2611-002', 12000.00, 9.00),
  ('NT-2611-003', '2026-11-01 11:45:00', 'RM-2611-003', 12000.00, 9.00);