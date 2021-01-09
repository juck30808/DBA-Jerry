package myPackage;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.commons.dbcp.ConnectionFactory;
import org.apache.commons.dbcp.DriverManagerConnectionFactory;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDriver;
import org.apache.commons.pool.ObjectPool;
import org.apache.commons.pool.impl.GenericObjectPool;

public class poolConnect {
   
    /**
     * 数据库连接池
     * @see http://jakarta.apache.org/commons/dbcp/index.html
     */
    private static PoolingDriver driver = null;
    /**
     * 设置一个数据库连接池
     *
     * @param name 连接池的名称
     * @param url 数据源
     * @throws SQLException
     */
    private static void setUpDriverPool(String name, String url) throws SQLException{
        if ((driver == null) || driver.getPoolNames().length < 2) {
            try {
                /**
                 * 首先创建一个对象池来保存数据库连接
                 *
                 * 使用 commons.pool 的 GenericObjectPool对象
                 */
                ObjectPool connectionPool = new GenericObjectPool();
               
                /**
                 * 创建一个 DriverManagerConnectionFactory对象
                 * 连接池将用它来获取一个连接
                 */
                ConnectionFactory connectionFactory = new DriverManagerConnectionFactory(url, "root","root");
               
                /**
                 * 创建一个PoolableConnectionFactory 对象。
                 */
                PoolableConnectionFactory poolableConnectionFactory =
                    new PoolableConnectionFactory(connectionFactory,connectionPool,null,null,false,true);
               
                /**
                 * 注册PoolingDriver。
                 */
                Class.forName("org.apache.commons.dbcp.PoolingDriver");
               
                driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
               
                driver.registerPool(name, connectionPool);
               
            }
            catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
   
    /**
     * 关闭所有数据库连接池
     *
     */
    public static void shutDownDriver() {
       
        try {         
            PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
            for (int i = 0; i <driver.getPoolNames().length; i++) {
                driver.closePool("pool");
            }
        }
        catch (SQLException sqle) {
            throw new RuntimeException(sqle);
        }
    }

    /**
     * 取得一个数据库连接对象。
     *
     * 因为可能使用两个不同的数据库，
     * 所以依据report的值来确定使用那个数据库。
     *
     * @param report
     * @return
     */
    public static Connection getConnection() {
        Connection con = null;
       
        try {
            //装载mysql的jdbc驱动
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/sell";
            String poolName = "pool";
            Class.forName(driver);
            setUpDriverPool(poolName, url);
            con = DriverManager.getConnection("jdbc:apache:commons:dbcp:" + poolName);
            return con;
        }
        catch (ClassNotFoundException cnfe) {
            throw new RuntimeException("无法装入数据库引擎") ;
        }
        catch (SQLException sqle) {
            throw new RuntimeException("无法打开数据库连接");
        }
    }
   
    /**
     * 执行清理过程
     *
     * <li>关闭数据库连接</li>
     * <li>关闭语句对象</li>
     * <li>关闭结果集</li>
     *
     * @param con
     * @param s
     * @param rs
     */
    public static void closeAll(Connection con, Statement s, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
           
            if (s != null) {
                s.close();
                s = null;
            }
           
            if (con != null) {
                con.close();
                con = null;
            }
        }
        catch (SQLException sqle) {
            System.out.println("关闭异常！！");
        }
    }
public static void main(String[] args){
   String sql="SELECT * FROM user";
   Connection conn=poolConnect.getConnection();
   Statement stmt=null;
   ResultSet rs=null;
try {
   stmt = conn.createStatement();
    rs=stmt.executeQuery(sql);
   while(rs.next()){
    System.out.println(rs.getString("username"));
   }
} catch (SQLException e) {
   e.printStackTrace();
}
finally{
	poolConnect.closeAll(conn, stmt, rs);
}

   
    }
   
}