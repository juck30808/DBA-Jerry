<!DOCTYPE html>
<html lang = "en">
<head>
<meta charset = "UTF-8">
<title>hw2</title>
<?php
$link = @odbc_connect("localhost", "root", "") or die("無法開啟Access資料庫連接!<br/>");
odbc_connect($link, "testdb");
odbc_exec($link, 'SET NAMES utf8');
$num = $_POST["Access"];
$sql = "SELECT * from users WHERE no = $num";
?>
</head>

<body>
<center>
<h2>基本資料管理系統-查詢</h2>
<hr>	
<?php        
$result = @odbc_exec($link, $sql);
if ($link->errno != 0) { 
    echo "錯誤代碼: $link->errno <br>";
    echo "錯誤訊息: $link->error <br>";
}
else {                        
    $a_1 = [];
    $a_2 = [];
    
    echo "<table border=0>";
			
    while ($meta = odbc_field_name($result)) {
        array_push($a_1, $meta->name);
    }

    while ($row = odbc_fetch_array($result, MYSQLI_NUM)){
        array_push($a_2, $row);
    }

    if (empty($a_2)) {
        echo "編號: $num <br><br>";
        echo "<font color='red'>!資料不存在!</font>";
    }else {
        for ($i = 1; $i < count($a_1); $i++) {
            echo "<tr>
                <td>" . $a_1[$i] . "</td>
                <td>" . $a_2[0][$i] . "</td>
            </tr>";
        }
    }
    echo "</table>";
}
odbc_close($link);
?>

<br><br>
<form action="hw1.php">
<button type="submit">回查詢畫面</button>
</form>
<hr>

</body>
</html>