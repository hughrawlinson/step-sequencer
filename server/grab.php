<?php

$dbname = "db1134135_stepseq";
$username = "u1134135_stepseq";
$password = "8oipfi@0[j";
$host = "mysql1555int.cp.blacknight.com";

$query = "SELECT beat FROM `".$dbname."`.`beats` WHERE id='".$_GET["data"]."'"."\n";

$mysqli = mysqli_connect($host, $username, $password);
$res = mysqli_query($mysqli, $query);
$row = mysqli_fetch_assoc($res);

echo $row[beat];

?> 