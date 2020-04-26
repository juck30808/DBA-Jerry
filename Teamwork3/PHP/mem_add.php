<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
</head>
<body>
<?php
if ( isset($_POST["Query"]) ) {
	$fun = $_POST["Query"];
	$mid = $_POST["mid"];
	$macc = $_POST["macc"];
	$mpw = $_POST["mpw"];
	$mna = $_POST["mna"];
	$madd = $_POST["madd"];
	$mbir = $_POST["mbir"];
	$mtel = $_POST["mtel"];
   // 取得SQL指令
   $sql = "INSERT INTO member (M_iD, account, password, M_name, M_address, birthday, M_tel) 
   VALUES ('".$mid ."','".$macc."','".$mpw."','".$mna."','".$madd."','".$mbir."','".$mtel."')";
   
   // 開啟MySQL的資料庫連接
   $link = @mysqli_connect("localhost", "root", "") or die("無法開啟MySQL資料庫連接!<br/>");
   mysqli_select_db($link, "teamwork3");  // 選擇myschool資料庫
   mysqli_query($link, 'SET NAMES utf8'); //送出UTF8編碼的MySQL指令
   
   // 執行SQL查詢
   if (mysqli_query($link, $sql)) {
    echo "新增成功!!"."</br>";
} else {
    echo "新增失敗!!"."<br>";
}
   
mysqli_close($link);
}


?>

<hr><form action="index.php">
<input type="submit" value="返回">
</form>

</body>
</html>