<?php
//這裡主要講session，關於登入資訊驗證，就不涉及到資料庫了
//接收登入資訊，儲存session
if(!empty($_POST['sub'])){

 if($_POST['id']=="9923701" && $_POST['username']=="黃一" && $_POST['pwd']=="1073299"){
  echo "登入成功";
  session_start();
  $_SESSION['username'] = $_POST['username'];
  header("Location: admin.php");
  exit();
 }if($_POST['id']=="9923702" && $_POST['username']=="吳二" && $_POST['pwd']=="2073299"){
  echo "登入成功";
  session_start();
  $_SESSION['username'] = $_POST['username'];
  header("Location: admin.php");
  exit();
 }else{
  header("Location: login.php?errno=1");
  exit();
 }
}else{
 header("Location: login.php?errno=2");
 exit();
}
?>