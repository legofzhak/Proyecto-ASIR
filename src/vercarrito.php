<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="/css/carrito_style.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<title>Lista de Carrito </title>
</head>
<body>
<?php

include_once ('config.php');

$seccion= $_GET['seccion'];
$login = $_GET['login'];

$cadenaSQL = "SELECT * 
			  FROM carrito C INNER JOIN productos P ON C.productos_Codigo=P.Codigo 
			  WHERE Cliente_login= '$login'";

	$resultado = $mysqli->query($cadenaSQL);

	echo "<h1>Carrito</h1>";

	if ($resultado){
		echo "<table style='margin-left:auto;margin-right:auto;'>";
		echo "<tr>";
		echo "<th>Producto</th>";
		echo "<th>Precio</th>";
		echo "<th>Cantidad</th>";
		echo "</tr>";
		while ($fila = $resultado->fetch_object()) {
			
			echo "<br/>";
			echo "<tr>";
			echo "<td>" . $fila->Nombre; echo "</td>";
			echo "<td>" .  $fila->Precio; echo "</td>";
			echo "<td>" . $fila->cantidad; echo "</td>";
			echo "<td>" . "<a href='eliminarproducto.php?producto=$fila->Codigo&login=$login&seccion=$seccion'><input
					type='button' value='Eliminar Producto'> </a>"; echo "</td>";

			
			echo "</tr>";

		}
		echo "</table>";
		echo "<br>";
		echo "<a href='comprar.php?login=$login&seccion=$seccion'>Comprar</a>";
		echo "       ";
		echo "<a href='secciones.php?login=$login&seccion=$seccion'>Volver atrás</a><br/>";

	}
	else {
		echo "<h1>Aún no se han introducido elementos en el carrito</h1>";
		echo "<a href='secciones.php?login=$login&seccion=$seccion'>Volver atrás</a>";
	}

$mysqli->close();
?>

</body>
</html>