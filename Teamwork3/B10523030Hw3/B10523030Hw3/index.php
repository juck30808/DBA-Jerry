<!DOCTYPE HTML>
<html>
<head>
	<style>
		body {
		  background-color: #fff;
		  padding: 0;
		  margin: 0;
		}
		img{
		  display: block;
		}
		.wrapper{
		  margin: 0 auto;
		  width: 900px;
		  max-width: 900px;
		  box-shadow: 0px 0px 5px #888888;
		}
		.header{
		  background-color: #eed2bc;
		  text-align: center;
		  height: 68px;
		}
		ul{
		  padding: 0;
		  margin: 0;
		  clear: both;
		  background-color: white;
		  display: block;
		  width: 100%;
		  height: 30px;
		}
		ul::after{
		  clear: both;
		}
		li{
		  list-style: none;
		  width: 25%;
		  float: left;
		  padding: 0;
		  margin: 0;
		  text-align: center;
		  padding-top: 7px;
		}
		a{
		  color: #000000;
		  text-decoration: none;
		}
		a:hover{
		  color: #e9e9e9;
		}
		.banner{
		  display: block;
		  background-color: #e9e9e9;
		}
		  .navigation-wrapper
		{
		    display: block
		    clear: both;
		    height: 30px;
		    width: 900px;
		     padding-top: 10px;
		    color:#AE1B1D;
		    text-decoration: none;
		    background-color: #BFB9B9;
		  }
		  .navigation a{
		     float: left;
		     text-align: center;
		  width: 200px;
		  height: auto;
		  margin: 10px 5px;
		  }
		.blog-wrapper{
		  clear: both;
		  width: 630px;
		  height: auto;
		  margin: 0 auto;
		  padding-bottom: 2em;
		}
		.blog-wrapper::after{
		  clear: both;
		  content: "";
		  display: table;
		}
		.blog{
		  float: left;
		  width: 200px;
		  height: auto;
		  margin: 10px 5px;
		}

		.footer{
		  clear: left;
		  width: 100%;
		  display: block;
		  background-color: #c9c1bb;
		  text-align: center;
		}
		.footer p{
		  padding: 0;
		  margin: 0;
		  font-size: 9px;
		  text-align: center;
		  color: #6c6c6c;
		}
		.footer img{
		  display: block;
		  width: 100%;
		}
		p{
		  color: #a4a4a4;
		}
		.more{
		  background-color: #7193aa;
		  padding: .5em 2em;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<img src="images/logo.png">
		</div>

		<div class="navigation">
			<a href="index.php">會員管理</a>
			<a href="index2.php">書籍管理</a>
			<a href="index3.php">訂單紀錄管理</a>
			<a href="index4.php">出版社管理</a>
		</div>
		
		<div class="banner">
      		<img src="images/banner.png">
    	</div>

		<div class="banner">
			<article id="intro">
				<a><h2 class="major">會員管理</h2></a>
				<hr><form method="post" action="index.php">
					<h3>M_ID:</h3><textarea name="Sql" required></textarea></br>
					<input type="submit" name="Query" value="查詢">
					<input type="reset" name="Query" value="清除">
					<input type="submit" value="返回">
				</form>
				<!--
				<li><a href="#new">Add</a></li>
				<li><a href="#del">Delete</a></li>
				<li><a href="#mod">Modify</a></li>
				-->
				<?php include 'mem_user.php';?>
				
			</article>

<!---add---->
			<table border="1px">
		        <thead align="center">
			         <th>M_ID</th>
			         <th>Account</th>
			         <th>Password</th>
			         <th>M_Name</th>
			         <th>M_Address</th>
			         <th>Birthday</th>
			         <th>Tel</th>
		       		</tr>
		     	</thead>
	
				<tbody>
	                 <tr>
	                 <h2 class="major">Add</h2>	
	                 <form action="mem_add.php" method="post">
	                 <td><input type="text" style="width: 80px" name="mid" required></td>
	                 <td><input type="text" style="width: 80px" name="macc"></td>
	                 <td><input type="text" style="width: 80px" name="mpw"></td>
	                 <td><input type="text" style="width: 80px" name="mna"></td>
	                 <td><input type="text" style="width: auto" name="madd"></td>
	                 <td><input type="text" style="width: 80px" name="mbir"></td>
	                 <td><input type="text" style="width: 80px" name="mtel"></td>
	                 <td><input type="submit" name="Query" value="新增！"></td>
	                 <td><input type="reset" name="Query" value="清除"></td>
    	             </form>
	                 </tr>     
	             </tbody>
             </table>
<!---delete---->
			<table border="1px">
		        <thead align="center">
			         <th>M_ID</th>
		       		</tr>
		     	</thead>
			
				<tbody>
	                 <tr>
	                 <h2 class="major">Delete</h2>	
	                 <form action="mem_del.php" method="post">
	                 <td><input type="text" style="width: 80px" name="mid" required></td>
	                 <td><input type="submit" name="Query" value="刪除！"></td>
	                 <td><input type="reset" name="Query" value="清除"></td>
    	             </form>
	                 </tr>     
	             </tbody>
             </table>
<!---mod---->
			<table border="1px">
		        <thead align="center">
			         <th>欲修改編號</th>
			         <th>Account</th>
			         <th>Password</th>
			         <th>M_Name</th>
			         <th>M_Address</th>
			         <th>Birthday</th>
			         <th>Tel</th>
		       		</tr>
		     	</thead>
	
				<tbody>
	                 <tr>
	                 <h2 class="major">Modify</h2>	
	                 <form action="mem_mod.php" method="post">
	                 <td><input type="text" style="width: 80px" name="mid" required></td>
	                 <td><input type="text" style="width: 80px" name="macc"></td>
	                 <td><input type="text" style="width: 80px" name="mpw"></td>
	                 <td><input type="text" style="width: 80px" name="mna"></td>
	                 <td><input type="text" style="width: auto" name="madd"></td>
	                 <td><input type="text" style="width: 80px" name="mbir"></td>
	                 <td><input type="text" style="width: 80px" name="mtel"></td>
	                 <td><input type="submit" name="Query" value="修改！"></td>
	                 <td><input type="reset" name="Query" value="清除"></td>
    	             </form>
	                 </tr>     
	             </tbody>
             </table>
		</div>

		<div class="footer">
      		<img src="images/footer.png">
   		</div>
	</div>
</body>
</html>
