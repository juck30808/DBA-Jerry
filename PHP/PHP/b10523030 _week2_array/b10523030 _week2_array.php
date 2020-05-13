<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Ch7_2_1.php</title>
</head>
<body>
<?php
//二維陣列
$row0 = array("王一",90,100,80); 
$row1 = array("張二",80,85,90);
$row2 = array("Ray",80,65,90);
$row3 = array("KiKi",60,85,80);
$data = array("王一","張二","Ray","KiKi");

//input 數值
$key = array_search("張二", $data);

echo "姓名：$row1[0] <br/>";
echo "國文：$row1[1] <br/>";
echo "英文：$row1[2] <br/>";
echo "數學：$row1[3] <br/>";
$sum = 0;
$avg = 0;
for ($k=1; $k < count($row1); $k++){
  $sum += $row1[$k];
}
echo "總分：$sum <br/>";
$avg = $sum /3 ;
echo "平均：$avg <br/>";

echo "<br/>";

$key = array_search("Lin", $data);

echo "姓名：Lin <br/>";
echo "! 學生不存在 !";

?>
</body>
</html>