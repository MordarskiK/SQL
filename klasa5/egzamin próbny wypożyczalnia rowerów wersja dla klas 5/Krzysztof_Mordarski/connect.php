<?php

$server = 'localhost';
$user = 'root';
$pass = '';
$database = 'wypozyczalnia_rowerow';

$conn = mysqli_connect($server,$user,$pass,$database);

if(!$conn){
	echo 'connection failed';
}else{
	echo 'connection succsess';
}

?>