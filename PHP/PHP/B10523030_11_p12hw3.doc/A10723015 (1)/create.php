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
            客戶代號: <input type="text" name="cust_no" size="15" /><br />
            姓名: <input type="text" name="name" size="15" /><br />
            統一編號: <input type="text" name="id" size="15" /><br />
            電話號碼: <input type="text" name="tel_no" size="15" /><br />
            地址: <input type="text" name="address" size="25" /><br />
            <input type="submit" value="新增" />
            <input type="reset" value="清除" />
    </form>
    <form name="info" method="post" action="home.php">
            <input type="submit" value="回主畫面" />
    </form>
    <hr>
<body>
<html>
