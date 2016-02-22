package Help;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Database.DB_Con;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PoliticServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DB_Con con;
	private Connection c;
	private Statement stmt;
	private ResultSet rs;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String key = request.getParameter("key");
		String sql = "SELECT * FROM politics_list WHERE name LIKE '%"+key+"%'";
		String json = null;
		List<String> list = new ArrayList<String>();

		if (con == null) {
			con = new DB_Con();
		}
		try {
			c = con.getConnection();
			stmt = c.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(rs.getString("name"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		json = new Gson().toJson(list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
