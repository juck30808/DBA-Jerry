<html>
	<head>
		<meta charset="utf-8" />
		<title>Error</title>
	</head>
	<body>
		<?php
			session_start();
			$No = $_SESSION["No"];
		?>
		<h1>資料庫管理系統</h1>
		<hr>
		編號：<?php echo $No ?>
		<p><p>
		<font color="red">!資料不存在!</font>
		<form method="post" action="index.php">
			<input type="submit" value="回查詢畫面"/>
		</form>
		<hr>
	</body>
</html>