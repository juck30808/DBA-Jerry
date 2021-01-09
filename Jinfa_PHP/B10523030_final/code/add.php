<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title> 學生成績管理系統 </title>
</head>

<body>
    <h3>學生成績管理系統-新增</h3>
    <hr>

    <?php
    if (isset($_POST['button'])){
    switch($_POST['button']){
            case '新增':

            $link=mysqli_connect('localhost','root','root','class');
            mysqli_query($link,"SET NAMES utf8");
            $sql="INSERT INTO `score`(`no1`, `name1`, `exam`, `homework`, `project`) "
            ."VALUES ('".$_POST['no1']."','".$_POST['name1']."','".$_POST['exam']."','"
            .$_POST['homework']."','".$_POST['project']."')";
            
            
            $result=mysqli_query($link,$sql);
            if ( mysqli_errno($link) != 0 ) {
                    //echo "錯誤代碼: ".mysqli_errno($link)."<br/>";
                    echo '!資料新增失敗<br/>';
                    echo "錯誤訊息:".mysqli_error($link)."<br/>";
            }else{
                if ($result===TRUE){
                    echo'!資料新增成功';
                }else{
                    echo '!資料新增失敗';
                }
            
            }
            echo "<form method='post'>
                    <input type='submit' name='button' value='回新增畫面'>
                    <input type='submit' name='button' value='回主畫面'>
                    </form>";
            mysqli_close($link);
            break;
            case '回主畫面':
            header("Location: home.php");
            break;
            case '回新增畫面':
            header("Location: add.php");
            break;
            
    }
}else{
    echo"<form method='post'>
        <table border='0'>
        <tr><td>學號:</td><td><input type='text' name='no1'></br></td></tr>
        <tr><td>姓名:</td><td><input type='text' name='name1'></br></td></tr>
        <tr><td>考試成績:</td><td><input type='text' name='exam'></br></td></tr>
        <tr><td>作業成績:</td><td><input type='text' name='homework'></br></td></tr>
        <tr><td>專題成績:</td><td><input type='text' name='project'></br></td></tr>
        </table>
        <input type='submit' name='button' value='新增'>
        <input type='reset' name='button' value='清除'>
        <input type='submit' name='button' value='回主畫面'>
        </form>";
}
?>


<hr>


<body>
<html>
