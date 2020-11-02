<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
</head>
<body>

 <h2 class="major">Add</h2>  
                  
    
  <form method="post" action="index.php">
    <h3>Account:<input type="text" name="account"><br/>
    <h3>Password:<input type="text" name="password"><br/>
    <h3>M_Name:<input type="text" name="name"><br/>
    <h3>M_Address:<input type="text" name="address"><br/>
    <h3>Birthday:<input type="text" name="birthday"><br/>
    <h3>Tel:<input type="text" name="tel"><br/>
    <input type="submit" name="Query" value="新增">
    <input type="reset" name="Query" value="清除">
  </form>

<?php
if ( isset($_POST["Query"]) ) {
  //require('index.php');
  
  // 開啟MySQL的資料庫連接
  $link = @mysqli_connect("localhost", "root", "") 
        or die("無法開啟MySQL資料庫連接!<br/>");
  mysqli_select_db($link, "teamwork3");  // 選擇myschool資料庫
  mysqli_query($link, 'SET NAMES utf8');    //送出UTF8編碼的MySQL指令

  //if (mysqli_query($link, $sql)) {    // 執行SQL查詢
  //  echo "新增成功!!"."</br>";
  //} else {
  //  echo "Error: " . $sql . "<br>" . mysqli_error($link);
  //} 


 // 執行SQL查詢


  $result = @mysqli_query($link, $sql1);
  $count=mysqli_num_rows($result);//先算出有幾筆資料（ＲＯＷ）
  
  $fun = $_POST["Query"];
  $mid= $count+1;
  $macc=$_POST["account"];
  $mpw=$_POST['password'];
  $mna=$_POST['name'];
  $madd=$_POST['address'];
  $mbir=$_POST['birthday'];
  $mtel=$_POST['tel'];
	
   // 取得SQL指令
   $sql = "INSERT INTO member (M_ID, account, password, M_name, M_address, birthday, M_tel) 
   VALUES ('".$mid ."','".$macc."','".$mpw."','".$mna."','".$madd."','".$mbir."','".$mtel."')";
   
  mysqli_query($link,$sql); //執行sql語法
  mysqli_close($link);


}
?>

<hr><form action="index.php">
<input type="submit" value="返回">
</form>

</body>
</html>