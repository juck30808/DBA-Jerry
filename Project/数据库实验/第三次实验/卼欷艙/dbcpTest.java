import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbcp.BasicDataSource;

/**
 *使用DBCP连接MySQL数据库
 * @author bsidb
 */
public class dbcpTest {
    public static void  main(String[] args){
    	//Create Datasource
    	BasicDataSource dataSource = new BasicDataSource();
    	try{
    	Class.forName("com.mysql.jdbc.Driver");
    	dataSource.setDriverClassName("com.mysql.jdbc.Driver");
    	dataSource.setUsername("root");
    	dataSource.setPassword("linuxin");
    	dataSource.setUrl("jdbc:mysql://localhost/mysql");
    	/*
    	 * The Max Connections allowed in MySQL configuration
    	 * file is 1000, so reverse 2 connections for administration
    	 */
    	dataSource.setMaxActive(998);
    	dataSource.setMaxIdle(998);}
    	catch (Exception e) {
    		System.out.println("fail to load driver.");
			e.printStackTrace();
			
		}
    	
    	//Setup connection
    	/*
    	 * 测试连接池效应，可以发现前643个连接是成功的，
    	 * 中间有若干连接建立失败，
    	 * 而后面从第802个连接开始又成功，
    	 * 其后至第901个连接又开始失败
    	 * 产生这种现象的原因应该是连接池管理，当申请数超过一定的时候，
    	 * 连接池中没有资源，因而无法申请
    	 * 而空闲一段时间后，又可以将一部分原有的连接资源分配给新申请的连接
    	 */
    	for(int i = 1; i <= 1000; i++){
	    	try{
	    	Connection connection = dataSource.getConnection();
	    	System.out.println("[" + i + "]" + "create connection to "
	    	 + connection.getMetaData().getDatabaseProductName()
	    	+" " + connection.getMetaData().getDatabaseProductVersion() 
	    	+ " success!");
	    	} catch (SQLException e) {
				System.out.println("[" + i + "]" + "fail!");
			}
    	}
    }
}
