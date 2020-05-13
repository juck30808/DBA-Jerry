<html>
<body>
<h1>資料庫管理系統-查詢</h1>
<?php
	if (isset($_POST['button'])){
		switch($_POST['button']){
			case '查詢':
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
					}else{
						while($row=mysqli_fetch_assoc($result)){
							echo '客戶代號:'.$row['cust_no']."<br/>";
							echo '姓名:'.$row['name']."<br/>";
							echo '統一編號:'.$row['id']."<br/>";
							echo '電話號碼:'.$row['tel_no']."<br/>";
							echo '地址:'.$row['address']."<br/>";
						}
					}
					echo "<form method='post'>
							<input type='submit' name='button' value='回查詢畫面'>
							<input type='submit' name='button' value='回主畫面'>
							</form>";
				}
				mysqli_close($link);
			break;
			case '回主畫面':
			header("Location: home.php");
			break;
			case '回查詢畫面':
			header("Location: select.php");
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



</body>
</html>