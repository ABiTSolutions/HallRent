package hrs.ui;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hrs.dbConnection.DBConnection;
import hrs.queries.Queries;

/**
 * Servlet implementation class ProfileUpdateServlet
 */
@WebServlet("/ProfileUpdateServlet")
public class ProfileUpdateServlet extends HttpServlet {
	Connection conn = DBConnection.getConnection();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name   			= null;
		String emailId     		= null;
		String contactNo   		= null;
		String address     		= null;
		String userRole			= null;
		String userName			= null;
		name		= request.getParameter("name");
		emailId     = request.getParameter("email");
		contactNo   = request.getParameter("contactNo");
		address     = request.getParameter("address");
		userRole 	= request.getParameter("userRole");
		userName	= request.getParameter("userName");
		
		PreparedStatement ps  = null;
		ResultSet rs = null;
		
		if(userRole.equalsIgnoreCase("merchant")){
			try {
				ps = conn.prepareStatement(Queries.queryUpdateProfile);
				ps.setString(1, name);
				ps.setString(2, emailId);
				ps.setString(3, contactNo);
				ps.setString(4, address);
				ps.setString(5, userName);
				ps.execute();

				response.sendRedirect("merchant_profile.jsp");
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

}
