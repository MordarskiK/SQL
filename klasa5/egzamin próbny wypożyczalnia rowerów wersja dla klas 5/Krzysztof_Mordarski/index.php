<?php

$server = 'localhost';
$user = 'root';
$pass = '';
$database = 'wypozyczalnia_rowerow';

$conn = mysqli_connect($server,$user,$pass,$database);

if(!$conn){
	echo 'connection failed';
}

$klienci = mysqli_fetch_array(mysqli_query($conn, "SELECT COUNT(klienci.id_k) FROM klienci"));
$rowery = mysqli_fetch_array(mysqli_query($conn, "SELECT COUNT(rowery.id_r) FROM rowery
								WHERE rowery.dostepnosc > 0"));

$data = getdate();	

echo "<h2>(N1)Witamy w wypożyczalni rowerów, dzisiaj jest: ".$data['mday']."-".$data['mon']."-".$data['year']."</h2>";

echo "<table>
		<tr>
			<th>Klienci</th>
			<th>Rowery</th>
		</tr>";
		
echo "<tr>
		<td>
			<strong>Aktualna liczba klientów wynosi: $klienci[0]</strong><br><br>
			<a href='klienci.php'>Wyświetl listę klientów</a><br>
		</td>
		<td>
			<strong>Aktualna liczba dostepnych rowerów wynosi: $rowery[0]</strong><br><br>
			<a href='rowery.php'>Wyświetl listę rowerów</a><br>
		</td>
	</tr>
	</table>";

?>
<style>

th, td{
	padding: 4px;
}

</style>