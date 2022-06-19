<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
		<link href="/css/categorias_style.css" type="text/css" rel="stylesheet"/>
		<title> Categorías</title>
	</head>
<body>
	<?php
	
			include_once ('config.php');
			$categoria = $_GET['categoria'];
			$seccion = $_GET['seccion'];
			$login = $_GET['login'];

			$cadenaSQL = "SELECT * FROM productos WHERE idCategoria='$categoria'";

			$resultado = $mysqli->query($cadenaSQL);

			echo "<h1>Listado de Productos</h1>";

			if ($resultado){

				echo "<table style='margin-left:auto;margin-right:auto;'>";
				echo "<tr>";
				echo "<th>Producto</th>";
				echo "<th>Descripcion</th>";
				echo "<th>Precio</th>";
				echo "<th>Fabricante</th>";
				echo "<th>Comprar</th>";
				echo "<th>Favoritos</th>";
				echo "</tr>";
				while ($fila = $resultado->fetch_object()) {

					echo "<tr>";
					echo "<td>" . $fila->Nombre; echo "</td>";
					echo "<td>" . $fila->Descripcion; echo "</td>";
					echo "<td>" .  $fila->Precio; echo "</td>";
					echo "<td>" . $fila->Fabricante; echo "</td>";
					echo "<td>" . "<a href='añadircarrito.php?producto=$fila->Codigo&login=$login&seccion=$seccion'><input
						type='button' value='Añadir a Carrito'> </a>"; echo "</td>";
					echo "<td>" . "<a href='scriptanadirfavoritos.php?producto=$fila->Codigo&login=$login&seccion=$seccion'><input
							type='button' value='Añadir a Favoritos'> </a>"; echo "</td>";
					echo "</tr>";
				}
				
				echo "</table>";
				echo "<br>";
				echo "<a href='vercarrito.php?login=$login&seccion=$seccion'>Ver Carrito</a>";
				echo "       ";
				echo "<a href='verfavoritos.php?login=$login&seccion=$seccion'>Ver Favoritos</a>";
				echo "       ";
				echo "<a href='secciones.php?login=$login&seccion=$seccion'>Volver atrás</a>";
				echo "<br>";
				echo "<a href='index.php'>Salir</a>";

				}
			else {
				echo "<h1>Aún no existen productos de esta categoría</h1>";
				echo "<a href='secciones.php?login=$login&seccion=$seccion'>Volver atrás</a>";
			}

		$mysqli->close();
	?>
</body>
</html>