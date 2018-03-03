package hrs.queries;

public class Queries {

	//Login Page
	public static String queryCheckLoginDetails  	= " Select * from LoginDetails where UserName = ? and Password = ? and UserRole = ?";
	
	//Registration
	public static String queryCheckRegistration  	= " Select * from Registration where UserName = ?";
	public static String queryInsertRegDetails   	= " Insert into Registration (Name, EmailId, ContactNo, Address, UserName, IsActive, CreatedDate) VALUES (?,?,?,?,?,?,?)" ;
	public static String queryInsertLoginDetails    = " Insert into LoginDetails (UserName, Password, UserRole, UserId, CreatedDate) VALUES (?,?,?,?,?) ";
	public static String queryGetExistingUserCount 	= " Select Count (UserName) As Count from LoginDetails where UserRole = ? ";
	
	//Hall Details
	 public static String queryGetExistingHallCount  = " Select Count (Hall_Id) As Count from HallDetails ";
	 public static String queryInsertHallDetails 	 = " Insert into HallDetails (Hall_Id, Hall_Name, Hall_Type, Area, Rooms, Floors, Kitchen_room, Parking, Lawn, Comment, City, Locality, Sub_Locality, Landmark, Hall_Rent, Maintenance, Electricity, Lawn_Space, Power_Backup, Lift, Security, Staff, Contact_Name, Mobile_No, EmailId, Address, Decoration, Catering, UserId) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";

	// Profile Update
	public static String queryUpdateProfile  = " Update Registration set Name = ?, EmailId = ?, ContactNo = ?, Address = ? where UserName = ?" ;	
	public static String queryUpdateHallDetails 	 = " Update HallDetails set Hall_Name = ? , Hall_Type = ? , Area = ? , Rooms = ? , Floors = ? , Kitchen_room = ? , Parking = ? , Lawn = ? , Comment = ? , City = ? , Locality = ? , Sub_Locality = ? , Landmark = ? , Hall_Rent = ? , Maintenance = ? , Electricity = ? , Lawn_Space = ? , Power_Backup = ? , Lift = ? , Security = ? , Staff = ? , Contact_Name = ? , Mobile_No = ? , EmailId = ? , Address = ? , Decoration = ? , Catering = ? where Hall_Id = ? ";

}
