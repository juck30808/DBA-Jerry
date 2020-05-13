<?php
	echo '使用者：';
	echo $_POST['id'];
	echo '<br><br>';
  	if(!isset($_COOKIE['com'])){
	     setcookie('com',0,time()+604800);
	}else{
	    $com=$_COOKIE['com']+1;
	    setcookie('com',$com,time()+604800);
	   	echo "使用次數：",$com;
	}
	echo '<br><br>';
	echo '使用時間：';
	echo date("Y-m-d H:i:s");
	echo '<br><br>';

	$str = $_POST['id'];
	$str2 = ',';
	$str3 = $com;
	$str4 = ' ';
	$str5 = date("Y-m-d H:i:s");
	$str6 = "\n";
    $file = fopen("file3-out.txt","a+"); //開啟檔案
    fwrite($file,$str);
    fwrite($file,$str2);
    fwrite($file,$str3);
    fwrite($file,$str4);
    fwrite($file,$str5);
    fwrite($file,$str6);
    fclose($file);


    
?>

<form action="login.php" method="post">
	<input type="submit" name="bacl" value="回輸入畫面">
</form>
