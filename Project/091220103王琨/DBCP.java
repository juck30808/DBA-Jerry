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
	/** 指定数据源 */
	private DataSource dataSource;

	/** 从数据源获得连接  */
	public Connection getConnection() 
	{
		try 
		{
			return dataSource.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("获得连接出错！");
			e.printStackTrace();
			return null;
		}
	}

	/** 默认的构造函数 */
	public DBCP() 
	{
		this.dataSource = new BasicDataSource();;
	}

	/** 
	 * 构造函数，初始化 dataSource，指定数据库，使用默认数据库参数 
	 */
	public DBCP(String connectURI) 
	{
		initialdataSource(connectURI);
	}

	/** 
	 * 构造函数，初始化 dataSource，指定所有参数  
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
	 * 创建数据源，除了数据库外，都使用默认参数 
	 */
	private void initialdataSource(String connectURI) 
	{
		initialdataSource(connectURI, "root", "root", "com.mysql.jdbc.Driver", 5, 100, 30, 10000);
	}

	/** 
	 * 指定所有参数连接数据源
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
		ds.setInitialSize(initialSize); // 初始的连接数；
		ds.setMaxActive(maxActive);
		ds.setMaxIdle(maxIdle);
		ds.setMaxWait(maxWait);
		
		this.dataSource = ds;
	}

	/** 关闭数据源 */
	public void closeDataSource() throws Exception 
	{
		((BasicDataSource) dataSource).close();
	}

	public static void main(String[] args) 
	{
		/** 新建数据库连接 */
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
			
			/** 输出查询信息 */
			System.out.println("Select results:");
			
			/** 输出表头信息 */
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
