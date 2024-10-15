<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        label{
            display:block;
        }
    </style>
</head>
<body>
    <form action="index2.php" method="get">
        <label for="firstName">
            Imię:
            <input type="text" name="firstName" id="firstName">
        </label>
        <label for="age">
            Wiek:
            <input type="number" name="age" id="age">
        </label>
        <label for="gender">
            Płeć:
            <input type="radio" name="gender" id="genderMan" value="man">M
            <input type="radio" name="gender" id="genderWoman" value="woman">K
        </label>
        <label for="favColor">
            Ulubiony kolor:
            <select name="favColor" id="favColor">
                <option value="red">czerwony</option>
                <option value="green">zielony</option>
                <option value="blue">niebieski</option>
            </select>
        </label>
        <label for="favGame[]">
            Ulubiona gra:
            <input type="checkbox" name="favGame[]" value="GTA">GTA
            <input type="checkbox" name="favGame[]" value="FIFA">FIFA
            <input type="checkbox" name="favGame[]" value="BattleField">BattleField
            <input type="checkbox" name="favGame[]" value="Settlers">Settlers
        </label>
        <textarea name="text" id="text"></textarea>
        <input type="submit" name="submitBtn" id="submitBtn" value="Prześlij">
    </form>
</body>
</html>

<?php   

$firstName = $_GET["firstName"];
$age = $_GET["age"];
$gender = $_GET["gender"];
$favColor = $_GET["favColor"];
$favGame = $_GET["favGame"];
$text = $_GET["text"];

// var_dump($favGame);
echo "$firstName, $age, $gender, $favColor, ";
foreach($favGame as $game){
    echo "$game, ";
} 
echo "$text";

?>
