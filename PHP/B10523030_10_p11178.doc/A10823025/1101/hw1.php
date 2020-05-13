<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>hw1</title>
</head>
<body>
<center>
<h2>testdb資料庫users資料表</h2>
<hr>
<?php
$link = odbc_connect("localhost","root","","testdb") or die("無法開啟Access資料庫連接!<br>");
$sql = "SELECT * FROM users";
odbc_connect($link, "testdb");
odbc_exec($link, 'SET NAMES utf8');

if ( $result = odbc_exec($link, $sql) ) { 
	$result = odbc_exec($link, $sql);
	echo "<table border=1>";
	echo "<tr>";
	while ( $meta = odbc_field_name($result) )
	echo "<td>".$meta->name."</td>";
	echo "</tr>";
	$total_fields = odbc_num_fields($result);

	while ($row = odbc_fetch_row($result)) {
		echo "<tr>";
		for ( $i = 1; $i <= $total_fields-1; $i++ )
		echo "<td>" . $row[$i] . "</td>";
		echo "</tr>";
	}
	echo "</table>";

	odbc_free_result($result);
} 
odbc_close($link);
?>
<hr>

</body>
</html>