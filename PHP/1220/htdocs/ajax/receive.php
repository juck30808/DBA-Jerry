<?php
$strName = $_POST["account"];
$strpwd  = $_POST["passwd"];

if (($strName == 9923701 && $strpwd == 1073299) || ($strName == 9923702 && $strpwd == 2073299)){ 
	echo "訊息欄：<input type='text' value='登入成功'></input>";
}elseif(($strName == 9923701) || ($strName == 9923702)){
	echo "訊息欄：<input type='text' value='密碼錯誤'></input>";
}elseif(($strpwd == 1073299) || ($strpwd == 2073299)){
	echo "訊息欄：<input type='text' value='帳號錯誤'></input>";
}else{
	echo "訊息欄：<input type='text' value='請輸入帳號密碼'></input>";
}	

?>