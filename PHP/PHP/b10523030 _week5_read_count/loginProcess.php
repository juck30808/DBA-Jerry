<?php
  //這裡主要講session，關於登入資訊驗證，就不涉及到資料庫了
  //接收登入資訊，儲存session

  //from login.php
  //empty() 是判斷給定空值為 true，$POST 則用來儲存登入值，取得 sub 表單
  session_start();
  
  if(!empty($_POST['sub'])){  

    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="9623001" && $_POST['pwd']=="pwd001"){

      //符合資料顯示登入成功
      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      $_SESSION['id'] = $_POST['id'];
      $_SESSION['num1'] = '80';
      $_SESSION['num2'] = '85';
      $_SESSION['num3'] = '78';
      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: login.php?errno=1"); //系統登入失敗
      exit();
    }


    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="9623002" && $_POST['pwd']=="pwd002"){

      //符合資料顯示登入成功
      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      $_SESSION['id'] = $_POST['id'];
      $_SESSION['num1'] = '100';
      $_SESSION['num2'] = '80';
      $_SESSION['num3'] = '90';
      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: login.php?errno=1"); //系統登入失敗
      exit();
    }

    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="9623003" && $_POST['pwd']=="pwd003"){

      //符合資料顯示登入成功
      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      $_SESSION['id'] = $_POST['id'];
      $_SESSION['num1'] = '60';
      $_SESSION['num2'] = '55';
      $_SESSION['num3'] = '78';


      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: login.php?errno=1"); //系統登入失敗
      exit();
    }

    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="9623004" && $_POST['pwd']=="pwd004"){

      //符合資料顯示登入成功
      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      $_SESSION['id'] = $_POST['id'];
      $_SESSION['num1'] = '90';
      $_SESSION['num2'] = '80';
      $_SESSION['num3'] = '86';


      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: login.php?errno=1"); //系統登入失敗
      exit();
    }

    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
    if($_POST['id']=="9623005" && $_POST['pwd']=="pwd005"){

      //符合資料顯示登入成功
      echo "登入成功";
      //使用 SESSION 儲存至伺服器端
      $_SESSION['id'] = $_POST['id'];
      $_SESSION['num1'] = '90';
      $_SESSION['num2'] = '85';
      $_SESSION['num3'] = '80';

      //登入成功後，進入admin.php
      header("Location: admin.php"); 
      exit();
    }else{
      header("Location: login.php?errno=1"); //系統登入失敗
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