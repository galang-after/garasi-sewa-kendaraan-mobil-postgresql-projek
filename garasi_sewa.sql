-- SISTEM MANAJEMEN RENTAL KENDARAAN

-- PEMBUATAN TABLE

CREATE TABLE pelanggan (
	id_pelanggan INTEGER PRIMARY KEY,
	nama_pelanggan VARCHAR(100) NOT NULL,
	nomor_telepon VARCHAR(15) NOT NULL
);

CREATE TABLE kendaraan (
	id_kendaraan INTEGER PRIMARY KEY,
	nama_kendaraan VARCHAR(100) NOT NULL,
	nomor_plat VARCHAR(15) NOT NULL,
	harga_sewa_per_hari NUMERIC NOT NULL
);

CREATE TABLE transaksi_sewa (
	id_sewa INTEGER PRIMARY KEY,
	id_pelanggan INTEGER REFERENCES pelanggan(id_pelanggan),
	id_kendaraan INTEGER REFERENCES kendaraan(id_kendaraan),
	tanggal_sewa DATE NOT NULL,
	lama_sewa_hari INTEGER NOT NULL,
	total_biaya NUMERIC NOT NULL
);

-- MEMASUKAN DATA

INSERT INTO pelanggan 
VALUES
	(1, 'Putu Made Wiguna', '081234567890'),
	(2, 'Grace Natalie Simanjuntak', '085712345678'),
	(3, 'Andi Muhammad Faisal', '081987654321'),
	(4, 'Meutya Fitri Chaniago', '082134567890'),
	(5, 'Christian Alexander Tan', '087812345678'),
	(6, 'Elisabeth Maria Ohoitimur', '081399887766'),
	(7, 'Asep Saipulloh', '085211223344');

INSERT INTO kendaraan 
VALUES
	(101, 'Toyota Avanza Veloz', 'B 1234 ABC', 350000),
	(102, 'Honda Brio RS', 'B 5678 DEF', 300000),
	(103, 'Toyota Innova Zenix', 'B 9101 GHI', 700000),
	(104, 'Toyota Fortuner VRZ', 'B 1121 JKL', 1000000),
	(105, 'Toyota Alphard G', 'B 3142 MNO', 2500000),
	(106, 'Toyota HiAce Commuter', 'B 5161 PQR', 1200000);

INSERT INTO transaksi_sewa 
VALUES
	(1, 1, 101, '2026-10-01', 2, 700000),
	(2, 2, 102, '2026-10-01', 3, 900000),
	(3, 3, 103, '2026-10-02', 1, 700000),
	(4, 4, 105, '2026-10-03', 2, 5000000),
	(5, 5, 104, '2026-10-05', 3, 3000000),
	(6, 6, 106, '2026-10-06', 2, 2400000),
	(7, 7, 101, '2026-10-07', 4, 1400000),
	(8, 2, 102, '2026-10-08', 1, 300000),
	(9, 4, 103, '2026-10-09', 2, 1400000),
	(10, 1, 104, '2026-10-10', 3, 3000000);

-- ANALISIS DATA PELANGGAN

-- LAPORAN OMSET DAN SEWA KENDARAAN

SELECT
	kendaraan.nama_kendaraan,
	COUNT(transaksi_sewa.id_sewa) AS total_kali_sewa,
	SUM(transaksi_sewa.total_biaya) AS total_omzet
FROM transaksi_sewa
JOIN kendaraan ON transaksi_sewa.id_kendaraan = kendaraan.id_kendaraan
GROUP BY kendaraan.nama_kendaraan;

-- TOTAL DARI PENGELUARAN DAN SEWA PELANGGAN

SELECT
	pelanggan.nama_pelanggan,
	COUNT(transaksi_sewa.id_sewa) AS frekuensi_sewa,
	SUM(transaksi_sewa.total_biaya) AS total_pengeluaran
FROM transaksi_sewa
JOIN pelanggan ON transaksi_sewa.id_pelanggan = pelanggan.id_pelanggan
GROUP BY pelanggan.nama_pelanggan;

-- PEMBUATAN VIEW

CREATE VIEW v_laporan_transaksi_lengkap AS
SELECT
	transaksi_sewa.id_sewa,
	transaksi_sewa.tanggal_sewa,
	pelanggan.nama_pelanggan,
	pelanggan.nomor_telepon,
	kendaraan.nama_kendaraan,
	kendaraan.nomor_plat,
	transaksi_sewa.lama_sewa_hari,
	transaksi_sewa.total_biaya
FROM transaksi_sewa
JOIN pelanggan ON transaksi_sewa.id_pelanggan = pelanggan.id_pelanggan
JOIN kendaraan ON transaksi_sewa.id_kendaraan = kendaraan.id_kendaraan;

-- MENAMPILKAN HASIL LAPORAN LENGKAP

SELECT * FROM v_laporan_transaksi_lengkap;