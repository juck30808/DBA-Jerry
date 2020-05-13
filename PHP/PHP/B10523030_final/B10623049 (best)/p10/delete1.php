<html>
<body>
<h1>資料庫管理系統-刪除</h1>
<?php
	if (isset($_POST['button'])){
	switch($_POST['button']){
		case '回刪除畫面':
		header("Location:delete.php");
		break;
		case '回主畫面':
		header("Location:home.php");
		break;
	}
	}
	session_start();
	if ($_SESSION['delete']=='是'){
		$link=mysqli_connect('localhost','root','','customer');
		mysqli_query($link,"SET NAMES utf8");
		$sql="DELETE FROM `basic` WHERE cust_no='".$_SESSION['no']."'";
		$result=mysqli_query($link,$sql);
		if ($result===TRUE){
			echo '!資料刪除成功!';
		}else{
			echo '!資料刪除失敗!';
		}
		mysqli_close($link);
	}else{
		echo '!資料沒有刪除!';
		
	}
	echo"<form method='post'>
		<input type='submit' name='button' value='回刪除畫面'>
		<input type='submit' name='button' value='回主畫面'>
		</form>";
?>

</body>
</html>