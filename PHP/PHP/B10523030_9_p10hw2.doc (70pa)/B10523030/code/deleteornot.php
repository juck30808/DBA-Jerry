<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" >
    <title> 練習10資料庫作業2 </title>
</head>

<body>
    <h3>資料庫管理系統-刪除</h3>
    <hr>
    <?php


    $link = mysqli_connect("localhost","root","","customer")
    or die("無法開啟MySQL資料庫連接!<br>");
    if(isset($_POST["yes"])){
        $cust_no = $_POST["cust_no"];
        $sql = "DELETE FROM `basic` WHERE `cust_no` = ".$cust_no; 
        mysqli_query($link, 'SET NAMES utf8');
        if($result = mysqli_query($link,$sql)){
            echo "<br>
            !資料刪除成功!
            <br>";
        }else{
            echo "<br>
            <font color='red'>!資料刪除失敗!</font>
            <br>";
        }
    }
    if(isset($_POST["no"])){
        echo "<br>
        !資料沒有刪除!
        <br>";
    }
        echo "<form name='info' method='post' action='delete.php'>";
        echo "        <input type='submit' value='回刪除畫面' >   ";    
        echo "</form>";
        echo "<form name='info' method='post' action='home.php'>";
        echo "         <input type='submit' value='回主畫面' >";
        echo " </form>";
?>
<hr>
</body>
<html>
