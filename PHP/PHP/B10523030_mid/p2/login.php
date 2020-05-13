<h2>登入系統</h2>

<!---login system--->
<form action="loginProcess.php" method="post">
	帳號：<input type="text" name="id"><br/>
	密碼：<input type="password" name="pwd"><br/>
	<input type="submit" name="sub" value="登入">
	<input type="submit" name="cc" value="清除">
</form>

<?php
if(!empty($_GET['errno'])){
 if($_GET['errno']==1){
  echo "!登入成功!";
 }else if($_GET['errno']==2){
  echo "登入失敗";
 }else if($_GET['errno']==3){
  echo "非法訪問，請輸入使用者名稱和密碼";
 }
}
?>