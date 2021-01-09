import java.sql.*;
import org.apache.commons.dbcp.BasicDataSource;

public class ConnectingToMySQL {
	public static void main(String[] args) {
		BasicDataSource bds = new BasicDataSource();
		bds.setDriverClassName("com.mysql.jdbc.Driver");
		bds.setUrl("jdbc:mysql://localhost:3306/test");
		bds.setUsername("root");
		bds.setPassword("");
		try {
			System.out.println("Trying to connect!!");
			Connection con = bds.getConnection();
			System.out.println("Connected sucessfully !!");
			con.close();
		} catch (SQLException s) {
			System.out.println("SQL code does not execute.");
		}
	}
}
