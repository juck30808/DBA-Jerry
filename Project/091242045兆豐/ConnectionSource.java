/**
 * �˳���ο����ϴ���http://blog.sina.com.cn/s/blog_4cc16fc50100be5n.html
 * �������޸ģ��������������Ϊ1
 * �����������̶߳����ݿ�ͬʱ�����������
 * �� "zhaofengdb"���ݿ�ִ������"select * from student"
 * ���н�����£�
 * 
 * 				max active of dbcp is 1.
 * 				thread 2 is creating connection.
 * 				thread 1 is creating connection.
 * 				thread 2 gets connection.
 * 				thread 2 Results:
 * 					45	�Է�
 * 				thread 2 is closing connection.
 * 				thread 1 gets connection.
 * 				thread 1 Results:
 * 					45	�Է�
 * 				thread 1 is closing connection.
 * 
 * ���н������ֻ�е�һ���̹߳ر�����ʱ��һ���̲߳��ܵõ�����
 * ���������ݿ����ӳ�����ĵ�������
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
			p.setProperty("driverClassName", "com.mysql.jdbc.Driver");//����mysql������mysql������
			p.setProperty("url", "jdbc:mysql://localhost/zhaofengdb");//����mysql��url��
			p.setProperty("password", "useruser");//�������ݿ������
			p.setProperty("username", "root");//�������ݿ���û���
			p.setProperty("maxActive", "1");// ���������
			p.setProperty("maxIdle", "1");   // ����������
			p.setProperty("maxWait", "5000");// ��ʱ�ȴ�ʱ���Ժ���Ϊ��λ
			p.setProperty("removeAbandoned", "false");   
 
			p.setProperty("removeAbandonedTimeout", "120");//��ʱʱ��(������Ϊ��λ)
			p.setProperty("testOnBorrow", "true");
			p.setProperty("logAbandoned", "true");
 
			dataSource = (BasicDataSource) BasicDataSourceFactory
			.createDataSource(p);//��������Դ��
 
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
				conn = ConnectionSource.getConnection();//�õ����ݿ������
				System.out.println(name + " gets connection.");
				//System.out.println("Creating statement.");
				stmt = conn.createStatement();//�������ݿ�����
				//System.out.println("Executing statement.");
				rset = stmt.executeQuery("select * from student");//�������еõ�Ҫִ�е����ݿ��ѯ��䡣
				System.out.println(name + " Results:");
				int numcols = rset.getMetaData().getColumnCount();//���ؽ������������
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
					conn.close();//�ر����ݿ����ӡ�
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