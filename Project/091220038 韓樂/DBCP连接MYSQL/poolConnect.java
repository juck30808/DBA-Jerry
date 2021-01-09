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
     * ���ݿ����ӳ�
     * @see http://jakarta.apache.org/commons/dbcp/index.html
     */
    private static PoolingDriver driver = null;
    /**
     * ����һ�����ݿ����ӳ�
     *
     * @param name ���ӳص�����
     * @param url ����Դ
     * @throws SQLException
     */
    private static void setUpDriverPool(String name, String url) throws SQLException{
        if ((driver == null) || driver.getPoolNames().length < 2) {
            try {
                /**
                 * ���ȴ���һ����������������ݿ�����
                 *
                 * ʹ�� commons.pool �� GenericObjectPool����
                 */
                ObjectPool connectionPool = new GenericObjectPool();
               
                /**
                 * ����һ�� DriverManagerConnectionFactory����
                 * ���ӳؽ���������ȡһ������
                 */
                ConnectionFactory connectionFactory = new DriverManagerConnectionFactory(url, "root","root");
               
                /**
                 * ����һ��PoolableConnectionFactory ����
                 */
                PoolableConnectionFactory poolableConnectionFactory =
                    new PoolableConnectionFactory(connectionFactory,connectionPool,null,null,false,true);
               
                /**
                 * ע��PoolingDriver��
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
     * �ر��������ݿ����ӳ�
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
     * ȡ��һ�����ݿ����Ӷ���
     *
     * ��Ϊ����ʹ��������ͬ�����ݿ⣬
     * ��������report��ֵ��ȷ��ʹ���Ǹ����ݿ⡣
     *
     * @param report
     * @return
     */
    public static Connection getConnection() {
        Connection con = null;
       
        try {
            //װ��mysql��jdbc����
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/sell";
            String poolName = "pool";
            Class.forName(driver);
            setUpDriverPool(poolName, url);
            con = DriverManager.getConnection("jdbc:apache:commons:dbcp:" + poolName);
            return con;
        }
        catch (ClassNotFoundException cnfe) {
            throw new RuntimeException("�޷�װ�����ݿ�����") ;
        }
        catch (SQLException sqle) {
            throw new RuntimeException("�޷������ݿ�����");
        }
    }
   
    /**
     * ִ���������
     *
     * <li>�ر����ݿ�����</li>
     * <li>�ر�������</li>
     * <li>�رս����</li>
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
            System.out.println("�ر��쳣����");
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