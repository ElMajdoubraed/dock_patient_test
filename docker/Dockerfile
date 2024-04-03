# Utiliser l'image MariaDB officielle en tant que base
FROM mariadb:10.4.32

# Copier le script SQL d'initialisation dans le répertoire de scripts d'initialisation de MariaDB
COPY init.sql /docker-entrypoint-initdb.d/

# Définir les variables d'environnement pour configurer la base de données

ENV MYSQL_DATABASE=medirendez
ENV MYSQL_ROOT_PASSWORD=root
# Exposer le port MySQL
EXPOSE 3306
