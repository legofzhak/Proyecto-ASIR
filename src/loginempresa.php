<!DOCtype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="/css/carrito_style.css" type="text/css" rel="stylesheet"/>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <title>  Tienda Virtual </title>
</head>
<body>
    <?php
    include_once ('config.php');
    $login  = $_POST['nombre'];
    $password  = $_POST['pass'];

    $nomEmp = "SELECT nombre FROM transportes WHERE login='$login' AND password='$password'";

    $result = $mysqli->query($nomEmp);

    $auxEmp = $result->fetch_array();
    $nombreEmp = $auxEmp[0];
    

    echo "<h1>Pulse F5 para visualizar posibles cambios.</h1>";
        if($result->num_rows == 1)
        {
            
            $cadenaCompra= "SELECT * 
                            FROM compras
                            WHERE Transportes_nombre='$nombreEmp'";

            $resultado = $mysqli->query($cadenaCompra);

            echo "<table style='margin-left:auto;margin-right:auto;'>";
		    echo "<tr>";
		    echo "<th>IdCompra</th>";
		    echo "<th>Login del Cliente</th>";
    		echo "<th>Estado</th>";
            echo "<th>Marcar como enviada</th>";
            echo "<th>Marcar como finalizada</th>";
            echo "<th>Enviar un mensaje</th>";
    		echo "</tr>";
	    	while ($fila = $resultado->fetch_object()) {
			
			    echo "<br/>";
			    echo "<tr>";
			    echo "<td>" . $fila->idCompras; echo "</td>";
			    echo "<td>" .  $fila->Cliente_login; echo "</td>";
			    echo "<td>" . $fila->estado; echo "</td>";
                echo "<td>" . "<a href='scriptcompraenviada.php?compra=$fila->idCompras&login=$login&password=$password'><input
				type='button' value='Enviar compra'> </a>"; echo "</td>";
                echo "<td>" . "<a href='scriptcomprafinalizada.php?compra=$fila->idCompras&login=$login&password=$password'><input
				type='button' value='Finalizar compra'> </a>"; echo "</td>";
                echo "<td>" . "<a href='enviarmensaje.php?compra=$fila->idCompras&nombreEmp=$nombreEmp'><input
				type='button' value='Mensaje'> </a>"; echo "</td>";
			    echo "</tr>";

            }
		    echo "</table>";
		    echo "<br>";

            echo "<br><a href='paginaloginempresa.php'>Salir</a></br>";
        }
        else
        {
            echo "Datos incorrectos";
            echo "<br><a href='paginaloginempresa.php'>Salir</a></br>";
        }


$mysqli->close();
?>
</body>
</html>