<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<link href="/css/categorias_style.css" type="text/css" rel="stylesheet"/>
			<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
			<title> Comprar </title>
		</head>
	<body>
		<?php
				include_once ('config.php');

				$login = $_GET['login'];
				$seccion = $_GET['seccion'];

				$cadenaSQL = "SELECT * 
								FROM carrito C INNER JOIN productos P ON C.productos_Codigo=P.Codigo 
								WHERE Cliente_login= '$login'";

				$resultado = $mysqli->query($cadenaSQL);

				echo "<h1>Lista de la Compra</h1>";

				if ( $resultado){


						echo "<table style='margin-left:auto;margin-right:auto;'>";
						echo "<tr>";
						echo "<th>Cantidad</th>";
						echo "<th>Producto</th>";
						echo "<th>Descripcion</th>";
						echo "<th>Precio</th>";
						echo "<th>Fabricante</th>";
						echo "</tr>";
						while ($fila = $resultado->fetch_object()) {
						echo "<tr>";
						echo "<td>" . $fila->cantidad;  echo "</td>";
						echo "<td>" . $fila->Nombre;  echo "</td>";
						echo "<td>" . $fila->Descripcion; echo "</td>";
						echo "<td>" . $fila->Precio; echo "</td>";
						echo "<td>" . $fila->Fabricante; echo "</td>";
						echo "</tr>";
						}
						echo "</table>"."<br>";


						$auxEmp = "SELECT T.nombre 
									FROM transportes T";

					echo " Empresa de Transporte: ";
					echo "<select name='empresas' form='confirmar'>";
					
					$empresas = $mysqli -> query ($auxEmp);
					while ($fila = $empresas->fetch_array()) {
						echo "<option value='$fila[0]'>".$fila[0]."</option>";
					}

					echo  "</select>";

					
					echo " Direccion: ";
					echo "<select name='direcciones' form='confirmar'>";

					$auxDir = "SELECT *
							FROM direccion D
							WHERE D.Cliente_login = '$login'";

					$direcciones = $mysqli -> query ($auxDir);
					while ($fila = $direcciones->fetch_array()) {
						echo "<option value='$fila[0]'>"."Calle ".$fila[1].", nº ".$fila[2].", Piso ".$fila[3].", letra ".$fila[4].", CP ".$fila[5].", Ciudad ".$fila[6]."</option>";
						//echo "<option value='$fila[0]'>$fila[0]</option>";
					}
					echo  "</select>";
					echo "<form action='confirmar.php' method='get' id='confirmar'>";
					echo "<td><input type='hidden' name='login' value=$login></td>";
					echo "<td><input type='hidden' name='seccion' value=$seccion></td>";
					echo "<input type='submit' value='Confirmar' />";
					echo "</form>";
					echo "<a href='secciones.php?login=$login&seccion=$seccion'>Cancelar</a>";

				}
				else 
				{
					echo "<h1>Aún no existen elementos en el carrito</h1>";
					echo "<a href='vercarrito.php?login=$login&seccion=$seccion'>Volver atrás</a>";
				}

			//	Cerrar la conexión
			$mysqli->close();
		?>

	</body>
</html>