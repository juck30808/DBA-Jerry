<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
</head>
<body>
<?php
// 是否是表單送回
if ( isset($_POST["Query"]) ) {
   // 取得SQL指令
   $sql = "SELECT * FROM users WHERE NO = ".$_POST["Sql"];
   
   // 開啟MySQL的資料庫連接
   $link = @mysqli_connect("localhost", "root", "") 
         or die("無法開啟MySQL資料庫連接!<br/>");
   mysqli_select_db($link, "testdb");  // 選擇myschool資料庫
   //送出UTF8編碼的MySQL指令
   mysqli_query($link, 'SET NAMES utf8'); 
   // 執行SQL查詢
   $result = @mysqli_query($link, $sql); 
   echo "<table border='1'>
<tr>
<th>M_ID</th>
<th>Account</th>
<th>Password</th>
<th>M_Name</th>
<th>M_Address</th>
<th>Birthday</th>
<th>Tel</th>
</tr>";
   if ( $result->num_rows > 0 ) {
        while($row = $result->fetch_assoc()){
			
			echo "<hr>".$row["No"]."</br>".
				 $row["M_ID"]."</br>".
				 $row["Account"]."</br>".
				 $row["Password"]."</br>".
				 $row["M_Name"]."</br>".
				 $row["M_Address"]."</br>".
				 $row["Birthday"]."</br>".
				 $row["Tel"]."</br>";
		}
   }else { 
		echo "<h2>基本資料管理系統-查詢</h2>";
		echo "<hr>"."編號: ".$_POST["Sql"]."</br></br>";
		echo "<font color=\"RED\">!資料不存在!</font>"."</br>";
    
    
    
      
      
     
     mysqli_free_result($result);
   }
   mysqli_close($link); // 關閉資料庫連接
}
?>
</br>
<form action="sh.php">

<input type="submit" value="回查詢畫面">

</form>
<hr>
</body>
</html>