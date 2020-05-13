<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title> 練習10資料庫作業2 </title>
</head>

<body>
<h3>基本資料庫管理系統-查詢</h3>
<hr>

<?php
if(isset($_POST["home"]))
header("Location: home.php");
elseif(isset($_POST["select"]))
header("Location: select.php");
else{
    $cust_no = $_POST["cust_no"];
    // 建立MySQL的資料庫連接 
    $link = mysqli_connect("localhost","root","","customer")
    or die("無法開啟MySQL資料庫連接!<br>");
    $sql = "SELECT * FROM `basic` WHERE '$cust_no' = cust_no"; 
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

        $result->close();    // 釋放佔用的記憶體  

        mysqli_close($link);// 關閉資料庫連接
        echo "<br />";
    }
    else{
        echo "客戶代號:". $cust_no;
        echo "<br />";
        echo "<br />";
        echo "<font color='red'>!資料不存在!</font> <br />";
        echo "<br />";  
    }
    echo "<form name='info' method='post' action='selectResult.php'>";
    echo "    <input type='submit' name='select' value='回查詢畫面' >";

    echo "    <input type='submit' name='home' value='回主畫面' />";
    echo "</form>";
}
?>
<hr>
</body>
</html>