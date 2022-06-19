<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="empresa_homepage_style.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<title>Enviar Mensaje </title>

</head>
<body>
	<?php
	include_once ('config.php');
    $idCompras = $_GET['idCompras'];
    $nombreEmp = $_GET['nombreEmp'];
	$mensaje = $_GET['mensaje'];
    
	if($mensaje)
	{

		$cadenaSQL = "INSERT INTO mensajeria ()
						VALUES ('$nombreEmp', '$mensaje', '$idCompras')";
					
		$mysqli->query($cadenaSQL);
					
		if ($mysqli->affected_rows == 1)
		{
				echo "<h1>Mensaje enviado!</h1>";
				echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
		}
		else 
		{
			$entradaSQL = "	UPDATE mensajeria
							SET mensaje = '$mensaje'
							WHERE Compras_idCompras='$idCompras'";
			$mysqli->query($entradaSQL);

			if($mysqli->affected_rows == 1)
			{
				echo "<h1>Mensaje actualizado.</h1>";
				echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
			}
			else
			{
				echo "<h1>Error al actualizar el mensaje.</h1>";
				echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
			}
		}
	}
	else
	{
		echo "<h1>No se ha escrito ningún mensaje.</h1>";
		echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
	}

$mysqli->close();
?>

</body>
</html>
