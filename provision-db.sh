#debes completar este archivo con los comandos necesarios para provisionar la base de datos
#!/bin/bash

# Actualiza los paquetes
sudo apt-get update

# Instala PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib

# Crear base de datos y tabla
sudo -u postgres psql <<EOF
CREATE DATABASE taller;
\c taller
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50)
);
INSERT INTO usuarios (nombre) VALUES ('Paola'), ('Andrea'), ('Ortegon');
EOF