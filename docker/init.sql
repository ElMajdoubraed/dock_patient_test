
CREATE TABLE `dossier_medical` (
  `id` int(11) NOT NULL,
  `id_patient` int(11) NOT NULL,
  `date_creation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `fichesmedicales` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medecin_id` int(11) NOT NULL,
  `rendezvous_id` int(11) NOT NULL,
  `medicaments` text DEFAULT NULL,
  `recettes` text DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `id_dossier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `medecins` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `specialite` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adresse_cabinet` varchar(255) DEFAULT NULL,
  `num_telephone` varchar(15) DEFAULT NULL,
  `num_fixe_cabinet` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `cin` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `numero_de_telephone` varchar(15) NOT NULL,
  `adresse_email` varchar(255) NOT NULL,
  `autres_informations_medicales` text DEFAULT NULL,
  `cin` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `rendezvous` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medecin_id` int(11) NOT NULL,
  `nom_patient` varchar(255) DEFAULT NULL,
  `num_telephone_patient` varchar(15) DEFAULT NULL,
  `date_heure` datetime NOT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `statut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `dossier_medical`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_patient` (`id_patient`) USING BTREE;

ALTER TABLE `fichesmedicales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `medecin_id` (`medecin_id`),
  ADD KEY `rendezvous_id` (`rendezvous_id`),
  ADD KEY `id_dossier` (`id_dossier`);

ALTER TABLE `medecins`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rendezvous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `medecin_id` (`medecin_id`);

ALTER TABLE `dossier_medical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `fichesmedicales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `medecins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1296881;

ALTER TABLE `rendezvous`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1296887;

ALTER TABLE `dossier_medical`
  ADD CONSTRAINT `dossier_medical_ibfk_1` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`);

ALTER TABLE `fichesmedicales`
  ADD CONSTRAINT `fichesmedicales_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `fichesmedicales_ibfk_2` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`),
  ADD CONSTRAINT `fichesmedicales_ibfk_3` FOREIGN KEY (`rendezvous_id`) REFERENCES `rendezvous` (`id`),
  ADD CONSTRAINT `fichesmedicales_ibfk_4` FOREIGN KEY (`id_dossier`) REFERENCES `dossier_medical` (`id`);

ALTER TABLE `rendezvous`
  ADD CONSTRAINT `rendezvous_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `rendezvous_ibfk_2` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`);
COMMIT;
