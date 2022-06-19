<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="empresa_homepage_style.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<title>Compra Enviada </title>
</head>
<body>
	<?php
	include_once ('config.php');
    $idCompras = $_GET['compra'];
	$fecha = date('y-m-d');

	$estadoSQL="SELECT estado
				FROM compras
				WHERE idCompras = '$idCompras'";

	$obtener= $mysqli->query($estadoSQL);


	if($obtener == "recibida"){
		echo "<h1>La fecha no ha podido ser actualizada.</h1>";
		echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
	}
	else if($obtener == "pendiente")
	{
		$estadoSQL="SELECT *
				FROM compras
				WHERE idCompras = '$idCompras'";
		$cadenaSQL=$mysqli->query($estadoSQL);
		if ($cadenaSQL->affected_rows == 1){

			$cadenaSQL = "UPDATE compras
			SET fechaEnvio='$fecha', estado = 'enviada'
			WHERE idCompras='$idCompras'";

			$mysqli->query($cadenaSQL);

			echo "<h1>Fecha actualizada con éxito.</h1>";
			echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
			
		}
		else {
			echo "<h1>La fecha no ha podido ser actualizada.</h1>";
			echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
		}
	}
	else
	{
		echo "<h1>La fecha no ha podido ser actualizada.</h1>";
		echo "<h1>La compra ya fue entregada.</h1>";
		echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
	}

$mysqli->close();
?>

</body>
</html>