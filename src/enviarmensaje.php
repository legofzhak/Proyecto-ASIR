<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<link href="/css/carrito_style.css" type="text/css" rel="stylesheet"/>
<title> Enviar mensaje</title>
</head>
<body>
<?php

include_once ('config.php');

    $nombreEmp=$_GET['nombreEmp'];
    $idCompras=$_GET['compra'];

	echo "<h1>Escriba un mensaje al pedido ".$idCompras." y pulse enviar</h1>";
	echo "<form action='scriptenviarmensaje.php' method='get'>";
	echo "<table style='margin-left:auto;margin-right:auto;'>";
  	echo		"<tr>";
	echo		"<td>Mensaje:</td>";
	echo		"<td><input type='text' name='mensaje'></td>";
	echo		"</tr>";
	echo	"<tr>";
	echo    "<td><input type='hidden' name='nombreEmp' value=$nombreEmp></td>";
	echo    "<td><input type='hidden' name='idCompras' value=$idCompras></td>";
	echo		"<td> <input type='submit' value=Enviar></td>";
	echo	  "</tr>";
	echo"</table>";
	echo"</form>";
	echo "<input type='button' value='Volver atrás' onClick='history.go(-1);'>";
?>
</body>
</html>
