package Student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Serial key check is already used .
		String key = request.getParameter("key");
		response.setContentType("text/xml");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println("<isSerial>Already Used</isSerial>");
		System.out.println(" Key :" +key);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
