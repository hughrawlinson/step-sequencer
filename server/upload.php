<?php

$dbname = "db1134135_stepseq";
$username = "u1134135_stepseq";
$password = "8oipfi@0[j";
$host = "mysql1555int.cp.blacknight.com";

$arg = $_GET["data"];

//this is undoubtedly susceptible to sql injection :/ fixing time.

$query = "INSERT INTO `".$dbname."`.`beats` (`beat`) VALUES ('".$arg."')";

$mysqli = mysqli_connect($host, $username, $password);
$res = mysqli_query($mysqli, $query);
$row = mysqli_fetch_assoc($res);

$query = "SELECT `id` FROM `".$dbname."`.`beats` WHERE `beat`='".$arg."'";

$res = mysqli_query($mysqli, $query);
$row = mysqli_fetch_assoc($res);

echo $row[id];

?>