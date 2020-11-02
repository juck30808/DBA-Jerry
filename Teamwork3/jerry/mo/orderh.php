<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
</head>
<body>
<?php

$link = @mysqli_connect("localhost", "root", "") 
         or die("無法開啟MySQL資料庫連接!<br/>");

mysqli_select_db($link, "onlinebookstore");
mysqli_query($link, 'SET NAMES utf8');

$sql="SELECT * FROM orderhistory";

$result = @mysqli_query($link, $sql); 

echo "<table border='1'>
<tr>
<th>O_ID</th>
<th>M_ID</th>
<th>M_Count</th>
<th>M_Amount</th>
<th>Date</th>
</tr>";


    
// 顯示欄位名稱

echo "</tr>"; 
// 取得欄位數
$total_fields = mysqli_num_fields($result);
// 顯示每一筆記錄
while ($row = mysqli_fetch_row($result)) {
   echo "<tr>"; // 顯示每一筆記錄的欄位值
   for ( $i = 0; $i <= $total_fields-1; $i++ )
     echo "<td>" . $row[$i] . "</td>";
   echo "</tr>";
}
echo "</table>";
mysqli_free_result($result); // 釋放佔用記憶體  


?>

</body>
</html>