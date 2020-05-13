<?php
	session_start();

	if(!empty($_SESSION['id'])){
		echo '登入成功<br>';
		echo '<br>帳號:';
		echo $_SESSION['id'];
		echo '<br><br>';  
		session_destroy();
	}else{
	 header("Location: login.php?errno=3");
	 exit();
	}
?>

<form action="login.php" method="post">
	<input type="submit" name="bacl" value="登出">
</form>
