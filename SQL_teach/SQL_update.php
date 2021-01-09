<?php
$con=mysqli_connect("localhost","root","root","myDB");
// 检测连接
if (mysqli_connect_errno())
{
    echo "连接失败: " . mysqli_connect_error();
}

mysqli_query($con,"UPDATE MyGuests SET email='xxx@yuntech.edu.tw'
WHERE firstname='John' AND lastname='Doe'");

mysqli_close($con);
?>