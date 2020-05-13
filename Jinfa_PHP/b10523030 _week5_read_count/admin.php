<?php
	session_start();
	ob_start();
  
	setcookie("count","0");
	$i=@($_COOKIE[";count"]);
	$i++;
	setcookie("count",$i,time()+60);
	//請記住 session_start() 一定要放在網頁的最上方

	//$_SESSION['num'] = 10;	//num = 10 存在伺服器
	//echo $_SESSION['num'] 	//取得 session
	//unset($_SESSION['num'])	//清除 session
	
	// 如果 $_SESSION 伺服器沒有資料 = 未輸入 
	

	if(!empty($_SESSION['id'])){

		echo '學生成績<br>';
		echo '<br>學號:';
		echo $_SESSION['id'];
		echo '<br>登入次數:';
		echo $i;
		echo '<br>國文::';
		echo $_SESSION['num1'];
		echo '<br>英文:';
		echo $_SESSION['num2'];
		echo '<br>數學:';
		echo $_SESSION['num3'];
		echo '<br>平均:';
		echo ($_SESSION['num3']+$_SESSION['num2']+$_SESSION['num1'])/3  ;



		echo '<br><br>';  
		echo "!系統登入成功!";


	}else{
	 	header("Location: login.php?errno=3"); //"非法訪問";
		exit();	
	}

?>

<form action="login.php" method="post">
	<input type="submit" name="bacl" value="回登入畫面">
</form>
