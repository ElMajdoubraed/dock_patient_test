const Patient = require('../models/PatientModel');
const db = require('../config/db');
exports.getAllPatients = (req, res) => {
  Patient.getAll((err, patients) => {
    if (err) {
      res.status(500).json({ message: "Une erreur s'est produite lors de la récupération des patients." });
    } else {
      res.status(200).json(patients);
    }
  });
};

exports.getPatientById = (req, res) => {
  const id = req.params.id;
  Patient.getById(id, (err, patient) => {
    if (err) {
      res.status(500).json({ message: "Une erreur s'est produite lors de la récupération du patient." });
    } else if (!patient) {
      res.status(404).json({ message: "Patient non trouvé." });
    } else {
      res.status(200).json(patient);
    }
  });
};

exports.createPatient = (req, res) => {
    const { nom, prenom, date_de_naissance, sexe, adresse_email, numero_de_telephone, adresse ,autres_informations_medicales,cin} = req.body;
    const newPatient = {  nom, prenom, date_de_naissance, sexe, adresse_email, numero_de_telephone, adresse ,autres_informations_medicales,cin};
  
    Patient.create(newPatient, (err, patientId) => {
      if (err) {
        console.error("Une erreur s'est produite lors de la création du patient :", err);
        res.status(500).json({ message: "Une erreur s'est produite lors de la création du patient." });
        return;
      }
      res.status(201).json({ message: "Patient créé avec succès.", patientId });
    });
  };
  

  exports.updatePatient = (req, res) => {
    const id = req.params.id;
    const updatedPatient = {
      nom: req.body.nom,
      prenom: req.body.prenom,
      date_de_naissance: req.body.date_de_naissance,
      sexe: req.body.sexe,
      adresse_email: req.body.adresse_email,
      numero_de_telephone: req.body.numero_de_telephone,
      adresse: req.body.adresse,
      autres_informations_medicales: req.body.autres_informations_medicales,
      cin: req.body.cin
    };
    
    Patient.update(id, updatedPatient, (err, result) => {
      if (err) {
        res.status(500).json({ message: "Une erreur s'est produite lors de la mise à jour du patient." });
      } else if (result.affectedRows === 0) {
        res.status(404).json({ message: "Patient non trouvé." });
      } else {
        res.status(200).json({ message: "Patient mis à jour avec succès." });
      }
    });
  };

exports.deletePatient = (req, res) => {
  const id = req.params.id;
  Patient.delete(id, (err, result) => {
    if (err) {
      res.status(500).json({ message: "Une erreur s'est produite lors de la suppression du patient." });
    } else if (result.affectedRows === 0) {
      res.status(404).json({ message: "Patient non trouvé." });
    } else {
      res.status(200).json({ message: "Patient supprimé avec succès." });
    }
  });

  

};

exports.rechercherPatientParCIN = (req, res) => {
  const cin = req.params.cin;
  console.log(cin);
  Patient.findByCIN(cin, (err, patient) => {
    if (err) {
      console.error('Erreur lors de la recherche du patient : ', err);
      res.status(500).send('Erreur lors de la recherche du patient');
      return;
    }
    if (!patient) {
      res.status(404).send('Patient non trouvé lors de recherche');
      return;
    }
    res.json(patient);
  });
};
