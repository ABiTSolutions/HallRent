package hrs.ui;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hrs.dbConnection.DBConnection;
import hrs.queries.Queries;

/**
 * Servlet implementation class AdminMerchantDetails
 */
@WebServlet("/AdminMerchantDetailsServlet")
public class AdminMerchantDetailsServlet extends HttpServlet {
	Connection conn = DBConnection.getConnection();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMerchantDetailsServlet() {
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
		String merchantName			= null;		
		merchantName				= request.getParameter("merchantName");
		PreparedStatement ps 	= null;
		try {						
			ps = null;
			ps = conn.prepareStatement(Queries.queryUpdateApproveMerchant);
			ps.setString(1, merchantName);
			ps.executeUpdate();
			
			String check = "regSuccess";
			request.setAttribute("checkIt", check);
			request.getRequestDispatcher("admin_merchantDetails.jsp").forward(request, response);

			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
