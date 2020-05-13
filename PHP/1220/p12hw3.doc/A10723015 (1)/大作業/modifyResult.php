<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title> 練習10資料庫作業2 </title>
</head>

<body>
<h3>基本資料庫管理系統-修改</h3>
<hr>

<?php
$cust_no = $_POST["cust_no"];
 // 建立MySQL的資料庫連接 
$link = mysqli_connect("localhost","root","","customer")
or die("無法開啟MySQL資料庫連接!<br>");
$sql = "SELECT * FROM `basic` WHERE $cust_no = cust_no"; 
mysqli_query($link, 'SET NAMES utf8');
$result = mysqli_query($link,$sql);
$total_records = mysqli_num_rows($result);
if($total_records!=0){
    // 顯示每一筆記錄
    $tableName = array("客戶代號","姓名","統一編號","電話號碼","地址",);
    // 一筆一筆的以表格顯示記錄
    echo"<form name='info' method='post' action='modifyUpdate.php'>";
    echo "<table border=0>";
    while ($row = mysqli_fetch_row($result)) {
        echo "<tr><td>".$tableName[0].": "."</td><td>" . $row[0] ."<br>". "</td></tr>";
        echo "<tr><td>".$tableName[1].": "."</td><td>" . "<input type='text' name='name' size='15' value =".$row[1].">" . "</td></tr>";
        echo "<tr><td>".$tableName[2].": "."</td><td>" . "<input type='text' name='id' size='15' value =".$row[2].">" . "</td></tr>";
        echo "<tr><td>".$tableName[3].": "."</td><td>" . "<input type='text' name='tel_no' size='15' value =".$row[4].">" . "</td></tr>";
        echo "<tr><td>".$tableName[4].": "."</td><td>" . "<input type='text' name='address' size='25' value =".$row[3].">" . "</td></tr>";
        echo "<input type='hidden' name='cust_no' value =".$row[0].">";
    }

    echo "</table>";

    $result->close();    // 釋放佔用的記憶體  

    //    mysqli_free_result($result); // 釋放佔用記憶體 

    mysqli_close($link);  // 關閉資料庫連接
    
    echo"    <input type='submit' value='修改' >";
    echo "</form>";
}
else{
    echo "客戶代號:". $cust_no;
    echo "<br />";
    echo "<br />";
    echo "<font color='red'>!資料不存在! <br /></font>";
    
    echo "<br />";  
}
echo"<form name='info' method='post' action='modify.php'>";
echo"    <input type='submit' value='回修改畫面' >";
echo "</form>";
echo"<form name='info' method='post' action='home.php'>";
echo"    <input type='submit' value='主畫面' />";
echo "</form>";
?>
<hr>
</body>
</html>