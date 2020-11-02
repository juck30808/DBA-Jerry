<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
</head>
<body>
<?php
if ( isset($_POST["Query"]) ) {
	$fun = $_POST["Query"];
	$bid = $_POST["bid"];
	$bna = $_POST["bna"];
	$pid = $_POST["pid"];
	$bpr = $_POST["bpr"];
	$bISBN = $_POST["bISBN"];
	$bar = $_POST["bar"];
   // 取得SQL指令
   $sql = "INSERT INTO book (B_ID, B_name, P_ID, Price, ISBN, Author) 
   VALUES ('".$bid ."','".$bna."','".$pid."','".$bpr."','".$bISBN."','".$bar."')";
   
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

<hr><form action="index2.php">
<input type="submit" value="返回">
</form>

</body>
</html>