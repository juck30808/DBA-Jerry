<h2>基本資料</h2>

<!---login system--->
<form action="num2.php" method="post">
	姓名：<input type="text" name="name"><br/>
	年齡：<input type="text" name="age"><br/>
	性別：<input type="radio" name="sex" value="男">男
			<input type="radio" name="sex" value="女">女<br/>
	出生地：<input type="radio" name="place" value="台灣本島">台灣本島
			<input type="radio" name="place" value="外島">外島<br/>
	就業情況：<select name="career">
		　<option value="在職中">在職中</option>
		　<option value="謀職中">謀職中</option>
		　<option value="學生">學生</option>
		　<option value="其他">其他</option>
	</select><br/>
	健身方法：
	<input type="checkbox" name="sport[]" value="快走">快走
	<input type="checkbox" name="sport[]" value="跑步">跑步
	<input type="checkbox" name="sport[]" value="游泳">游泳
	<input type="checkbox" name="sport[]" value="太極拳">太極拳
	<br/>
	興趣：<br/>
	<select name="habby" size="4">
	  <option value="唱歌">唱歌</option>
	  <option value="跳舞">跳舞</option>
	  <option value="繪畫">繪畫</option>
	  <option value="寫作">寫作</option>
	</select><br/>

	補充說明：<br/>
	<textarea name="more" cols="50" rows="5"></textarea><br/>

	<input type="submit" name="sub" value="登入">
	<input type="submit" name="cc" value="清除">
</form>
