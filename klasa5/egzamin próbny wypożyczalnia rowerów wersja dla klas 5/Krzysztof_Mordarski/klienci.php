<?php

$server = 'localhost';
$user = 'root';
$pass = '';
$database = 'wypozyczalnia_rowerow';

$conn = mysqli_connect($server,$user,$pass,$database);

if(!$conn){
	echo 'connection failed';
}

$sql = mysqli_query($conn, "SELECT klienci.imie_k, klienci.nazwisko_k FROM klienci");

echo "<ul>";
while($wiersz = mysqli_fetch_array($sql)){
		echo "<li>".$wiersz['imie_k']." ".$wiersz['nazwisko_k']."</li>";
}	
echo "</ul>";

?>