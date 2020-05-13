<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" >
    <title> 練習10資料庫作業2 </title>
</head>

<body>
    <h3>資料庫管理系統-新增<h3>
    <hr>
    <br>
    <form name="info" method="post" action="addResult.php">
            客戶代號: <input type="text" name="cust_no" ><br>
            客戶姓名: <input type="text" name="name" ><br>
            統一編號: <input type="text" name="id" ><br>
            電話號碼: <input type="text" name="tel_no"><br>
            客戶地址: <input type="text" name="address"><br>
            <br>
            <input type="submit" value="新增">
            <br>
            <input type="reset" value="清除" >
    </form>
    <form name="info" method="post" action="home.php">
            <input type="submit" value="回主畫面" >
    </form>
    <hr>
</body>
<html>
