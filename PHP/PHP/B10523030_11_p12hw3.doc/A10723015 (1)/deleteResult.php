<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title> 練習10資料庫作業2 </title>
</head>

<body>
<h3>基本資料庫管理系統-刪除</h3>
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
    echo "<table border=0>";
    while ($row = mysqli_fetch_row($result)) {
        echo "<tr><td>".$tableName[0].": "."</td><td>" . $row[0] ."<br>". "</td></tr>";
        echo "<tr><td>".$tableName[1].": "."</td><td>" . $row[1] ."<br>". "</td></tr>";
        echo "<tr><td>".$tableName[2].": "."</td><td>" . $row[2] ."<br>". "</td></tr>";
        echo "<tr><td>".$tableName[3].": "."</td><td>" . $row[4] ."<br>". "</td></tr>";
        echo "<tr><td>".$tableName[4].": "."</td><td>" . $row[3] ."<br>". "</td></tr>";
        
    }

    echo "</table>";
    echo "<font color='red'>是否真的要刪除?</font>";
    echo "<form name='info' method='post' action='deleteornot.php'>";
    echo "    <input type='hidden' name='cust_no' value =".$cust_no.">";
    echo "    <input type='submit' name='yes' value='是' >";
    echo "</form>";
    echo "<form name='info' method='post' action='deleteornot.php'>";
    echo "    <input type='submit' name='no' value='否' >";
    echo "</form>";

    $result->close();    // 釋放佔用的記憶體  

    mysqli_close($link);  // 關閉資料庫連接
}
else{
    echo "客戶代號:". $cust_no;
    echo "<br />";
    echo "<br />";
    echo "<font color='red'>!資料不存在!</font> <br />";
    echo "<br />";
    echo "<form name='info' method='post' action='delete.php'>";
    echo "    <input type='submit' value='回刪除主畫面' >";
    echo "</form>";
    echo "<form name='info' method='post' action='home.php'>";
    echo "    <input type='submit' value='主畫面' />";
    echo "</form>";
}


?>
<hr>
</body>
</html>