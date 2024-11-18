<?php

$server = 'localhost';
$user = 'root';
$pass = '';
$database = 'wypozyczalnia_rowerow';

$conn = mysqli_connect($server,$user,$pass,$database);

if(!$conn){
	echo 'connection failed';
}

$sql = mysqli_query($conn, "SELECT rowery.model, rower_typ.typ FROM rowery
							JOIN rower_typ ON rower_typ.id_rt = rowery.typ
							WHERE rowery.dostepnosc > 0");

echo "<ul>";
while($wiersz = mysqli_fetch_array($sql)){
		echo "<li>".$wiersz['model'].", ".$wiersz['typ']."</li>";
}	
echo "</ul>";

?>