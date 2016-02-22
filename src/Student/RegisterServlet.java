package Student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DB_Con;

import java.sql.*;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection c;
	private Statement stmt;
	private ResultSet rs;
	private DB_Con con;
	private String student = "INSERT INTO `student` (sid,serial_no,nrc,password) VALUES(?,?,?,?)";
	private String info = "INSERT INTO `student_info` (sid,ename,mname,politics,religion,birthday,hometown,mark) VALUES(?,?,?,?,?,?,?,?)";
	private String parent = "INSERT INTO `student_parent` (sid,fename,fmname,fnrc,fpolitics,freligion,fjob,mename,mmname,mnrc,mpolitics,mreligion,mjob) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	private int id;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Serial key check is already used .
		String key = request.getParameter("key");
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println("Hello " + key);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (con == null) {
			con = new DB_Con();
		}
		if (request.getParameter("type").equals("1year")) {
			String serial = request.getParameter("serial");
			String ename = request.getParameter("ename");
			String mname = request.getParameter("mname");
			String nrc = request.getParameter("nrc");
			String mark = request.getParameter("mark");
			String politics = request.getParameter("politics");
			String religion = request.getParameter("religion");
			String birthday = request.getParameter("birthday");
			String hometown = request.getParameter("hometown");

			String fename = request.getParameter("fename");
			String fmname = request.getParameter("fmname");
			String fnrc = request.getParameter("fnrc");
			String fpolitics = request.getParameter("fpolitics");
			String freligion = request.getParameter("freligion");
			String fjob = request.getParameter("fjob");

			String mename = request.getParameter("mename");
			String mmname = request.getParameter("mmname");
			String mnrc = request.getParameter("mnrc");
			String mpolitics = request.getParameter("mpolitics");
			String mreligion = request.getParameter("mreligion");
			String mjob = request.getParameter("mjob");

			try {
				c = con.getConnection();
				PreparedStatement ps = c.prepareStatement(student);
				ps.setInt(1, id);
				ps.setInt(2, Integer.parseInt(serial));
				ps.setString(3, nrc);
				ps.setString(4, "1234");
				ps.executeUpdate();
				System.out.println(" ** Student Table Success **");
				ps.close();

				int sid = getSID(serial, nrc);

				PreparedStatement pi = c.prepareStatement(info);
				pi.setInt(1, sid);
				pi.setString(2, ename);
				pi.setString(3, mname);
				pi.setString(4, politics);
				pi.setString(5, religion);
				pi.setString(6, birthday);
				pi.setString(7, hometown);
				pi.setInt(8, Integer.parseInt(mark));
				pi.executeUpdate();
				System.out.println(" ** Student Informtion Table Success **");
				pi.close();

				PreparedStatement pp = c.prepareStatement(parent);
				pp.setInt(1, sid);
				pp.setString(2, fename);
				pp.setString(3, fmname);
				pp.setString(4, fnrc);
				pp.setString(5, fpolitics);
				pp.setString(6, freligion);
				pp.setString(7, fjob);
				pp.setString(8, mename);
				pp.setString(9, mmname);
				pp.setString(10, mnrc);
				pp.setString(11, mpolitics);
				pp.setString(12, mreligion);
				pp.setString(13, mjob);
				pp.executeUpdate();
				System.out.println(" ** Student Parent Table Success **");
				pp.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (request.getParameter("type").equals("1year"))

		{
			System.out.println("Other Year Process");
		} else {
			System.out.println(" No Register Request : Find the year form");
		}

	}

	public int getSID(String nrc, String serial_no) {
		int id = 0;
		String getSQL = "select * from student where nrc='" + nrc + "' and serial_no='" + serial_no + "'";
		try {
			rs = stmt.executeQuery(getSQL);
			while (rs.next()) {
				id = rs.getInt("sid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

}
