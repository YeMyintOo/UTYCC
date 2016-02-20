package Student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Database.DB_Con;
import java.sql.*;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DB_Con con;
	private Connection c;
	private Statement stmt;
	private ResultSet rs;
	private final String sql = "select * from student";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		sql.concat(" where id='"+id+"' and password='"+pass+"'");
		if (con == null) {
			con = new DB_Con();
		}

		try {
			c = con.getConnection();
			stmt = c.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				
			} else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
