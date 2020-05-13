<h3>非同步訊息</h3>

 <?php 
	if ($_POST["no"]=="9923701"||$_POST["no"]=="9923702"){
		if($_POST["no"]=="9923701"&&$_POST["name"]=="1073299"){
			?>訊息欄:<INPUT TYPE="text" NAME="name" value = "登入成功"><?php
		}else if($_POST["no"]=="9923702"&&$_POST["name"]=="2073299"){
			?>訊息欄:<INPUT TYPE="text" NAME="name" value = "登入成功"><?php
		}else{
			?>訊息欄:<INPUT TYPE="text" NAME="name" value = "密碼錯誤"><?php
		}
	}else{
		?>訊息欄:<INPUT TYPE="text" NAME="name" value = "帳號錯誤"><?php
	}
	?>
	<br>
	<p>