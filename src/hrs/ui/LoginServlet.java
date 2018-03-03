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
import javax.servlet.http.HttpSession;

import hrs.dbConnection.DBConnection;
import hrs.queries.Queries;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	Connection conn = DBConnection.getConnection();
	
	public static String userId = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String userName = null;
		String password = null;
		String userRole = null;
		userName = request.getParameter("username");	
		password = request.getParameter("password");
		userRole = request.getParameter("role");
		PreparedStatement ps = null;
		ResultSet rs         = null;

		try {
			ps = conn.prepareStatement(Queries.queryCheckLoginDetails);	
			ps.setString(1, userName);
			ps.setString(2, password);
			ps.setString(3, userRole);
			rs = ps.executeQuery();		
			
			if(rs.next()) {	
				userId 		= rs.getString("UserId");				
				userName 	= rs.getString("UserName");
				HttpSession session = request.getSession();
				session.setAttribute("userNameLogin",userName);  
				if(userRole.equalsIgnoreCase("merchant")) {					
					session.setAttribute("user_Id", userId);
					response.sendRedirect("dashboard_merchant.jsp");
				} else if(userRole.equalsIgnoreCase("customer")) {
					response.sendRedirect("dashboard_customer.jsp");						
				} else {
					response.sendRedirect("dashboard_admin.jsp");
				}
				/*if(userRole == null) {
				
				} else {				
					HttpSession session = request.getSession();
					session.setAttribute("userName", userName);
					
				}*/			
			} else {
				String check = "invalid";
				request.setAttribute("checkIt", check);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
	}

}
