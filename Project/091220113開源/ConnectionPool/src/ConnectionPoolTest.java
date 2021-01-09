/* This program is implemented with apache-dbch
 * The properties assigned can be found at 
 * http://commons.apache.org/dbcp/configuration.html
 */

import org.apache.commons.dbcp.BasicDataSource;  
import org.apache.commons.dbcp.BasicDataSourceFactory; 

import java.sql.SQLException;  
import java.sql.Connection;  
import java.util.Properties; 

public class ConnectionPoolTest {  
    
	private String host = "127.0.0.1";	//default host
	private String username = "root";	//default user name
	private String password = "wky1991"; //default password
	private String database = "test"; //default database;
	
	private BasicDataSource dataSource = null;  
  
    public ConnectionPoolTest() {  
    }  
    
    public ConnectionPoolTest(String host,String username,String password,String database){ 
    	this.host = host;
    	this.username = username;
    	this.password = password;
    	this.database = database;
    }  
  
    public void createPool() {  
  
        if (dataSource != null) {  
            try {  
                dataSource.close();  
            } catch (Exception e) {  
            }  
            dataSource = null;  
        }  
        try {  
            Properties p = new Properties(); 
           
            /* set jdbc driver */
            p.setProperty("driverClassName", "com.mysql.jdbc.Driver");
           
            /* set connection url */
            p.setProperty("url", "jdbc:mysql://" + host + "/" + database); 
           
            /* set user name */
            p.setProperty("username", username);  
            
            /* set password */
            p.setProperty("password", password);  
           
            /* set the maximum number of the active connections */
            p.setProperty("maxActive", "20");  
            
            /* set the maximum number of the idle connections */
            p.setProperty("maxIdle", "20"); 
            
            /* set the maximum number of milliseconds that the pool will wait */
            p.setProperty("maxWait", "1000");  
            
            /* The indication of whether objects will be validated 
             * before being borrowed from the pool
             */
            p.setProperty("testOnBorrow", "true");  
            p.setProperty("logAbandoned", "true");  
  
            dataSource = (BasicDataSource) BasicDataSourceFactory.createDataSource(p);  
  
        } catch (Exception e) {  
        }  
    }  
  
    /* get connection from the connection pool */
    public synchronized Connection getConnection() throws SQLException {  
        if (dataSource == null) {  
            createPool();  
        }  
        Connection conn = null;  
        if (dataSource != null) {  
            conn = dataSource.getConnection();  
        }  
        return conn;  
    }  
    
    /* close connection in the connection pool */
    public static void closeConnection(Connection conn) throws SQLException {
    	conn.close();
    }
}  