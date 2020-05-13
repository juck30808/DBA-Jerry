<?php
    header("Content-Type:text/html;charset=utf-8");
    if($_POST['acc'] =="9923701"){
        if($_POST['acc'] == "1073299"){
            echo "登入成功";
        } else {
            echo "密碼錯誤";
        }
    }else if($_POST['acc'] == "9923702"){
        if($_POST['pas'] == "2073299"){
            echo "登入成功";
        }else {
            echo "密碼錯誤";
        }
    }else{
        echo "密碼錯誤";
    }
?>