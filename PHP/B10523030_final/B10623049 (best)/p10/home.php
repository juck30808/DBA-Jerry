<html>
<body>
<h1>資料庫管理系統</h1>
<?php
	if (isset($_POST['button'])){
		switch($_POST['button']){
			case '查詢':
			header("Location: select.php");
			break;
			case '新增':
			header("Location: add.php");
			break;
			case '修改':
			header("Location: update.php");
			break;
			case '刪除':
			header("Location: delete.php");
			break;
		}
		
	}

?>
<form method='post' >
1.<input type='submit' name='button' value='查詢'></br>
2.<input type='submit' name='button' value='新增'></br>
3.<input type='submit' name='button' value='修改'></br>
4.<input type='submit' name='button' value='刪除'></br>
</form>
</body>
</html>