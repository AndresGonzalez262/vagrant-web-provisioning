<?php
  echo "<h1>Hola desde PHP</h1>";
  echo "<h2>Bienvenido</h2>";
  echo "<p>Hoy es " . date("d/m/Y") . "</p>";
  phpinfo();
?>

<?php
$conn = pg_connect("host=192.168.56.11 dbname=taller user=postgres");

if (!$conn) {
    echo "Error al conectar con la base de datos.";
    exit;
}

$result = pg_query($conn, "SELECT * FROM usuarios");

echo "<h1>Usuarios registrados</h1>";
while ($row = pg_fetch_assoc($result)) {
    echo "<p>ID: " . $row['id'] . " - Nombre: " . $row['nombre'] . "</p>";
}
?>