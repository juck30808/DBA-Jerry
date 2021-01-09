import java.sql.SQLException;  
import java.sql.Connection; 
import java.sql.*;

public class Test{
	public static void main(String[] args) throws SQLException{
		ConnectionPoolTest pool = new ConnectionPoolTest();
		Connection conn = pool.getConnection();
		Statement statement = conn.createStatement();
		
		System.out.println("The query is select name from test !");
		ResultSet resultSet = statement.executeQuery("select name from test");
		
		System.out.println("Now displaying the set items after querying : ");
		while(resultSet.next()){
			System.out.println("Name : " + resultSet.getString(1));
		}
	}
}