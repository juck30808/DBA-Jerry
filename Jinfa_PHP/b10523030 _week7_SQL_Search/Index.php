<html>
	<head>
		<meta charset="utf-8" />
		<title>index</title>
		<?php
	        $mysqli = new mysqli('localhost', 'root', '') or die("連接失敗");
	        $dbname = "testdb";
	        if (!$mysqli->select_db($dbname))
	            die("無法開啟 $dbname 資料庫 <br>");
	        else
	            echo("開啟 $dbname 資料庫 成功!! <br>");
	        $mysqli->query("SET NAMES utf8");
    	?>
	</head>

	<body>
		<h1>資料庫管理系統</h1>
		<?php
			if (isset($_POST["Query"])) {
				session_start(); 
				$link = mysqli_connect("localhost","root","","testdb")or die("無法開啟MySQL資料庫連接!<br>");
				$sql = "SELECT * FROM users ";
				$sql.= " WHERE 編號 IN (". $_POST["No"] . ")";
				mysqli_query($link, 'SET NAMES utf8'); 

				$result = mysqli_query($link, $sql); 
				$_SESSION["sql"] = $sql;
				$_SESSION["No"] = $_POST["No"];
				if ( mysqli_fetch_row($result) == 0) { 
					header("Location: Error.php"); 		
				} 
				else { 
					header("Location: Successed.php");
				}
				mysqli_close($link);      // 關閉資料庫連接
			}
		?>
		<form method="post">
			<table border="0">
				<tr><td>編號</td>		
				<td><input type="text" name="No" size ="50"/></td>
				</tr>
			</table>
			<br>
			<input type="submit" name="Query" value="查詢"/>
			<input type="reset" value="清除">
		</form>
		<hr>
	</body>
</html>