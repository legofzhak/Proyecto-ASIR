<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="/css/logeo_style.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<title> Profucto eliminado </title>
</head>
<body>
	<?php
	include_once ('config.php');
	$producto = $_GET['producto'];
	$login = $_GET['login'];
	$seccion = $_GET['seccion'];

	$cadenaSQL = "DELETE
                    FROM productosfavoritos
                    WHERE productos_Codigo = '$producto'
                            AND Cliente_login = '$login'";
					
	$mysqli->query($cadenaSQL);

	if ($mysqli->affected_rows == 1){
		echo "<h1>Producto eliminado con éxito</h1>";
		echo "<a href='secciones.php?login=$login&seccion=$seccion'>Volver atrás</a>";
	}
	else {
		echo "<h1>Producto no eliminado</h1>";
		echo "<a href='secciones.php?login=$login&seccion=$seccion'>Volver atrás</a>";
	}

$mysqli->close();
?>

</body>
</html>