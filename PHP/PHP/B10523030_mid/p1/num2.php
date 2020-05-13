<h2>基本資料</h2>

<?php
    //$POST抓取 sub 表單的 'id'值 & 'pwd'值 
  	echo '<br>姓名：';
	echo $_POST['name'];
	echo '<br><br>年齡：';
	echo $_POST['age'];
	echo '<br><br>性別：';
	echo $_POST['sex'];
	echo '<br><br>出生地：';
	echo $_POST['place'];
	echo '<br><br>就業情況：';
	echo $_POST['career'];

	echo '<br><br>健身方法：';
	echo implode (',', $_POST ['sport']);

	echo '<br><br>興趣：';
	echo $_POST['habby'];
	echo '<br><br>補充說明：<br>';
	echo $_POST['more'];

?>