-------------------SQL------------------------
CREATE TABLE zawodnicy(
	id_zawodnicy int not null AUTO_INCREMENT PRIMARY KEY,
    pesel bigint unsigned not null UNIQUE,
    imie varchar(30),
    nazwisko varchar(30)
);

CREATE TABLE dyscyplina(
    id_dyscyplina int not null AUTO_INCREMENT PRIMARY KEY,
    nazwa_dyscypliny varchar(30)
);

CREATE TABLE zawody(
	id_zawody int not null AUTO_INCREMENT PRIMARY KEY,
    id_zawodnicy int,
    id_dyscyplina int,
    nazwa_zowody varchar(30),
    miejsce int,
    FOREIGN KEY (id_osoba) REFERENCES zawodnicy(id_zawodnicy),
    FOREIGN KEY (id_dyscyplina) REFERENCES dyscyplina(id_dyscyplina)
);


INSERT INTO dyscyplina(nazwa_dyscypliny) VALUES ('piłka nożna');
INSERT INTO dyscyplina(nazwa_dyscypliny) VALUES ('siatkówka');
INSERT INTO dyscyplina(nazwa_dyscypliny) VALUES ('koszykówka');
INSERT INTO dyscyplina(nazwa_dyscypliny) VALUES ('piłka ręczna');

INSERT INTO zawodnicy(pesel,imie,nazwisko) VALUES ('12345678910','test','test');
-----------------PHP--------------------------
<?php
$conn = mysqli_connect('localhost','root','','MKDB');

if(!$conn){
    echo "błąd z bazą";
}else{
?>
<!DOCTYPE html>
<html lang="pl">
    <style>
        label{
            margin-bottom: 10px;
        }
    </style>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <form action="index.php" method="post">
            <label for="pesel">
                PESEL:
                <input type="number" name="pesel" id="pesel" maxlenght="11" min="0">
            </label>
            <label for="name">
                Imie:
                <input type="text" name="name" id="name" maxlenght="30">
            </label>
            <label for="surname">
                Nazwisko:
                <input type="text" name="surname" id="surname" maxlenght="30">
            </label><br>
            <label for="competition">
                Zawody:
                <select name="competition" id="competition">
                    <?php   
                    $competition = mysqli_query($conn,"SELECT dyscyplina.nazwa_dyscypliny FROM dyscyplina");
    
                    while($comp_name=mysqli_fetch_array($competition)){
                        echo "<option value='$comp_name[0]'>$comp_name[0]</option>";
                    }
    
                    ?>
                </select>
            </label><br>
            <label for="placement">
                Miejsce w zawodach:
                <input type="number" name="placement" id="placement">
            </label>
            <input type="submit" value="Wyślij">
        </form>
        <?php

        if(isset($_POST['pesel']) && isset($_POST['name']) && isset($_POST['surname']) && isset($_POST['competition']) && isset($_POST['placement'])){
            $pesel = $_POST['pesel'];
            $name = $_POST['name'];
            $surname = $_POST['surname'];
            $competition = $_POST['competition'];
            $placement = $_POST['placement'];
            
            if(!preg_match('/^[0-9]{11}$/', $pesel)){
                echo "zly pesel";
            }else{
                $pesel_check = mysqli_query($conn, "SELECT zawodnicy.pesel FROM zawodnicy");
                while($pesel_check_arr = mysqli_fetch_array($pesel_check)){
                    if($pesel_check_arr[0] == $pesel){
                        echo "pesel nie zgodny z baza";
                        exit;
                    }
                }
                
                mysqli_query($conn, "INSERT INTO zawodnicy(pesel,imie,nazwisko) VALUES($pesel, '$name', '$surname')");
                $member_id = mysqli_fetch_array(mysqli_query($conn, "SELECT zawodnicy.id_zawodnicy FROM zawodnicy WHERE zawodnicy.pesel = $pesel"))[0];
                $comp_id = mysqli_fetch_array(mysqli_query($conn, "SELECT dyscyplina.id_dyscyplina FROM dyscyplina WHERE dyscyplina.nazwa_dyscypliny = '$competition'"))[0];
                mysqli_query($conn, "INSERT INTO zawody(id_dyscyplina,id_zawodnicy,miejsce) VALUES($comp_id,$member_id,$placement)");
                
            }
        }else{
            echo "wpisz dane";
        }
        ?>
        <form action="index.php" method="post">
            <?php
            $member_list = mysqli_query($conn,"SELECT * FROM zawodnicy");
            while($member = mysqli_fetch_array($member_list)){
                echo "<label for='$member[0]'><p>$member[1], $member[2], $member[3]</p><input type='submit' value='Usuń' name='delete'></label>";
            }
            
            ?>
        </form>
    </body>
</html>
<?php
}
?>
