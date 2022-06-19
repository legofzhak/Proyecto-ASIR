<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="/css/secciones_style.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<title>  Secciones </title>
</head>
<body>
	<?php
	include_once ('config.php');

	$seccion = $_GET['seccion'];
	$login  = $_GET['login'];

	$cadenaSQL = "SELECT * FROM categorias WHERE IdSeccion='$seccion'";

	$resultado = $mysqli->query($cadenaSQL);

	if ($resultado){
			
			echo "<h1>Listado de Categorías: Escoge una Categoría</h1><br>";
			echo "<table>";

		while ($fila = $resultado->fetch_object()) {
			
			echo "<td><h2>"."<a href = 'categorias.php?categoria=$fila->IdCategoria&seccion=$seccion&login=$login'>" . $fila->Nombre . "</a></h2></td>";
		}
			echo "</table>";
		
			echo "<a href='vercarrito.php?login=$login&seccion=$seccion'>Ver Carrito</a>";
			echo "       ";
			echo "<a href='verfavoritos.php?login=$login&seccion=$seccion'>Ver Favoritos</a>";
			echo "<br>";
			echo "<a href='login.php'>Salir</a>";

	}
	else {
		echo "<h1>Aún no existen categorías de esta sección</h1>"."</br>";
		echo "<a href='login.php'>Salir</a>";
	}

$mysqli->close();
?>

</body>
</html>