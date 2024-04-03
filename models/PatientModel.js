// models/PatientModel.js

const db = require('../config/db');

class Patient {
  static getAll(callback) {
    const query = "SELECT * FROM patients";
    db.query(query, (err, result) => {
      if (err) {
        callback(err, null);
        return;
      }
      callback(null, result);
    });
  }

  static getById(patientId, callback) {
    const query = "SELECT * FROM patients WHERE id = ?";
    db.query(query, [patientId], (err, result) => {
      if (err) {
        callback(err, null);
        return;
      }
      if (result.length === 0) {
        callback({ message: "Patient not found" }, null);
        return;
      }
      callback(null, result[0]);
    });
  }

  static create(newPatient, callback) {
    const query = "INSERT INTO patients SET ?";
    db.query(query, newPatient, (err, result) => {
      if (err) {
        callback(err, null);
        return;
      }
      callback(null, result.insertId);
    });
  }

  static update(patientId, updatedPatient, callback) {
    const query = "UPDATE patients SET ? WHERE id = ?";
    db.query(query, [updatedPatient, patientId], (err, result) => {
      if (err) {
        callback(err, null);
        return;
      }
      callback(null, result.affectedRows);
    });
  }

  static delete(patientId, callback) {
    const query = "DELETE FROM patients WHERE id = ?";
    db.query(query, [patientId], (err, result) => {
      if (err) {
        callback(err, null);
        return;
      }
      callback(null, result.affectedRows);
    });
  }
  static findByCIN(cin, callback) {
    const query = "SELECT * FROM patients WHERE cin = ?";
    db.query(query, [cin], (err, result) => {
      if (err) {
        callback(err, null);
        return;
      }
      if (result.length === 0) {
        callback(null, null); // Patient non trouvé
        return;
      }
      callback(null, result); // Retourne tous les patients correspondants
    });
  }
  
  
}

module.exports = Patient;
