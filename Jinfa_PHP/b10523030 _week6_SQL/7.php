<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Ch11_2_2.php</title>
</head>
<body>
<?php
	// 建立MySQL的資料庫連接 
	$link = mysqli_connect("localhost","root","","testdb")or die("無法開啟MySQL資料庫連接!<br>");
	// 指定SQL查詢字串
	$sql = "SELECT * FROM users";
	// 送出查詢的SQL指令
	mysqli_set_charset($link, 'utf8');
	$result = mysqli_query($link, $sql);
	// 一筆一筆的以表格顯示記錄
	echo "<table border=1><tr>";

	// 顯示欄位名稱
	while ( $meta = mysqli_fetch_field($result) )
		echo "<td>".$meta->name."</td>";
	echo "</tr>"; // 取得欄位數
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
	mysqli_close($link);  // 關閉資料庫連接
?>
</body>
</html>