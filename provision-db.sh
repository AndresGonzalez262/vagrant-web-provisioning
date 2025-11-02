
#!/bin/bash

# Actualiza los paquetes
sudo apt-get update

# Instala PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib

sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/12/main/postgresql.conf

echo "host    all             all             192.168.56.0/24            md5" | sudo tee -a /etc/postgresql/12/main/pg_hba.conf > /dev/null

sudo systemctl restart postgresql

# Crear base de datos y tabla
sudo -u postgres psql <<EOF
CREATE DATABASE taller;
\c taller
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50)
);
INSERT INTO usuarios (nombre) VALUES ('Paola'), ('Andrea'), ('Ortegon');
INSERT INTO usuarios (nombre) VALUES ('Javier'), ('Francisco'), ('Alarcon');
EOF

echo "Provisionamiento de DB completado."