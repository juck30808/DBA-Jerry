<html>
<body>
<?php
	if (isset($_POST['button'])){
	switch($_POST['button']){
		case '回修改畫面':
		header("Location:update.php");
		break;
		case '回主畫面':
		header("Location:home.php");
		break;
	
	}
	}
	session_start();
	$link=mysqli_connect('localhost','root','','class');
	mysqli_query($link,"SET NAMES utf8");
	$sql="UPDATE `score` SET `name1`='".$_SESSION['name1']."',`exam`='".$_SESSION['exam']."',`homework`='".$_SESSION['homework']."',`project`='".$_SESSION['project']."' WHERE no1='".$_SESSION['no1']."'";	
			
			$result=mysqli_query($link,$sql);
			if ( mysqli_errno($link) != 0 ) {
					echo "錯誤代碼: ".mysqli_errno($link)."<br/>";
					echo "錯誤訊息:".mysqli_error($link)."<br/>";
			}else{
				if ($result===TRUE){
					echo'!資料修改成功!';
				}else{
					echo '!資料修改失敗';
				}
			
			}
			echo "<form method='post'>
					<input type='submit' name='button' value='回修改畫面'>
					<input type='submit' name='button' value='回主畫面'>
					</form>";
			mysqli_close($link);
			session_destroy();
?>
</body>
</html>