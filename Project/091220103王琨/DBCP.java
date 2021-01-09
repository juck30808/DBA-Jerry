/**********************************************************
 * Student Name:	WangKun
 * Student ID:		091220103
 * Date:			2011-11-20
 **********************************************************/

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;

public class DBCP 
{
	/** ָ������Դ */
	private DataSource dataSource;

	/** ������Դ�������  */
	public Connection getConnection() 
	{
		try 
		{
			return dataSource.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("������ӳ���");
			e.printStackTrace();
			return null;
		}
	}

	/** Ĭ�ϵĹ��캯�� */
	public DBCP() 
	{
		this.dataSource = new BasicDataSource();;
	}

	/** 
	 * ���캯������ʼ�� dataSource��ָ�����ݿ⣬ʹ��Ĭ�����ݿ���� 
	 */
	public DBCP(String connectURI) 
	{
		initialdataSource(connectURI);
	}

	/** 
	 * ���캯������ʼ�� dataSource��ָ�����в���  
	 */
	public DBCP(	String connectURI, 
					String username, 
					String pswd, 
					String driverClass, 
					int initialSize,
					int maxActive, 
					int maxIdle, 
					int maxWait) 
	{
		initialdataSource(	connectURI, username, pswd, driverClass, 
					initialSize, maxActive, maxIdle, maxWait);
	}

	/**
	 * ��������Դ���������ݿ��⣬��ʹ��Ĭ�ϲ��� 
	 */
	private void initialdataSource(String connectURI) 
	{
		initialdataSource(connectURI, "root", "root", "com.mysql.jdbc.Driver", 5, 100, 30, 10000);
	}

	/** 
	 * ָ�����в�����������Դ
	 */
	private void initialdataSource(	String connectURI, 
							String username, 
							String pswd, 
							String driverClass, 
							int initialSize,
							int maxActive, 
							int maxIdle, 
							int maxWait) 
	{
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(driverClass);
		ds.setUsername(username);
		ds.setPassword(pswd);
		ds.setUrl(connectURI);
		ds.setInitialSize(initialSize); // ��ʼ����������
		ds.setMaxActive(maxActive);
		ds.setMaxIdle(maxIdle);
		ds.setMaxWait(maxWait);
		
		this.dataSource = ds;
	}

	/** �ر�����Դ */
	public void closeDataSource() throws Exception 
	{
		((BasicDataSource) dataSource).close();
	}

	public static void main(String[] args) 
	{
		/** �½����ݿ����� */
		DBCP database = new DBCP(	"jdbc:mysql://localhost:3306/test", "root", "root",
									"com.mysql.jdbc.Driver", 5, 100, 30, 10000);

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try
		{
			connection = database.getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from student");
			
			int colNum = resultSet.getMetaData().getColumnCount();
			
			/** �����ѯ��Ϣ */
			System.out.println("Select results:");
			
			/** �����ͷ��Ϣ */
			for (int i = 1; i <= colNum; i++) 
				System.out.print("\t" + resultSet.getMetaData().getColumnLabel(i) + "\t");
			System.out.println("");
			
			while (resultSet.next()) 
			{
				for (int i = 1; i <= colNum; i++) 
				{
					System.out.print("\t" + resultSet.getString(i) + "\t");
				}
				System.out.println("");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				if (resultSet != null)
					resultSet.close();
				if (connection != null)
					connection.close();
				if (statement != null)
					statement.close();				
				if (database != null)
					database.closeDataSource();
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
	}
}
