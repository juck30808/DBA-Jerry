<?php
session_start();
if(empty($_SESSION['username'])){
 header("Location: login.php?errno=3");
 exit();
}
echo '登入成功<br><br>';
echo '學號：9823708<br>';
echo '姓名：王一<br>';
echo '<br>';  
echo "!系統登入成功!";
?>