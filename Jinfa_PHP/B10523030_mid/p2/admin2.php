<?php
	session_start();

	if(!empty($_SESSION['id'])){
		echo '登入失敗<br>';
		echo '<br>帳號:';
		echo $_SESSION['id'];
		echo '<br><br>';  
		echo '訊息：！密碼錯誤！<br>';
		session_destroy();
	}else{
	 header("Location: login.php?errno=3");
	 exit();
	}
		

?>

<form action="login.php" method="post">
	<input type="submit" name="bacl" value="重新登入">
</form>
