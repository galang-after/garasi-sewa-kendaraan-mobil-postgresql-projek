# Garasi Sewa - Sistem Manajemen Rental Kendaraan

Proyek perancangan dan analisis basis data relasional (*Relational Database Management System*) berbasis *PostgreSQL* untuk mengelola operasional bisnis penyewaan kendaraan. Proyek ini dibangun dari skema dasar hingga tingkat pelaporan eksekutif, mencakup pemodelan tabel (DDL), manipulasi data transaksi realistis (DML), analisis pendapatan agregat (`GROUP BY`), serta pembentukan laporan terabstraksi menggunakan `VIEW`.

# Panduan Instalasi & Eksekusi

1. Prasyarat Sistem
  - PostgreSQL DBMS
  - Client Tools: **pgAdmin 4** / **psql**

2. Langkah Inisialisasi
  - Buka PostgreSQL Management Tool pilihan Anda.
  - Buat basis data baru:
   ```sql
   CREATE DATABASE garasi_sewa_db;
