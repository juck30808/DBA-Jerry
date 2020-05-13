<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title> 練習10資料庫作業2 </title>
</head>

<body>
    <h3>資料庫管理系統-修改</h3>
    <hr>
    <?php
$cust_no = $_POST["cust_no"];
$name = $_POST["name"];
$id = $_POST["id"];
$tel_no = $_POST["tel_no"];
$address = $_POST["address"];

$link = mysqli_connect("localhost","root","","customer")
or die("無法開啟MySQL資料庫連接!<br>");
$sql = "UPDATE `basic` SET name=".$name.", id=".$id.", tel_no=".$tel_no.", address=".$address." WHERE cust_no=".$cust_no; 
mysqli_query($link, 'SET NAMES utf8');

    
if($result = mysqli_query($link,$sql)){
    echo "<br>
    !資料修改成功!
    <br/>";
}else{
    echo "<br>
    <font color='red'>!資料修改失敗!</font>
    <br/>";
}
    echo "<form name='info' method='post' action='modify.php'>";
    echo "        <input type='submit' value='回修改主畫面' />   ";    
    echo "</form>";
    echo "<form name='info' method='post' action='home.php'>";
    echo "         <input type='submit' value='回主畫面' />";
    echo " </form>";
?>
<hr>
<body>
<html>
