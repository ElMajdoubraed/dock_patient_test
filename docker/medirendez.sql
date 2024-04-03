-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 02 avr. 2024 à 14:07
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `medirendez`
--

-- --------------------------------------------------------

--
-- Structure de la table `dossier_medical`
--

CREATE TABLE `dossier_medical` (
  `id` int(11) NOT NULL,
  `id_patient` int(11) NOT NULL,
  `date_creation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dossier_medical`
--

INSERT INTO `dossier_medical` (`id`, `id_patient`, `date_creation`) VALUES
(5, 0, '2024-03-08'),
(6, 1296866, '2024-03-08'),
(7, 1296863, '2024-03-08');

-- --------------------------------------------------------

--
-- Structure de la table `fichesmedicales`
--

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

--
-- Déchargement des données de la table `fichesmedicales`
--

INSERT INTO `fichesmedicales` (`id`, `patient_id`, `medecin_id`, `rendezvous_id`, `medicaments`, `recettes`, `description`, `id_dossier`) VALUES
(5, 1296857, 2, 2, 'string', 'string', 'string', NULL),
(7, 1296863, 6, 2, 'string', 'string', 'string', NULL),
(8, 1296863, 5, 2, 'string', 'string', 'string', NULL),
(9, 1296863, 4, 2, 'string', 'string', 'string', NULL),
(10, 1296859, 4, 2, 'string', 'string', 'string', NULL),
(11, 589760, 4, 2, 'string', 'string', 'string', NULL),
(13, 589760, 4, 2, 'string', 'string', 'string', 7),
(16, 589760, 4, 2, 'string', 'string', 'string', 7);

-- --------------------------------------------------------

--
-- Structure de la table `medecins`
--

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

--
-- Déchargement des données de la table `medecins`
--

INSERT INTO `medecins` (`id`, `nom`, `specialite`, `email`, `adresse_cabinet`, `num_telephone`, `num_fixe_cabinet`, `password`, `cin`) VALUES
(2, 'Chetoui arij', 'Généraliste', 'chet@exemple.com', 'NouvelleAdresse', 'NouveauNumero', 'NouveauFixe', '', 'NouveauC'),
(3, 'Dr. Dupont', 'Cardiologue', 'dupont@example.com', '456 avenue de la Santé', '0123456789', '9876543210', 'nouveaumotdepasse', '12345678'),
(4, 'karima chebba', 'dentiste ', 'kchabbadr@gmail.com', 'chabba mahdia', '000000000', '00000000', '00000000', '03121459'),
(5, 'misawi  adel', 'Généraliste', 'misawi@exemple.com', '7dha carfour', '78987658', '78987658', '00000000', '02581478'),
(6, 'Adel jhimi', 'generaliste', 'adel@exemple.com', 'rue abou kassem chebbi', '98756412', '72654987', '00000000', '01236547'),
(7, 'swagger', 'swagger', 'swagger', 'swagger', 'swagger', 'swagger', 'swagger', 'swagger'),
(10, 'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string'),
(11, 'doja cat', 'Cardiologue', 'jean.martin@example.com', '123 Rue des Médecins', '+1234567890', '+987654321', '00000000', '03120096');

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

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

--
-- Déchargement des données de la table `patients`
--

INSERT INTO `patients` (`id`, `nom`, `prenom`, `date_de_naissance`, `sexe`, `adresse`, `numero_de_telephone`, `adresse_email`, `autres_informations_medicales`, `cin`) VALUES
(589759, 'arij', 'string', '2024-02-24', 'femme', 'string', 'string', 'string', 'string', '11111111'),
(589760, 'arijee ', 'chetoui', '2024-02-23', 'femme', 'rue-chtawa tozeur', '58954023', 'arijchetoui1@gmail.com', 'pas ', '09724208'),
(1296857, 'test', 'test', '0000-00-00', 'femme', 'test', '58954023', 'test', 'test', '00000000'),
(1296859, 'arij chetoui', 'belhedj', '2000-07-22', 'femme', 'rue chtawa', '58954023', 'arijchetoui7@gmail.com', 'nothing', '09724208'),
(1296860, 'arij ', 'belhedj', '2000-07-22', 'femme', 'rue chtawa tozeur', '58954023', 'arijchetoui7@gmail.com', 'nothing', '09724208'),
(1296861, 'ali', 'arij', '2024-02-23', 'homme', 'string', 'string', 'string', 'string', '09888666'),
(1296862, 'ali', 'arij', '2024-02-23', 'homme', 'chabba', '00000000', 'arijiiiji@gmail.com', 'pas', '09888666'),
(1296863, 'alia', 'ahmed ', '1996-08-17', 'femme', 'mahdia', '98745632', 'alia.1@gmail.com', 'diabétique ', '01356987'),
(1296864, 'swagger', 'swagger', '0000-00-00', 'swagger', 'swagger', 'swagger', 'swagger', 'swagger', 'swagger'),
(1296866, 'Dupont', 'Jean', '1990-05-15', 'male', '123 Rue de la Santé', '0123456789', 'jean.dupont@example.com', 'Aucune', '12345678'),
(1296869, 'string', 'string', '2024-03-08', 'homme', 'string', 'string', 'string', 'string', 'string'),
(1296870, 'bouali', 'lamouchi', '2024-02-23', 'homme', 'string', 'string', 'string', 'string', 'string'),
(1296871, '', '', '0000-00-00', '', '', '', '', '', ''),
(1296872, '', '', '2024-03-08', '', '', '', '', '', ''),
(1296873, '', '', '2024-03-08', '', '', '', '', '', ''),
(1296874, 'karim', 'aaa', '1991-11-11', '', 'aaa', 'aaaa', 'aaaaa', 'aaaaa', '09724208'),
(1296875, 'karim', 'chebbi', '1977-11-11', '', 'chebbia', '59876321', 'karimkarim@gmail.com', 'pas', '09724208'),
(1296876, 'tarek', 'tarek', '2024-03-12', '', 'sfax', '59876321', 'tarek1@gmail.com', 'pas', '02314785'),
(1296877, 'ali', 'iftikhar', '2024-02-22', 'homme', 'string', 'string', 'string', 'string', '09888666'),
(1296878, 'amal  ', 'chetoui ', '2000-12-26', '', 'chtawa', '000000', 'amalchetoui@gmail.com', 'pas', '09875632'),
(1296879, 'amani', 'amani', '2000-07-20', '', 'sahraoui', '55897412', 'amani@yahoo.com', 'diabit', '02345698'),
(1296880, 'faicel', 'belhaj', '0000-00-00', 'homme', 'string', 'string', 'string', 'string', 'string');

-- --------------------------------------------------------

--
-- Structure de la table `rendezvous`
--

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

--
-- Déchargement des données de la table `rendezvous`
--

INSERT INTO `rendezvous` (`id`, `patient_id`, `medecin_id`, `nom_patient`, `num_telephone_patient`, `date_heure`, `motif`, `statut`) VALUES
(2, 589759, 2, NULL, '1234567890', '2024-03-10 14:00:00', NULL, 'Planifié'),
(4, 589759, 2, NULL, '1234567890', '2024-03-10 14:00:00', NULL, 'Planifié'),
(5, 589759, 2, NULL, '1234567890', '2024-03-10 13:00:00', NULL, 'Planifié'),
(8, 1296864, 7, NULL, 'swagger', '2024-03-05 23:40:29', NULL, 'swagger'),
(10, 1296859, 4, NULL, NULL, '2024-03-08 17:04:44', NULL, 'string'),
(11, 1296859, 4, NULL, NULL, '2024-03-08 17:04:44', NULL, 'string'),
(1296860, 589759, 4, 'arij chetoui', '77777777', '2024-03-10 13:00:00', NULL, 'Planifié'),
(1296864, 589759, 4, NULL, '58954023', '2021-11-11 13:00:00', 'pas', 'Nouveau'),
(1296865, 589759, 4, NULL, '58954023', '2021-11-11 13:00:00', 'pas', 'Nouveau'),
(1296866, 589759, 4, 'ammal', '54954023', '2024-12-15 12:00:00', 'pas', 'Nouveau'),
(1296867, 589759, 4, 'karim', '98741258', '2025-01-05 11:05:00', 'pas', 'Nouveau'),
(1296868, 589759, 4, 'test', '78965412', '2024-05-12 14:00:00', 'pas', 'Nouveau'),
(1296869, 589759, 4, 'amine', '90518676', '2024-08-15 11:12:00', 'pas ', 'Nouveau'),
(1296870, 589759, 4, 'ala chebbi', '55987413', '2024-11-15 14:00:00', 'non pas infos ', 'Nouveau'),
(1296871, 589759, 4, '', NULL, '0000-00-00 00:00:00', NULL, 'Nouveau'),
(1296872, 589759, 4, 'arij', '78965412', '2000-11-12 11:00:00', 'pas', 'Nouveau'),
(1296873, 589759, 4, NULL, NULL, '0000-00-00 00:00:00', NULL, 'Nouveau'),
(1296874, 1296878, 4, 'khadija', '98741258', '2024-11-11 11:04:00', 'pas', 'Nouveau'),
(1296876, 1296878, 4, 'John Doe', '123456789', '2024-04-01 10:00:00', 'Consultation de routine', 'Nouveau'),
(1296877, 589759, 4, 'amine', '90518676', '2022-11-12 11:00:00', 'pas', 'Nouveau'),
(1296880, 1296878, 4, 'amine', '98741258', '2024-11-12 11:00:00', 'pas', 'Nouveau'),
(1296882, 1296878, 4, 'karim', '78965412', '2022-02-12 00:00:00', 'pas', 'Nouveau'),
(1296883, 1296878, 4, 'mmm', '00000000', '2024-12-12 11:01:00', 'mmm', 'Nouveau'),
(1296884, 1296878, 4, 'arij', '55555555', '2021-11-15 14:00:00', 'pas', 'Nouveau'),
(1296885, 1296878, 5, 'test', '55555555', '2025-12-11 11:00:00', 'pas', 'Nouveau'),
(1296886, 1296878, 5, 'test00', '21548796', '2024-12-11 11:00:00', 'pas', 'Nouveau');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_patient` (`id_patient`) USING BTREE;

--
-- Index pour la table `fichesmedicales`
--
ALTER TABLE `fichesmedicales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `medecin_id` (`medecin_id`),
  ADD KEY `rendezvous_id` (`rendezvous_id`),
  ADD KEY `id_dossier` (`id_dossier`);

--
-- Index pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `medecin_id` (`medecin_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `fichesmedicales`
--
ALTER TABLE `fichesmedicales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `medecins`
--
ALTER TABLE `medecins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1296881;

--
-- AUTO_INCREMENT pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1296887;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  ADD CONSTRAINT `dossier_medical_ibfk_1` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`);

--
-- Contraintes pour la table `fichesmedicales`
--
ALTER TABLE `fichesmedicales`
  ADD CONSTRAINT `fichesmedicales_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `fichesmedicales_ibfk_2` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`),
  ADD CONSTRAINT `fichesmedicales_ibfk_3` FOREIGN KEY (`rendezvous_id`) REFERENCES `rendezvous` (`id`),
  ADD CONSTRAINT `fichesmedicales_ibfk_4` FOREIGN KEY (`id_dossier`) REFERENCES `dossier_medical` (`id`);

--
-- Contraintes pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD CONSTRAINT `rendezvous_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `rendezvous_ibfk_2` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
