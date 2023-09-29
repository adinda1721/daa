CREATE TABLE `Fakultas`  (
  `id` int NOT NULL,
  `matakuliah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kelas` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Kampus`  (
  `id` int NOT NULL,
  `mahasiswa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fakultas` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matakuliah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nilai` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lulus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Lulus`  (
  `id` int NOT NULL,
  `mahasiswa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fakultas` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matakuliah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nilai` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Mahasiswa`  (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jenis_kelamin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_lahir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `MataKuliah`  (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Nilai`  (
  `id` int NOT NULL,
  `mahasiswa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mata_kuliah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `Fakultas` ADD CONSTRAINT `fk_Fakultas_Kampus_1` FOREIGN KEY (`id`) REFERENCES `Kampus` (`fakultas`);
ALTER TABLE `Fakultas` ADD CONSTRAINT `fk_Fakultas_Lulus_1` FOREIGN KEY (`id`) REFERENCES `Lulus` (`fakultas`);
ALTER TABLE `Lulus` ADD CONSTRAINT `fk_Lulus_Kampus_1` FOREIGN KEY (`id`) REFERENCES `Kampus` (`lulus`);
ALTER TABLE `Mahasiswa` ADD CONSTRAINT `fk_Mahasiswa_Kampus_1` FOREIGN KEY (`id`) REFERENCES `Kampus` (`mahasiswa`);
ALTER TABLE `Mahasiswa` ADD CONSTRAINT `fk_Mahasiswa_Nilai_1` FOREIGN KEY (`id`) REFERENCES `Nilai` (`mahasiswa`);
ALTER TABLE `Mahasiswa` ADD CONSTRAINT `fk_Mahasiswa_Lulus_1` FOREIGN KEY (`id`) REFERENCES `Lulus` (`mahasiswa`);
ALTER TABLE `MataKuliah` ADD CONSTRAINT `fk_MataKuliah_Kampus_1` FOREIGN KEY (`id`) REFERENCES `Kampus` (`matakuliah`);
ALTER TABLE `MataKuliah` ADD CONSTRAINT `fk_MataKuliah_Nilai_1` FOREIGN KEY (`id`) REFERENCES `Nilai` (`mata_kuliah`);
ALTER TABLE `MataKuliah` ADD CONSTRAINT `fk_MataKuliah_Lulus_1` FOREIGN KEY (`id`) REFERENCES `Lulus` (`matakuliah`);
ALTER TABLE `MataKuliah` ADD CONSTRAINT `fk_MataKuliah_Fakultas_1` FOREIGN KEY (`id`) REFERENCES `Fakultas` (`matakuliah`);
ALTER TABLE `Nilai` ADD CONSTRAINT `fk_Nilai_Kampus_1` FOREIGN KEY (`id`) REFERENCES `Kampus` (`nilai`);
ALTER TABLE `Nilai` ADD CONSTRAINT `fk_Nilai_Lulus_1` FOREIGN KEY (`id`) REFERENCES `Lulus` (`nilai`);

