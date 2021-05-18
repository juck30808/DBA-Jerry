<html>
	<head>
		<meta charset="utf-8" />
		<title>Successed</title>
	</head>
	<body>
		<h1>資料庫管理系統</h1>
		<p><p>
		<?php
			session_start();  
			$No = $_SESSION["No"];
			$link = mysqli_connect("localhost","root","root","testdb")or die("無法開啟MySQL資料庫連接!<br>");
			$sql = "SELECT * FROM users ";
			$sql.= " WHERE 編號 IN (". $No . ")";
			mysqli_query($link, 'SET NAMES utf8'); 
			$result = mysqli_query($link, $sql);
			$row = mysqli_fetch_row($result);
			$meta = mysqli_fetch_field($result);
			
			echo "<table border=0><tr>";
			$i = 0;
			while ( $meta = mysqli_fetch_field($result) ){
				echo "<td>".$meta->name."</td>";
				echo "<td>".$row[$i]."</td>";
				echo "</tr>";
				$i++;
			}
			
			echo "</table>";
			mysqli_free_result($result);  
			mysqli_close($link);  

		?>
		<p>
		<form method="post" action="index.php">
			<input type="submit" value="回查詢畫面"/>
		</form>
		<hr>
	</body>
</html>