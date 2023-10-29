package clickashowbooking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Db {
	private static Connection obj = null;
	 
    // private constructor to force use of
    // getInstance() to create Singleton object
    private Db() {}
 
    public static Connection getInstance() throws SQLException, ClassNotFoundException
    {
        if (obj==null) {
    		Class.forName("com.mysql.jdbc.Driver");  
    		obj=DriverManager.getConnection("jdbc:mysql://localhost:3306/cinemabookingsystem","root","Deshitha@123");
        }
        return obj;
    }
}
