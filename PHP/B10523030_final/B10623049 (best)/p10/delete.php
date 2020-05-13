<html>
<body>
<h1>資料庫管理系統-刪除</h1>
<?php
session_start();
if (isset($_POST['button'])){
	switch($_POST['button']){
		case '查詢':
			$_SESSION['no']=$_POST['no'];
			$link=mysqli_connect('localhost','root','','customer');
			mysqli_query($link,"SET NAMES utf8");
			$result=mysqli_query($link,"SELECT * FROM basic WHERE cust_no='".$_POST['no']."'");	
			if ( mysqli_errno($link) != 0 ) {
				echo "錯誤代碼: ".mysqli_errno($link)."<br/>";
				echo "錯誤訊息:".mysqli_error($link)."<br/>";
			}else{
				if (mysqli_num_rows($result)<=0){
					echo '客戶代號:'.$_POST['no'].'<br>';
					echo'!資料不存在!';
					echo "<form method='post'>
					<input type='reset' name='button' value='回刪除主畫面'>
					<input type='submit' name='button' value='回主畫面'>
					</form>";
				}else{
					while($row=mysqli_fetch_assoc($result)){
						echo '客戶代號:'.$row['cust_no']."<br/>";
						echo '姓名:'.$row['name']."<br/>";
						echo '統一編號:'.$row['id']."<br/>";
						echo '電話號碼:'.$row['tel_no']."<br/>";
						echo '地址:'.$row['address']."<br/>";
					}
					echo "是否真的要刪除?";
					echo "<form method='post'>
						<input type='submit' name='button' value='是'>
						<input type='submit' name='button' value='否'>
						</form>";
				}
			}
			break;
		case '回主畫面':
			header("Location: home.php");
			break;
		case '回刪除主畫面':
			header("Location: delete.php");
			break;
		case '是':
			header("Location:delete1.php");
			$_SESSION['delete']='是';
			break;
		case '否':
			header("Location:delete1.php");
			$_SESSION['delete']='否';
			break;
	}
}else{
	echo "<form method='post'>
		客戶代號:<input type='text' name='no' size='15'><br/>
		<input type='submit' name='button' value='查詢'>
		<input type='reset' name='button' value='清除'>
		<input type='submit' name='button' value='回主畫面'>
		</form>";
}
?>

<body>
</html>