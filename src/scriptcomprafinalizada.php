<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="/css/logeo_style.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<title>Compra Finalizada </title>
</head>
<body>
	<?php
	include_once ('config.php');
    $idCompras = $_GET['compra'];
	$fecha = date('y-m-d');


	$cadenaSQL = "UPDATE compras
                    SET fechaRecepcion='$fecha', estado = 'recibida'
                    WHERE idCompras='$idCompras'";

	$mysqli->query($cadenaSQL);

	if ($mysqli->affected_rows == 1){
		echo "<h1>Fecha actualizada con éxito.</h1>";
		echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
	}
	else {
		echo "<h1>La fecha no ha podido ser actualizada.</h1>";
		echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
	}

$mysqli->close();
?>

</body>
</html>