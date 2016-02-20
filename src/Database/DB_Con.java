package Database;

import java.sql.*;

public class DB_Con {
	Connection con;
	protected String root = "root";
	protected String pass = "1234";

	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/utycc", root, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}
