<?php
  session_start();
  $_SESSION['id'] = $_POST['id'];
  if(!empty($_POST['sub'])){  

    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="A10823701" && $_POST['pwd']=="pwd1"){
      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      
      
      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: admin2.php"); //系統登入失敗
      exit();
    }


    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="A10823702" && $_POST['pwd']=="pwd2"){

      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      
      
      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: admin2.php"); //系統登入失敗
      exit();
    }

    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="A10823703" && $_POST['pwd']=="pwd3"){

      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      
      
      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: admin2.php"); //系統登入失敗
      exit();
    }

    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="B10823704" && $_POST['pwd']=="pwdB108237054"){

      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      
      
      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: admin2.php"); //系統登入失敗
      exit();
    }

    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="B10823705" && $_POST['pwd']=="pwd5"){

      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      
      
      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: admin2.php"); //系統登入失敗
      exit();
    }
    //------------------------------------------------------------
  }else{
     header("Location: login.php?errno=2"); //請輸入使用者名稱密碼"
     exit(); 
  }
?>

<form action="login.php" method="post">
  <input type="submit" name="bacl" value="回登入畫面">
</form>