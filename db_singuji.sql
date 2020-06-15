-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jun 2020 pada 04.39
-- Versi server: 10.4.10-MariaDB
-- Versi PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_singuji`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `NIP` varchar(16) NOT NULL,
  `id_mapel` varchar(9) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL,
  `nama_guru` varchar(70) NOT NULL,
  `status` enum('administrator','guru') NOT NULL,
  `username_guru` varchar(50) NOT NULL,
  `password_guru` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`NIP`, `id_mapel`, `id_jurusan`, `nama_guru`, `status`, `username_guru`, `password_guru`) VALUES
('1960012819891110', 'MP0001', 'JS0001', 'Drs. Nyamid, Setiaji', 'guru', 'setia', '5f00b8bd9ac8bc9a06e96715f7a5be12'),
('1960070119860110', 'MP0001', 'JS0002', 'Robani, S. Pd', 'administrator', 'Robani', '497a333d611f80dfddb5407f81632a85');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jawaban`
--

CREATE TABLE `tb_jawaban` (
  `id_jawaban` varchar(9) NOT NULL,
  `NIS` varchar(4) NOT NULL,
  `id_ujian` varchar(9) NOT NULL,
  `id_soal` varchar(9) NOT NULL,
  `jawaban` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis_soal`
--

CREATE TABLE `tb_jenis_soal` (
  `id_jenis_soal` varchar(9) NOT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `id_jurusan` varchar(9) NOT NULL,
  `jurusan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`id_jurusan`, `jurusan`) VALUES
('JS0001', 'IPA'),
('JS0002', 'IPS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `id_mapel` varchar(9) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL,
  `mata_pelajaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_mapel`
--

INSERT INTO `tb_mapel` (`id_mapel`, `id_jurusan`, `mata_pelajaran`) VALUES
('MP0001', 'JS0001', 'MATEMATIKA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `id_nilai` varchar(9) NOT NULL,
  `id_ujian` varchar(9) NOT NULL,
  `NIS` varchar(4) NOT NULL,
  `nilai` int(3) NOT NULL,
  `tanggal_nilai` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket_soal`
--

CREATE TABLE `tb_paket_soal` (
  `id_paket` varchar(9) NOT NULL,
  `NIP` varchar(16) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL,
  `id_mapel` varchar(9) NOT NULL,
  `tgl_pembuatan` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `NIS` varchar(4) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki - Laki','Perempuan') NOT NULL,
  `kelas` enum('10','11','12') NOT NULL,
  `semester` enum('Ganjil','Genap') NOT NULL,
  `username_siswa` varchar(50) NOT NULL,
  `password_siswa` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` varchar(9) NOT NULL,
  `id_paket` varchar(9) NOT NULL,
  `id_jenis_soal` varchar(9) NOT NULL,
  `pertanyaan` longtext NOT NULL,
  `opsi_a` varchar(200) NOT NULL,
  `opsi_b` varchar(200) NOT NULL,
  `opsi_c` varchar(200) NOT NULL,
  `opsi_d` varchar(200) NOT NULL,
  `opsi_e` varchar(200) NOT NULL,
  `nama_file` varchar(200) NOT NULL,
  `kunci_jawaban` varchar(20) NOT NULL,
  `pembahasan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tipe_ujian`
--

CREATE TABLE `tb_tipe_ujian` (
  `id_tipe` varchar(9) NOT NULL,
  `tipe_ujian` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ujian`
--

CREATE TABLE `tb_ujian` (
  `id_ujian` varchar(9) NOT NULL,
  `NIP` varchar(16) NOT NULL,
  `id_mapel` varchar(9) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL,
  `id_jenis_soal` varchar(9) NOT NULL,
  `id_tipe` varchar(9) NOT NULL,
  `jumlah_soal` int(3) NOT NULL,
  `waktu_mengerjakan` int(3) NOT NULL,
  `waktu_mulai` varchar(6) NOT NULL,
  `token_soal` varchar(20) NOT NULL,
  `status_ujian` enum('Aktif','Non - Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `index_mapel` (`id_mapel`),
  ADD KEY `index_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `index_nis` (`NIS`),
  ADD KEY `index_ujian` (`id_ujian`),
  ADD KEY `index_soal` (`id_soal`);

--
-- Indeks untuk tabel `tb_jenis_soal`
--
ALTER TABLE `tb_jenis_soal`
  ADD PRIMARY KEY (`id_jenis_soal`);

--
-- Indeks untuk tabel `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`id_mapel`),
  ADD KEY `index_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `index_ujian` (`id_ujian`),
  ADD KEY `index_nis` (`NIS`);

--
-- Indeks untuk tabel `tb_paket_soal`
--
ALTER TABLE `tb_paket_soal`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `index_nip` (`NIP`),
  ADD KEY `index_jurusan` (`id_jurusan`),
  ADD KEY `index_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`NIS`),
  ADD KEY `index_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `index_paket` (`id_paket`),
  ADD KEY `index_jenis` (`id_jenis_soal`);

--
-- Indeks untuk tabel `tb_tipe_ujian`
--
ALTER TABLE `tb_tipe_ujian`
  ADD PRIMARY KEY (`id_tipe`);

--
-- Indeks untuk tabel `tb_ujian`
--
ALTER TABLE `tb_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `index_nip` (`NIP`),
  ADD KEY `index_mapel` (`id_mapel`),
  ADD KEY `index_jurusan` (`id_jurusan`),
  ADD KEY `index_jenis` (`id_jenis_soal`),
  ADD KEY `index_tipe` (`id_tipe`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD CONSTRAINT `tb_guru_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_guru_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id_mapel`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  ADD CONSTRAINT `tb_jawaban_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `tb_siswa` (`NIS`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jawaban_ibfk_2` FOREIGN KEY (`id_ujian`) REFERENCES `tb_ujian` (`id_ujian`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jawaban_ibfk_3` FOREIGN KEY (`id_soal`) REFERENCES `tb_jenis_soal` (`id_jenis_soal`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD CONSTRAINT `tb_mapel_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD CONSTRAINT `tb_nilai_ibfk_1` FOREIGN KEY (`id_ujian`) REFERENCES `tb_ujian` (`id_ujian`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_nilai_ibfk_2` FOREIGN KEY (`NIS`) REFERENCES `tb_siswa` (`NIS`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_paket_soal`
--
ALTER TABLE `tb_paket_soal`
  ADD CONSTRAINT `tb_paket_soal_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id_mapel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_paket_soal_ibfk_3` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_paket_soal_ibfk_4` FOREIGN KEY (`NIP`) REFERENCES `tb_guru` (`NIP`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket_soal` (`id_paket`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_soal_ibfk_2` FOREIGN KEY (`id_jenis_soal`) REFERENCES `tb_jenis_soal` (`id_jenis_soal`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_ujian`
--
ALTER TABLE `tb_ujian`
  ADD CONSTRAINT `tb_ujian_ibfk_1` FOREIGN KEY (`id_tipe`) REFERENCES `tb_tipe_ujian` (`id_tipe`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ujian_ibfk_2` FOREIGN KEY (`NIP`) REFERENCES `tb_guru` (`NIP`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ujian_ibfk_3` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id_mapel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ujian_ibfk_4` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ujian_ibfk_5` FOREIGN KEY (`id_jenis_soal`) REFERENCES `tb_jenis_soal` (`id_jenis_soal`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
