<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<link href="/css/carrito_style.css" type="text/css" rel="stylesheet"/>
			<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
			<title> Lista Favoritos </title>
		</head>
	<body>
		<?php

			include_once ('config.php');

			$seccion= $_GET['seccion'];
			$login = $_GET['login'];

			$cadenaSQL = "SELECT * 
						FROM productosfavoritos PF INNER JOIN productos P ON PF.productos_Codigo=P.Codigo 
						WHERE Cliente_login= '$login'";

			$resultado = $mysqli->query($cadenaSQL);

			echo "<h1>Productos favoritos</h1>";

			if ($resultado){


				echo "<table style='margin-left:auto;margin-right:auto;'>";
				echo "<tr>";
				echo "<th>Producto</th>";
				echo "<th>Descripcion</th>";
				echo "<th>Precio</th>";
				echo "<th>Fabricante</th>";
				echo "</tr>";
				while ($fila = $resultado->fetch_object()) {
					
					echo "<br/>";
					echo "<tr>";
					echo "<td>" . $fila->Nombre; echo "</td>";
					echo "<td>" . $fila->Descripcion; echo "</td>";
					echo "<td>" .  $fila->Precio; echo "</td>";
					echo "<td>" . $fila->Fabricante; echo "</td>";
					echo "<td>" . "<a href='productoeliminado.php?producto=$fila->Codigo&login=$login&seccion=$seccion'><input
							type='button' value='Eliminar Producto'> </a>"; echo "</td>";

					echo "</tr>";

				}
				echo "</table>";
				echo "<br><a href='secciones.php?login=$login&seccion=$seccion'>Volver atrás</a><br/>";
			}
			else {
				echo "<h1>Aún no se han introducido favoritos</h1>";
				echo "<a href='secciones.php?login=$login&seccion=$seccion'>Volver atrás</a>";
			}

			$mysqli->close();
		?>

	</body>
</html>