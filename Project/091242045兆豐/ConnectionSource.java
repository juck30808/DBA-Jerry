/**
 * 此程序参考网上代码http://blog.sina.com.cn/s/blog_4cc16fc50100be5n.html
 * 进行了修改，设置最大连接数为1
 * 创建了两个线程对数据库同时提出连接请求
 * 对 "zhaofengdb"数据库执行命令"select * from student"
 * 运行结果如下：
 * 
 * 				max active of dbcp is 1.
 * 				thread 2 is creating connection.
 * 				thread 1 is creating connection.
 * 				thread 2 gets connection.
 * 				thread 2 Results:
 * 					45	赵丰
 * 				thread 2 is closing connection.
 * 				thread 1 gets connection.
 * 				thread 1 Results:
 * 					45	赵丰
 * 				thread 1 is closing connection.
 * 
 * 运行结果表明只有当一个线程关闭连接时另一个线程才能得到连接
 * 表明了数据库连接池所起的调度作用
 */


import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.BasicDataSourceFactory;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Properties;

public class ConnectionSource {
	private static BasicDataSource dataSource = null;
	public ConnectionSource() {
	}
	public static void init() {
		if (dataSource != null) {
			try {
				dataSource.close();
			} catch (Exception e) {    
			}
			dataSource = null;
		}
		try {
			Properties p = new Properties();
			p.setProperty("driverClassName", "com.mysql.jdbc.Driver");//连接mysql，加载mysql驱动。
			p.setProperty("url", "jdbc:mysql://localhost/zhaofengdb");//连接mysql的url。
			p.setProperty("password", "useruser");//连接数据库的密码
			p.setProperty("username", "root");//连接数据库的用户名
			p.setProperty("maxActive", "1");// 最大连接数
			p.setProperty("maxIdle", "1");   // 最大空闲连接
			p.setProperty("maxWait", "5000");// 超时等待时间以毫秒为单位
			p.setProperty("removeAbandoned", "false");   
 
			p.setProperty("removeAbandonedTimeout", "120");//超时时间(以秒数为单位)
			p.setProperty("testOnBorrow", "true");
			p.setProperty("logAbandoned", "true");
 
			dataSource = (BasicDataSource) BasicDataSourceFactory
			.createDataSource(p);//创建数据源。
 
		} catch (Exception e) {
		}
	}
	
	public static synchronized Connection getConnection() throws SQLException {
		if (dataSource == null) {
			init();
		}
		Connection conn = null;
		if (dataSource != null) {
			conn = dataSource.getConnection();
		}
		return conn;
	}
	
	public static class connect implements Runnable{
		private String name;
		public connect(String name){
			this.name = name;
		}
		public void run() {
			Connection conn = null;
			Statement stmt = null;
			ResultSet rset = null;
			try {
				System.out.println(name + " is creating connection.");
				conn = ConnectionSource.getConnection();//得到数据库的连接
				System.out.println(name + " gets connection.");
				//System.out.println("Creating statement.");
				stmt = conn.createStatement();//创建数据库声明
				//System.out.println("Executing statement.");
				rset = stmt.executeQuery("select * from student");//从命令行得到要执行的数据库查询语句。
				System.out.println(name + " Results:");
				int numcols = rset.getMetaData().getColumnCount();//返回结果集的条数。
				while (rset.next()) {
					for (int i = 1; i <= numcols; i++) {
						System.out.print("\t" + rset.getString(i));
					}
					System.out.println("");
				}
				try {
					Thread.sleep(3000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				System.out.println(name + " is closing connection.");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					rset.close();
				} catch (Exception e) {
				}
				try {
					stmt.close();
				} catch (Exception e) {
				}
				try {
					conn.close();//关闭数据库连接。
				} catch (Exception e) {
				}
			}
		}
		}
	
	public static void main(String[] args){
		System.out.println("max active of dbcp is 1.");
		Thread thread1 = new Thread(new connect("thread 1"));
		Thread thread2 = new Thread(new connect("thread 2"));
		thread1.start();
		thread2.start();
	}
}