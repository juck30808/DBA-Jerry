<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
</head>
<body>
<?php
if ( isset($_POST["Query"]) ) {
	$fun = $_POST["Query"];
	$oid = $_POST["oid"];
	$mid = $_POST["mid"];
	$mcn = $_POST["mcn"];
	$man = $_POST["man"];
	$odt = $_POST["odt"];
   // 取得SQL指令
   $sql = "INSERT INTO orderhistory (O_ID, M_ID, M_Count, M_Amount, 'Date') 
   VALUES ('".$oid ."','".$mid."','".$mcn."','".$man."','".$odt."')";
   
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

<hr><form action="index3.php">
<input type="submit" value="返回">
</form>

</body>
</html>