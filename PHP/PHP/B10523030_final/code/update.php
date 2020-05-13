<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title> 學生成績管理系統 </title>
</head>

<body>
<h3>學生成績管理系統-修改</h3>
<hr>

<?php
session_start();
if (isset($_POST['button'])){
	switch($_POST['button']){
			case '查詢':	
				$_SESSION['no1']=$_POST['no1'];
				$link=mysqli_connect('localhost','root','','class');
				mysqli_query($link,"SET NAMES utf8");
				$result=mysqli_query($link,"SELECT no1 FROM score WHERE no1='".$_POST['no1']."'");	

					if (mysqli_num_rows($result)<=0){
						echo '學號:'.$_POST['no1'].'<br>';
						echo'!資料不存在!';
						echo "<form method='post'>
						<input type='reset' name='button' value='回修改主畫面'>
						<input type='submit' name='button' value='回主畫面'>
							</form>";
					}else{
						while($row=mysqli_fetch_assoc($result)){
							echo '學號:'.$row['no1']."<br/>";
						}
						echo "<form method='post'>
							<table border='0'>
							<tr><td>姓名:</td><td><input type='text' name='name1'></br></td></tr>
							<tr><td>考試成績:</td><td><input type='text' name='exam'></br></td></tr>
							<tr><td>作業成績:</td><td><input type='text' name='homework'></br></td></tr>
							<tr><td>專題成績:</td><td><input type='text' name='project'></br></td></tr>
							</table>
							<input type='submit' name='button' value='修改'>
							<input type='reset' name='button' value='回修改主畫面'>
							<input type='submit' name='button' value='回主畫面'>
							</form>";
					}
				
				mysqli_close($link);
				break;
				case '修改':
				header("Location:update1.php");
				$_SESSION['exam']=$_POST['exam'];
				$_SESSION['project']=$_POST['project'];
				$_SESSION['homework']=$_POST['homework'];
				$_SESSION['name1']=$_POST['name1'];
				break;
				case '回主畫面':
				header("Location: home.php");
				break;
				case '回修改主畫面':
				header("Location: update.php");
				break;
				
			
	}
}else{
	echo "<form method='post'>
		學號:<input type='text' name='no1'><br/>
		<input type='submit' name='button' value='查詢'>
		<input type='reset' name='button' value='清除'>
		<input type='submit' name='button' value='回主畫面'>
		</form>";
}
	?>
	<hr>
</body>
</html>