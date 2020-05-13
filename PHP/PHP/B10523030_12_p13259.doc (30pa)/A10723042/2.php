<?php
$account = $_POST["account"];
$password  = $_POST["password"];

if (($account == 9923701 && $password == 1073299) || ($account == 9923702 && $password == 2073299)){ 
	echo "訊息欄：<input type='text' value='登入成功'></input>";
}elseif(($account == 9923701) || ($account == 9923702)){
	echo "訊息欄：<input type='text' value='密碼錯誤'></input>";
}elseif(($password == 1073299) || ($password == 2073299)){
	echo "訊息欄：<input type='text' value='帳號錯誤'></input>";
}else{
	echo "訊息欄：<input type='text' value='請輸入帳號密碼'></input>";
}	

?>