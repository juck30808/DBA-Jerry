<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>hw7.php</title>
</head>
<body>
<h1 align="center">testdb資料庫users資料表</h1>
<?php

$link = mysqli_connect("localhost","root",
                      "","test1")
					  or die("無法開啟MySQL資料庫連接!<br>");
mysqli_query($link, 'SET NAMES utf8');
$sql = "SELECT * FROM test11";
$result = mysqli_query($link, $sql);
 
echo "<table border=1 align=center><tr>";

while ( $meta = mysqli_fetch_field($result) )
    echo "<td>".$meta->name."</td>";
echo "</tr>";

$total_fields = mysqli_num_fields($result);
while ($row = mysqli_fetch_row($result)) {
    echo "<tr>"; // 顯示每一筆記錄的欄位值
    for ( $i = 0; $i <= $total_fields-1; $i++ )
       echo "<td>" . $row[$i] . "</td>";
    echo "</tr>";
} 
echo "</table>";
mysqli_free_result($result);
mysqli_close($link);
?>
</body>
</html>