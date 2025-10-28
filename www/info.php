<?php
date_default_timezone_set("America/Bogota");

// Mensaje de bienvenida
echo "<h1>Hola desde PHP</h1>";
echo "<h2>Bienvenida, Paola Andrea Ortegon Orozco</h2>";
echo "<p>Hoy es " . date("d/m/Y") . "</p>";

// Mostrar información de PHP
phpinfo();

// Conexión a PostgreSQL
$conn = pg_connect("host=192.168.56.11 dbname=taller user=postgres");

if (!$conn) {
    echo "<p>Error al conectar con la base de datos.</p>";
    exit;
}

$result = pg_query($conn, "SELECT * FROM usuarios");

echo "<h2>Usuarios registrados</h2>";
while ($row = pg_fetch_assoc($result)) {
    echo "<p>ID: " . $row['id'] . " - Nombre: " . $row['nombre'] . "</p>";
}
?>