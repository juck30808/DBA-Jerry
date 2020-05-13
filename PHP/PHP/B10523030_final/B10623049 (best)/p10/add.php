<html>
<body>
<h1>資料庫管理系統-新增</h1>
<?php
if (isset($_POST['button'])){
	switch($_POST['button']){
			case '新增':
			$link=mysqli_connect('localhost','root','','customer');
			mysqli_query($link,"SET NAMES utf8");
			$sql="INSERT INTO `basic`(`cust_no`, `name`, `id`, `address`, `tel_no`) "
			."VALUES ('".$_POST['no']."','".$_POST['name']."','".$_POST['id']."','"
			.$_POST['address']."','".$_POST['tel_no']."')";
			
			
			$result=mysqli_query($link,$sql);
			if ( mysqli_errno($link) != 0 ) {
					echo "錯誤代碼: ".mysqli_errno($link)."<br/>";
					echo "錯誤訊息:".mysqli_error($link)."<br/>";
			}else{
				if ($result===TRUE){
					echo'!資料新增成功';
				}else{
					echo '!資料新增失敗';
				}
			
			}
			echo "<form method='post'>
					<input type='submit' name='button' value='回新增畫面'>
					<input type='submit' name='button' value='回主畫面'>
					</form>";
			mysqli_close($link);
			break;
			case '回主畫面':
			header("Location: home.php");
			break;
			case '回新增畫面':
			header("Location: add.php");
			break;
			
	}
}else{
	echo"<form method='post'>
		<table border='0'>
		<tr><td>客戶代號:</td><td><input type='text' name='no' size='15'></br></td></tr>
		<tr><td>姓名:</td><td><input type='text' name='name' size='15'></br></td></tr>
		<tr><td>統一編號:</td><td><input type='text' name='id' size='15'></br></td></tr>
		<tr><td>電話號碼:</td><td><input type='text' name='tel_no' size='15'></br></td></tr>
		<tr><td>地址:</td><td><input type='text' name='address' size='15'></br></td></tr>
		</table>
		<input type='submit' name='button' value='新增'>
		<input type='reset' name='button' value='清除'>
		<input type='submit' name='button' value='回主畫面'>
		</form>";
}
?>

</body>
</html>