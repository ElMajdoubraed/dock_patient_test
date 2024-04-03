// Import des modules nécessaires
const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const swaggerDocument = YAML.load('./swagger/swagger.yaml');
require('dotenv').config(); // Chargement des variables d'environnement depuis le fichier .env

// Configuration de la connexion à la base de données en utilisant les variables d'environnement
const db = mysql.createConnection({
  host: process.env.MYSQL_HOST || 'mysql',
  user: process.env.MYSQL_USER || 'root',
  password: process.env.MYSQL_PASSWORD || 'root',
  database: process.env.MYSQL_DATABASE || 'medirendez'
});

// Vérification de la connexion à la base de données
db.connect(err => {
  if (err) {
    console.error('Erreur de connexion à la base de données : ', err);
    return;
  }
  console.log('Connecté à la base de données MySQL');
});

// Création de l'application Express
const app = express();
const PatientRoutes=require('./Routes/PatientRoutes');
// Middleware pour analyser le corps des requêtes HTTP
app.use(bodyParser.json());

// Middleware pour gérer les requêtes liées aux patients
app.use('/patients', PatientRoutes);

// Middleware pour afficher la documentation Swagger
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Port d'écoute du serveur
const PORT = process.env.PORT || 3000;

// Démarrage du serveur
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
