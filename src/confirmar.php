<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
			<link href="/css/logeo_style.css" type="text/css" rel="stylesheet"/>
			<title> Compra confirmada </title>
		</head>
	<body>
		<?php

		include_once ('config.php');

		$seccion= $_GET['seccion'];
		$login = $_GET['login'];
		$empresas = $_GET['empresas'];
		$direcciones = $_GET['direcciones'];
		$fecha = date('y-m-d');

			$pago = "SELECT SUM(cantidad * Precio) AS pago
					FROM carrito C INNER JOIN productos P ON C.productos_Codigo = P.Codigo
					WHERE C.Cliente_login = '$login'";	

			$resultado = $mysqli->query($pago);
			$f1 = $resultado->fetch_object();

			$cadenaSQL= "INSERT INTO compras (fechaRealizacion, total, estado, Cliente_login, Transportes_nombre, direccion_idDireccion)
								VALUES('$fecha','$f1->pago','pendiente','$login','$empresas','$direcciones')";

			$resultado2 = $mysqli->query($cadenaSQL);
			if($resultado2)
			{
				echo "<h1>La compra se ha realizado correctamente.</h1>";

				$idCompras= "SELECT MAX(idCompras) as idCompras
								FROM compras";
				$resultado3 = $mysqli->query($idCompras);
				$f2 = $resultado3->fetch_object();
				$cadenaSQL = "SELECT productos_Codigo, cantidad 
								FROM carrito C INNER JOIN productos P ON C.productos_Codigo = P.Codigo";
				$resultado4 = $mysqli->query($cadenaSQL);
				while($f3 = $resultado4->fetch_object()){
					$anadir = "INSERT INTO productoscompra (producto, cantidad, Compras_idCompras, devuelto)
									VALUES ('$f3->productos_Codigo','$f3->cantidad','$f2->idCompras','Pendiente')";
					$mysqli->query($anadir);	
				}

				$cadenaSQL = "  DELETE
								FROM carrito
								WHERE Cliente_login = '$login'";
				$mysqli->query($cadenaSQL);
			}
			else
			{
				echo "<h1>ERROR.</h1>";
			}
			echo "<form action='comprar.php' method='get'>";
			echo "<a href='login.php'>Salir</a>";
		?>
	</body>
</html>