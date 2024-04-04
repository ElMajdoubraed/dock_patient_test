const express = require("express");
const bodyParser = require("body-parser");
const swaggerUi = require("swagger-ui-express");
const YAML = require("yamljs");
const swaggerDocument = YAML.load("./swagger/swagger.yaml");
const connectDatabase = require("./config/db");
require("dotenv").config();

// Create Express app
const app = express();

// Middleware pour analyser le corps des requêtes HTTP
app.use(bodyParser.json());

// Database connection
connectDatabase();

// Swagger documentation
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Middleware pour gérer les requêtes liées aux patients
const PatientRoutes = require("./Routes/PatientRoutes");
app.use("/patients", PatientRoutes);

// Port d'écoute du serveur
const PORT = process.env.PORT || 3000;

// Démarrage du serveur
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
