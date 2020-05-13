<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title> 練習10資料庫作業2 </title>
</head>

<body>
    <h3>資料庫管理系統-新增</h3>
    <hr>
    <form name="info" method="post" action="createResult.php">
        <table border=0>
            <tr><td>客戶代號:</td><td> <input type="text" name="cust_no" size="15" /></td></tr>
            <tr><td>姓名:</td><td> <input type="text" name="name" size="15" /></td></tr>
            <tr><td>統一編號:</td><td> <input type="text" name="id" size="15" /></td></tr>
            <tr><td>電話號碼:</td><td> <input type="text" name="tel_no" size="15" /></td></tr>
            <tr><td>地址:</td><td> <input type="text" name="address" size="25" /></td></tr>
        </table>
            <br />
            <input type="submit" value="新增" />
            <input type="reset" value="清除" />
  

            <input type="submit" name='home' value="回主畫面" />
    </form>
    <hr>
<body>
<html>
