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
 * Servlet implementation class AddHallServlet
 */
@WebServlet("/AddHallServlet")
public class AddHallServlet extends HttpServlet {
	Connection conn = DBConnection.getConnection();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddHallServlet() {
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
		String hall_name  		= null;
		String hall_type		= null;
		String area_sqft 		= null;
		String no_of_rooms 		= null;
		String floors 			= null;
		String kitchen_room 	= null;
		String parking			= null;
		String lawn 			= null;
		String comment 			= null;
		
		String city 			= null;
		String locality 		= null;
		String sub_locality 	= null;
		String landmark 		= null;
		
		String hall_rent 		= null;
		String maintenance 		= null;
		String electricity 		= null;
		String lawn_space 		= null;
		
		String power_backup 	= null;
		String lift_in_building = null;
		String security 		= null;
		String maintenance_staff = null;
		
		String contact_name 	= null;
		String mobile_no 		= null;
		String email_id 		= null;
		String address 			= null;
		
		String decoration    	= null;
		String catering			= null;
		
		String hallId			= null;	
		String userId			= null;	
		
		hall_name			= request.getParameter("hall_name");
		hall_type			= request.getParameter("hall_type");
		area_sqft			= request.getParameter("area_sqft");
		no_of_rooms			= request.getParameter("no_of_rooms");
		floors				= request.getParameter("floors");
		kitchen_room		= request.getParameter("kitchen_room");
		parking				= request.getParameter("parking");
		lawn				= request.getParameter("lawn");
		comment				= request.getParameter("comment");
		
		city				= request.getParameter("city");
		locality			= request.getParameter("locality");
		sub_locality		= request.getParameter("sub_locality");
		landmark			= request.getParameter("landmark");
		
		hall_rent			= request.getParameter("hall_rent");
		maintenance			= request.getParameter("maintenance");
		electricity			= request.getParameter("electricity");
		lawn_space			= request.getParameter("lawn_space");
		
		power_backup		= request.getParameter("power_backup");
		lift_in_building	= request.getParameter("lift_in_building");
		security			= request.getParameter("security");
		maintenance_staff	= request.getParameter("maintenance_staff");
		
		contact_name		= request.getParameter("contact_name");
		mobile_no			= request.getParameter("mobile_no");
		email_id			= request.getParameter("email_id");
		address				= request.getParameter("address");
		
		decoration			= request.getParameter("decoration");
		catering 			= request.getParameter("catering");
		
		PreparedStatement ps 	= null;
		ResultSet rs 			= null;
		try {
			
			ps = null;			
			ps = conn.prepareStatement(Queries.queryGetExistingHallCount);
			rs = ps.executeQuery();
			
			if(rs.next()){
				int hallCount = rs.getInt("Count");
				if(hallCount == 0) {
					hallId = "H1001";
				} else {
					int myInt = hallCount + 1001;
					String nextHallId = String.format("%04d", myInt);
					hallId = "H"+nextHallId;
				}
			}
			userId  = LoginServlet.userId;
			
			ps = null;
			ps = conn.prepareStatement(Queries.queryInsertHallDetails);
			ps.setString(1, hallId);
			ps.setString(2, hall_name);
			ps.setString(3, hall_type);
			ps.setString(4, area_sqft);
			ps.setString(5, no_of_rooms);
			ps.setString(6, floors);
			ps.setString(7, kitchen_room);
			ps.setString(8, parking);
			ps.setString(9, lawn);
			ps.setString(10, comment);
			
			ps.setString(11, city);
			ps.setString(12, locality);
			ps.setString(13, sub_locality);
			ps.setString(14, landmark);
			
			ps.setString(15, hall_rent);
			ps.setString(16, maintenance);
			ps.setString(17, electricity);
			ps.setString(18, lawn_space);
		
			ps.setString(19, power_backup);
			ps.setString(20, lift_in_building);
			ps.setString(21, security);
			ps.setString(22, maintenance_staff);
			
			ps.setString(23, contact_name);
			ps.setString(24, mobile_no);
			ps.setString(25, email_id);
			ps.setString(26, address);
			
			ps.setString(27, decoration);
			ps.setString(28, catering);
			ps.setString(29, userId);
			
			ps.executeUpdate();
			
			String check = "regSuccess";
			request.setAttribute("checkIt", check);
			request.getRequestDispatcher("merchant_addHall.jsp").forward(request, response);

			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
