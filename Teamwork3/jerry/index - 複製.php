<!DOCTYPE html>
<html>



      <head>
        <meta charset="utf-8" />
      </head>

      <body>

       <table border="1px">
        <thead align="center">
         <th>編號</th>
         <th>帳號</th>
         <th>密碼</th>
         <th>姓名</th>
         <th>住址</th>
         <th>生日</th>
         <th>電話</th>
         <th>選項</th>
       </tr>
     </thead>

     <tbody>
       
                  <tr>
                    <form action="index.php" method="post">
                      <td align="center"><?php echo $id; ?></td><!--取出table的每一欄資料-->
                      <td align="left" "><?php echo $co; ?></td>
                      <td align="left" "><?php echo $pw; ?></td>
                      <td align="left" "><?php echo $na; ?></td>
                      <td align="left" "><?php echo $bi; ?></td>
                      <td align="left" "><?php echo $ad; ?></td>
                      <td align="left" "><?php echo $te; ?></td>
                      <td align="center"><input type="button" name="modi" value="修改">
                        <a href="index.php? idd=<? echo $id; ?>">刪除</a>
                      </form>
                    </tr>
              

                  <tr>
                    <form action="add.php" method="post">
                     <td>New</td>
                -
                     <td><input type="text" style="width: auto" name="account"></td>
                     <td><input type="text" style="width: auto" name="password"></td>
                     <td><input type="text" style="width: auto" name="name"></td>
                     <td><input type="text" style="width: auto" name="address"></td>
                     <td><input type="text" style="width: auto" name="birthday"></td>
                     <td><input type="text" style="width: auto" name="tel"></td>
                     
                     <td><input type="submit" name="Query" value="新增吧！"></td>
                  </form>
      <!---
                  <h2 class="major">Add</h2>  
                  
                  <hr><form method="post" action="add.php">
                  <h3>Account:<input type="text" name="account"><br/>
                  <h3>Password:<input type="text" name="password"><br/>
                  <h3>M_Name:<input type="text" name="name"><br/>
                  <h3>M_Address:<input type="text" name="address"><br/>
                  <h3>Birthday:<input type="text" name="birthday"><br/>
                  <h3>Tel:<input type="text" name="tel"><br/>
                  <input type="submit" name="Query" value="新增">
                  <input type="reset" name="Query" value="清除">
                  </form>
                  
--->
                 </tr>     
               </tbody>
             </table>
           </body>
           </html>
