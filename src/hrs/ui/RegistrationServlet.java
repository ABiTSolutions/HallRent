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
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	Connection conn = DBConnection.getConnection();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
		String userName    		= null;
		String password    		= null;
		String confirmPassword 	= null;
		String userRole    		= null;
		String userId			= null;	
		int isActive			= 1;
		name		= request.getParameter("name");
		emailId     = request.getParameter("email");
		contactNo   = request.getParameter("contactNo");
		address     = request.getParameter("address");
		userName    = request.getParameter("userName");
		password    = request.getParameter("password");
		confirmPassword = request.getParameter("confirmPassword");
		userRole	= request.getParameter("role");
		PreparedStatement ps  = null;
		PreparedStatement ps1 = null;
		ResultSet rs = null;

	
		
		if(password.equals(confirmPassword)){

			try {
				ps = null;
				rs = null;
				ps = conn.prepareStatement(Queries.queryCheckRegistration);
				ps.setString(1, userName);
				rs=ps.executeQuery();
				
				if(rs.next()){
					
					String check = "registered";
					request.setAttribute("checkIt", check);
					request.getRequestDispatcher("registration.jsp").forward(request, response);
				}
				
				ps = null;			
				ps = conn.prepareStatement(Queries.queryGetExistingUserCount);
				ps.setString(1, userRole);
				rs = ps.executeQuery();
				
				if(rs.next()){
					int userCount = rs.getInt("Count");
					if(userCount == 0) {
						if(userRole.equalsIgnoreCase("Customer")) {
							userId = "C1001";							
						} else if(userRole.equalsIgnoreCase("Merchant")) {
							userId = "M1001";
							isActive = 0;
						} else {
							userId = "A1001";
						}
					} else {
						int myInt = userCount + 1001;
						  String nextUserId = String.format("%04d", myInt);
						  if(userRole.equalsIgnoreCase("Customer")) {
								userId = "C"+nextUserId;
							} else if(userRole.equalsIgnoreCase("Merchant")) {
								userId = "M"+nextUserId;
								isActive = 0;
							} else {
								userId = "A"+nextUserId;
							}
					}
				}			
				
				ps = null;			
				ps = conn.prepareStatement(Queries.queryInsertRegDetails);
				ps.setString(1, name);
				ps.setString(2, emailId);
				ps.setString(3, contactNo);
				ps.setString(4, address);
				ps.setString(5, userName);
				ps.setInt(6, isActive);
				ps.setTimestamp(7, new java.sql.Timestamp(System.currentTimeMillis()));
				ps.executeUpdate();

				ps1 = null;
				ps1 = conn.prepareStatement(Queries.queryInsertLoginDetails);
				ps1.setString(1, userName);
				ps1.setString(2, password);
				ps1.setString(3, userRole);
				ps1.setString(4, userId);
				ps1.setTimestamp(5, new java.sql.Timestamp(System.currentTimeMillis()));
				ps1.executeUpdate();

/*				PreparedStatement ps2 = null;
				ps2 = conn.prepareStatement(Queries.queryInsertUserDetails);
				ps2.setString(1, userName);
				ps2.setString(2, emailId);
				ps2.executeUpdate();
*/				
				String check = "regSuccess";
				request.setAttribute("checkIt", check);
				request.getRequestDispatcher("registration.jsp").forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
			response.sendRedirect("registration.jsp");
		}
	
	}

}
