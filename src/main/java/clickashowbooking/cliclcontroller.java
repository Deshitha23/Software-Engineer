package clickashowbooking;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class cliclcontroller {
	
	private Connection con = null;
	Encryption enc = new Encryption();
	private String key = "secure";

	private Connection connect() throws ClassNotFoundException, SQLException {
		
		
		Class.forName("com.mysql.jdbc.Driver");  
		return con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cinemabookingsystem","root","Deshitha@123");
	}
	private void disconnect() throws ClassNotFoundException, SQLException {
			con.close()	;
	}
	
	@RequestMapping(value="/sample", method=RequestMethod.GET)
	@ResponseBody
	public String sample(@RequestParam("id") String id)
	{
		JSONObject j = new JSONObject();
		j.put("k","v");
		return j.toString();
		
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView getLoginPage()
	{
		ModelAndView mv = new ModelAndView("login");
		return mv;
		
	}
	
	
	@RequestMapping(value="/Managepromotions", method=RequestMethod.GET)
	public ModelAndView getmanageprom()
	{
		ModelAndView mv = new ModelAndView("manageprom");
		return mv;
		
	}
	
	
	@RequestMapping(value="/addmovies", method=RequestMethod.GET)
	public ModelAndView getaddmovies()
	{
		ModelAndView mv = new ModelAndView("addmovie");
		return mv;
		
	}
	
	@RequestMapping(value="/promoslist", method=RequestMethod.GET)
	public ModelAndView getpromoslist()
	{
		ModelAndView mv = new ModelAndView("promoslist");
		return mv;
		
	}
	
	@RequestMapping(value="/moviepage", method=RequestMethod.GET)
	public ModelAndView moviepage(@RequestParam("movie") int id) throws ClassNotFoundException, SQLException
	{
		connect();

		JSONObject json = new JSONObject();
	
		PreparedStatement stmt=con.prepareStatement("select * from movie where movieid=?;");  
		stmt.setInt(1,id); 
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			
			json.put("title",rs.getString("title"));
			json.put("mid",rs.getInt("movieid"));
			json.put("category",rs.getString("genre"));
			json.put("director",rs.getString("Director"));
			json.put("producer",rs.getString("Producer"));
			json.put("cast",rs.getString("castmem"));
			json.put("synopsis",rs.getString("synopsis"));
			json.put("review",rs.getString("review"));
			json.put("rating",rs.getString("rating"));
			json.put("trailer",rs.getString("trailer"));
			json.put("image",rs.getString("picture"));
			json.put("status",rs.getString("status"));
			json.put("language",rs.getString("language"));
			json.put("releasedate",rs.getString("releasedate"));
			json.put("duration",rs.getString("duration"));



			
		}
		ModelAndView mv = new ModelAndView("moviedata");
		mv.addObject("movie",json.toString());
		return mv;
		

		
	}
	
	@RequestMapping(value = "/booktickets", method = RequestMethod.GET)
	public ModelAndView getdates(@RequestParam("movieid") String movieid,@RequestParam("title") String title,HttpServletRequest request) throws ClassNotFoundException, SQLException {
		connect();

 		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
 		
		PreparedStatement stmt = con.prepareStatement("select distinct showdate from schedule where movieid=?;");
		
		stmt.setInt(1,Integer.parseInt(movieid)); 
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			array.put(rs.getString("showdate"));
		}
		json.put("movieid",movieid);
		json.put("showdates", array);
		json.put("title",title);

			
		
		ModelAndView mv = new ModelAndView("booktickets");
		mv.addObject("showdates",json.toString());
		return mv;
		



	}
	
	@RequestMapping(value = "/getshows", method = RequestMethod.GET)
	@ResponseBody
	public String getShowTimings(@RequestParam("movieid") String movieid,@RequestParam("showdate") String showdate,HttpServletRequest request) throws ClassNotFoundException, SQLException {
		connect();

 		JSONObject obj;
		JSONArray array = new JSONArray();
 		
		PreparedStatement stmt = con.prepareStatement("select * from schedule where movieid=? and showdate=?;");
		
		stmt.setInt(1,Integer.parseInt(movieid));
		stmt.setString(2,showdate); 

		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			obj = new JSONObject();
			obj.put("screen", rs.getInt("Screen"));
			obj.put("showtime", rs.getString("showtime"));

			array.put(obj);
		}
		
		
		return array.toString();
		



	}
	

	
	
	@RequestMapping(value="/Managemovies", method=RequestMethod.GET)
	public ModelAndView getmanagemovies()
	{
		ModelAndView mv = new ModelAndView("managemovies");
		return mv;
		
	}
	
	@RequestMapping(value="/schedulemovie", method=RequestMethod.GET)
	public ModelAndView getschedulemovie(@RequestParam("movie") int id)
	{
		ModelAndView mv = new ModelAndView("schedulemovie");
		mv.addObject("movieid",id);
		return mv;
		
	}
	
	@RequestMapping(value="/manageusers", method=RequestMethod.GET)
	public ModelAndView getmanageusers()
	{
		ModelAndView mv = new ModelAndView("manageusers");
		return mv;
		
	}
	
	@RequestMapping(value="/searchres", method=RequestMethod.GET)
	public ModelAndView getsearchresults()
	{
		ModelAndView mv = new ModelAndView("searchres");
		return mv;
		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView doLogout(HttpServletRequest request) {
		try {
			disconnect();


			request.getSession().removeAttribute("Username");
			request.getSession().removeAttribute("userid");

			ModelAndView mav = new ModelAndView("login");
			return mav;
			
		} 
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public ModelAndView getAdminPage(ModelAndView mv,HttpServletRequest request)
	{
		if (request.getSession().getAttribute("Username") == null
				|| request.getSession().getAttribute("Username").equals("")) {
			mv = new ModelAndView("login");
			return mv;
		}
		else {
		mv = new ModelAndView("admin");
		return mv;
		}
		
	}
	
	@RequestMapping(value="/editprofile", method=RequestMethod.GET)
	public ModelAndView geteditPage(HttpServletRequest request,ModelAndView mv)
	{
		if (request.getSession().getAttribute("Username") == null
				|| request.getSession().getAttribute("Username").equals("")) {
			mv = new ModelAndView("login");
			return mv;
		}
		else {
			mv = new ModelAndView("editprofile");
			return mv;
		}
		
		
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public ModelAndView getsignupPage()
	{
		ModelAndView mv = new ModelAndView("register1");
		return mv;
		
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView gethomeuserPage(HttpServletRequest request,ModelAndView mv)
	{
		
	
		 mv = new ModelAndView("home");
		return mv;
		
		
	}
	
//	@RequestMapping(value="/guestuser", method=RequestMethod.GET)
//	public ModelAndView getguestuserPage()
//	{
//		ModelAndView mv = new ModelAndView("home");
//		return mv;
//		
//	}
	
	
	@RequestMapping(value="/changepwd", method=RequestMethod.GET)
	public ModelAndView getpwdchangePage()
	{
		ModelAndView mv = new ModelAndView("changepwd");
		return mv;
	}
	@RequestMapping(value="/forgotpass", method=RequestMethod.GET)
	public ModelAndView getforgotpassPage()
	{
		ModelAndView mv = new ModelAndView("forgotpass");
		return mv;
		
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public String doLogin(@RequestParam("un") String un,@RequestParam("pwd") String pwd,
			HttpServletRequest request) throws ClassNotFoundException, SQLException
	{
		
		JSONObject json = new JSONObject();
		Connection con = connect();
		PreparedStatement ps = con.prepareStatement("select * from user where user_name = ?");
		ps.setString(1, un);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			if(rs.getInt("status") == 0) {
				json.put("Error","Your account is inactive. Kindly activate with the link sent to the email.");
				disconnect();
				return json.toString();
			}
		else if(rs.getInt("status") == 2) {
				json.put("Error","Your account has been suspended. Please contact the admin.");
				disconnect();
				return json.toString();
			}
			else if(rs.getInt("status") == 1 && enc.decrypt(rs.getString("password"),key).equals(pwd)){
				json.put("Success","correct credentials");
				json.put("role", rs.getInt("role"));
				request.getSession().setAttribute("userid",rs.getInt("user_id") );
				request.getSession().setAttribute("Username",rs.getString("user_name"));
				System.out.println(json.toString());
				return json.toString();

			}
			else {
				json.put("Error","username is correct but password is incorrect");
				disconnect();
				return json.toString();


			}
		}
		else {
			json.put("Error","user does not exist");
			disconnect();
			return json.toString();

		}
		
	}
	
	@RequestMapping(value="/getEmpData", method=RequestMethod.GET)
	@ResponseBody
	public String getData(@RequestParam("uid") int uid) throws ClassNotFoundException, SQLException
	{
		connect();
		JSONObject json = new JSONObject();
		PreparedStatement ps = con.prepareStatement("select * from user where user_id = ?");
		ps.setInt(1,uid);
		
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			json.put("email",rs.getString("email"));
			json.put("firstname",rs.getString("first_name"));
			json.put("lastname",rs.getString("last_name"));
			
			json.put("address",rs.getString("address"));
			json.put("description",rs.getString("description"));
			json.put("cardnumber",enc.decrypt(rs.getString("card_no"),key));
			json.put("cardnumber",enc.decrypt(rs.getString("card_no"),key));
			json.put("ctype",rs.getInt("cardtype"));

			json.put("nameoncard",rs.getString("cardname"));
			json.put("exmonth",enc.decrypt(rs.getString("expiry_month"),key));
			json.put("exyear",enc.decrypt(rs.getString("expiry_year"),key));

			json.put("cvv",enc.decrypt(rs.getString("cvv"),key));
			return json.toString();

		}
		return null;
		
		
	}
	
	@RequestMapping(value = "/activateAcc", method = RequestMethod.GET)
	public ModelAndView activate(@RequestParam("userid") String userid,ModelAndView mv,HttpServletRequest request) throws ClassNotFoundException, SQLException {
			connect();
			PreparedStatement ps = con.prepareStatement("update user set status=? where user_id=?");
			ps.setInt(1,1);
			ps.setInt(2, Integer.parseInt(userid));
			int i = ps.executeUpdate();
			if(i>0) {
				mv = new ModelAndView("activated");
				return mv;
			}
			return mv;
			
	}
	
	@RequestMapping(value="/createAcc", method=RequestMethod.POST)
	@ResponseBody
	public String addEmp(@RequestParam("fn") String fn,
			@RequestParam("ln") String ln,@RequestParam("un") String un,
			@RequestParam("emailaddress") String email,@RequestParam("mobilenumber") String number,
			@RequestParam("pass") String pass,
			@RequestParam("gen") String gender, @RequestParam("promo") String promotion,
			@RequestParam("date") String dob,@RequestParam("add") String add,
			@RequestParam("cardtype") String ctype,@RequestParam("cardn") String cardn,
			@RequestParam("cardnumber") String cardno,@RequestParam("exmonth") String exmonth,
			@RequestParam("exyear") String exyear,
			@RequestParam("cv") String cvv)  throws ClassNotFoundException, SQLException
	{
		System.out.println("called ");
		connect();

		JSONObject json = new JSONObject();
		PreparedStatement stmt1 = con.prepareStatement("select * from user where user_name=?");
		stmt1.setString(1,un);
		ResultSet rs = stmt1.executeQuery();
		if(rs.next()) {
			
			json.put("error", "Username already exists");
			System.out.println(json.toString());

			return json.toString();


		}
//		stmt1 = con.prepareStatement("select * from user where email=?");
//		stmt1.setString(1,email);
//		 rs = stmt1.executeQuery();
//		if(rs.next()) {
//			
//			json.put("error", "email already exists");
//			System.out.println(json.toString());
//
//			return json.toString();
//
//		}
		 stmt1 = con.prepareStatement("select * from user where MobileNumber=?");
		stmt1.setString(1,number);
		 rs = stmt1.executeQuery();
		if(rs.next()) {
			
			json.put("error", "Mobile number already exists");
			System.out.println(json.toString());

			return json.toString();


		}
		PreparedStatement ps = con.prepareStatement("insert into user(password,First_Name,Last_Name,email,MobileNumber,status,role,DOB,Promotions,user_name,Address,cardname,cardtype,card_no,expiry_month,expiry_year,cvv,gender)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,enc.encrypt(pass,key));
		ps.setString(2,fn);
		ps.setString(3,ln);	
		ps.setString(4,email);	
		ps.setString(5,number);	
		ps.setInt(6,0);	
		
		ps.setInt(7,2);		
		ps.setString(8,dob);		
		ps.setInt(9,Integer.parseInt(promotion));	
		ps.setString(10,un);
		ps.setString(11,add);		
		ps.setString(12,cardn);	
		ps.setInt(13,Integer.parseInt(ctype));	

		ps.setString(14,enc.encrypt(cardno,key));
		ps.setString(15,enc.encrypt(exmonth,key));
		ps.setString(16,enc.encrypt(exyear,key));		

		ps.setString(17,enc.encrypt(cvv,key));		
		ps.setString(18,gender);		

		int records = ps.executeUpdate();
		ps=con.prepareStatement("select user_id from user where user_name=?");
		ps.setString(1,un);
		 rs = ps.executeQuery();
		String uid="";
		if(rs.next()) {
			uid += Integer.toString(rs.getInt("user_id")); 
		}
		


		if(records > 0) {
			String Subject = "Registration done";
			String body = "You are successfully registered to click a show movies. Your account is not activated. Please activate your account.\n<a href='http://localhost:8080/clickashow/activateAcc?userid="+uid + "'>Activate</a>";


			try {
				
				Properties props = new Properties();
				props.put("mail.smtp.auth","true");
				props.put("mail.smtp.starttls.enable","true");
				props.put("mail.smtp.host","smtp.gmail.com");
				props.put("mail.smtp.port","587");
				props.put("mail.smtp.from","deshithabollina@gmail.com");

				Authenticator auth = new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("deshithabollina@gmail.com","zbgwrlunjgfbiutq");
					}
				};
				Session session = Session.getInstance(props, auth);

				Message message = new MimeMessage(session);
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
				message.setSubject(Subject);
				Multipart mp = new MimeMultipart();
				BodyPart bp = new MimeBodyPart();
				bp.setText(body);
				mp.addBodyPart(bp);
				message.setContent(mp);
				Transport.send(message);
				json.put("success", "registration successful");
				System.out.println(json.toString());

				return json.toString();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception: " + e.getMessage());
				

			}

			

		}
		else {
			json.put("error", "registration failed");
			System.out.println(json.toString());
			return json.toString();
		}
		return "";
	}
		
		

	
	@RequestMapping(value="/editempdata", method=RequestMethod.POST)
	@ResponseBody
	public String editData(@RequestParam("uid") int uid,
			@RequestParam("fname") String firstname, @RequestParam("lname") String lastname,
			 @RequestParam("address") String address,
			@RequestParam("cname") String description, @RequestParam("cno") String cardno,
			@RequestParam("csname") String nameoncard, @RequestParam("exmonth") String exmonth,
			@RequestParam("exyear") String exyear,			@RequestParam("cardtype") String ctype,

			@RequestParam("cvv") String cvv) throws ClassNotFoundException, SQLException
	{
		
		JSONObject json = new JSONObject();
		PreparedStatement ps = con.prepareStatement("update user set first_name=?,last_name=?,address=?,description=?,card_no=?,cardname=?,cardtype=?,expiry_month=?,expiry_year=?,cvv=? where user_id=?");
		ps.setString(1,firstname);
		ps.setString(2,lastname);
		
		ps.setString(3,address);
		ps.setString(4,description);
		ps.setString(5,enc.encrypt(cardno,key));
		ps.setString(6,nameoncard);
		ps.setString(7,ctype);

		ps.setString(8,enc.encrypt(exmonth,key));
		ps.setString(9,enc.encrypt(exyear,key));

		ps.setString(10,enc.encrypt(cvv,key));
		ps.setInt(11,uid);		
		int records = ps.executeUpdate();
		if(records > 0) {
			json.put("Success","Updated successfully");
			return json.toString();

		}
		else {
			json.put("Error","Failed");
			return json.toString();
		}
		
		
	}




@RequestMapping(value="/changepass", method=RequestMethod.POST)
@ResponseBody
public String editpass(@RequestParam("uid") int uid,
		@RequestParam("oldpwd") String opwd, @RequestParam("newpwd") String npwd )throws ClassNotFoundException, SQLException
{
	System.out.println("called");
	JSONObject json = new JSONObject();
	PreparedStatement ps1 = con.prepareStatement("select password from user where user_id = ?");
	ps1.setInt(1,uid);
			
	ResultSet rs  = ps1.executeQuery();
	if(rs.next())
	{
		String pass = enc.decrypt(rs.getString("password"),key);
		if(opwd.equals(pass)) {
			PreparedStatement ps = con.prepareStatement("update user set password=? where user_id=?");
			ps.setString(1,enc.encrypt(npwd,key));
			ps.setInt(2,uid);		
			int records = ps.executeUpdate();
			if(records > 0) {
				json.put("Success","Updated successfully");
				System.out.println(json.toString());
				return json.toString();

			}
			else {
				json.put("Error","Failed");
				System.out.println(json.toString());

				return json.toString();
			}
			
		}
		else
		{
			json.put("Error","Enter correct old password");
			System.out.println(json.toString());

			return json.toString();
		}
	
	
	
}
	return "";
	
	
}
@RequestMapping(value="/testUser", method=RequestMethod.POST)
@ResponseBody
public String testUser(@RequestParam("un") String username) throws ClassNotFoundException, SQLException
{
	connect();
	JSONObject json = new JSONObject();
	PreparedStatement ps = con.prepareStatement("select * from user where user_name = ?");
	ps.setString(1,username);
	
	
	ResultSet rs = ps.executeQuery();
	if(rs.next()) {
		
		String query = "select email from user where user_name=?";
		String email = "";
		PreparedStatement stmt1=con.prepareStatement(query);  
		stmt1.setString(1,username); 
		ResultSet rs1 = stmt1.executeQuery();
		if (rs1.next()) {
			email = rs1.getString("email");
			Random random = new Random();
			
			String otp = String.format("%03d", random.nextInt(999));


			String otpQuery = "update user set OTP =? where user_name=?";
			PreparedStatement stmt2=con.prepareStatement(otpQuery);  
			stmt2.setString(1,otp);
			stmt2.setString(2,username);

			int i = stmt2.executeUpdate();
			if(i>0) {
				String Subject = "Verification of user";
				String body = "OTP is: " + otp;


				try {
					
					Properties props = new Properties();
					props.put("mail.smtp.auth","true");
					props.put("mail.smtp.starttls.enable","true");
					props.put("mail.smtp.host","smtp.gmail.com");
					props.put("mail.smtp.port","587");
					props.put("mail.smtp.from","deshithabollina@gmail.com");

					Authenticator auth = new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication("deshithabollina@gmail.com","zbgwrlunjgfbiutq");
						}
					};
					Session session = Session.getInstance(props, auth);

					Message message = new MimeMessage(session);
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
					message.setSubject(Subject);
					Multipart mp = new MimeMultipart();
					BodyPart bp = new MimeBodyPart();
					bp.setText(body);
					mp.addBodyPart(bp);
					message.setContent(mp);
					Transport.send(message);
				}

				catch (Exception e) {
					e.printStackTrace();
					System.out.println("Exception: " + e.getMessage());
					

				}
				json.put("Success","OTP Sent");
				return json.toString();

				
			}
			
		}
		
		
		 
		

	}
	else {
		json.put("Error","user does not exist");
		return json.toString();
	}
	return null;
	
	
}

@RequestMapping(value="/verifycode", method=RequestMethod.POST)
@ResponseBody
public String getData(@RequestParam("un") String username,@RequestParam("code") String otp) throws ClassNotFoundException, SQLException
{
	connect();

	
	JSONObject json = new JSONObject();
	PreparedStatement ps = con.prepareStatement("select otp from user where user_name = ?");
	ps.setString(1,username);
	
	
	ResultSet rs = ps.executeQuery();
	if(rs.next()) {
		String otp1 = rs.getString("OTP");
		if(otp1.equals(otp)) {
			json.put("Success","user verified");
			return json.toString();

		}
		else {
			json.put("Error","incorrect otp entered");
			return json.toString();
		}
		

	}
	return null;
	
	
}

@RequestMapping(value="/resetPassword", method=RequestMethod.POST)
@ResponseBody
public String resetPassword(@RequestParam("un") String username,@RequestParam("pass") String password) throws ClassNotFoundException, SQLException
{
	connect();

	
	JSONObject json = new JSONObject();
	PreparedStatement ps = con.prepareStatement("update user set password=? where user_name = ?");
	
	ps.setString(1,enc.encrypt(password,key));
	
	ps.setString(2,username);

	int i = ps.executeUpdate();
	if(i>0) {
		json.put("Success","Password reset successful");
		return json.toString();

	}
	else {
		json.put("Error","Failed");
		return json.toString();
	}
	
	
}






@RequestMapping(value="/promo", method=RequestMethod.POST)
@ResponseBody
public String editpromo(@RequestParam("promocode") String promocode,
		@RequestParam("discountval") int discountval, @RequestParam("startdate") String startdate,
		 @RequestParam("enddate") String enddate) throws ClassNotFoundException, SQLException, ParseException
{
	connect();
	JSONObject json = new JSONObject();
	String currentdate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date ed = sdf.parse(enddate);
    Date cd = sdf.parse(currentdate);
    
    int result = ed.compareTo(cd);
    if(result<0) {
		json.put("Error","End date is before current date. could not add promotion");
		return json.toString();  

    }
	PreparedStatement ps = con.prepareStatement("insert into promotions(promocode,Discount,StartDate,EndDate)values(?,?,?,?)");
	ps.setString(1,promocode);
	ps.setInt(2,discountval);
	
	ps.setString(3,startdate);
	ps.setString(4,enddate);
			
	int records = ps.executeUpdate();
	if(records > 0) {
		json.put("Success","Promotion added successfully");
		return json.toString();

	}
	else {
		json.put("Error","Failed");
		return json.toString();
	}
	
	
}



@RequestMapping(value="/addmovie", method=RequestMethod.POST)
@ResponseBody
public String addmovie(@RequestParam("title") String title,
		@RequestParam("genre") String genre, @RequestParam("synopsis") String synopsis,
		 @RequestParam("cast") String cast,@RequestParam("director") String director,
@RequestParam("producer") String producer, @RequestParam("rating") String rating)throws ClassNotFoundException, SQLException
{
	connect();
	JSONObject json = new JSONObject();
	PreparedStatement ps = con.prepareStatement("insert into movie(Title,Castmem,Genre,Synopsis,Director,Producer,Rating)values(?,?,?,?,?,?,?)");
	ps.setString(1,title);
	ps.setString(2,cast);
	
	ps.setString(3,genre);
	ps.setString(4,synopsis);
	ps.setString(5,director);
	ps.setString(6,producer);
	ps.setString(7,rating);
			
	int records = ps.executeUpdate();
	if(records > 0) {
		json.put("success","Updated successfully");
		return json.toString();

	}
	else {
		json.put("Error","Failed");
		return json.toString();
	}
	
	
}




@RequestMapping(value="/getuserData", method=RequestMethod.GET)
@ResponseBody
public String getuserData() throws ClassNotFoundException, SQLException
{
	
	JSONArray array = new JSONArray();
	connect();
	PreparedStatement ps = con.prepareStatement("select * from user where role = ?;");
	ps.setInt(1,2);
	
	JSONObject json;
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()) {
		json = new JSONObject();
		//json.put("email",rs.getString("email"));
		json.put("firstname",rs.getString("First_name"));
		json.put("lastname",rs.getString("Last_name"));
		json.put("status",rs.getString("status"));

		json.put("role",rs.getString("role"));
		json.put("id",rs.getInt("user_id"));
		json.put("email",rs.getString("email"));

		//json.put("description",rs.getString("description"));
		//json.put("cardnumber",enc.decrypt(rs.getString("card_no"),key));
		//json.put("nameoncard",rs.getString("cardname"));
		//json.put("expdate",enc.decrypt(rs.getString("expdate"),key));
		//json.put("cvv",enc.decrypt(rs.getString("cvv"),key));
		array.put(json);

	}
	return array.toString();

	
}


@RequestMapping(value="/search", method=RequestMethod.POST)
@ResponseBody
public String getsearch(@RequestParam("search") String search)throws ClassNotFoundException, SQLException
{
	JSONArray array = new JSONArray();
	connect();
	JSONObject json ;
	PreparedStatement ps = con.prepareStatement("select * from movie where upper(title)=? OR upper(genre)=?");
	ps.setString(1,search.toUpperCase());
	ps.setString(2,search.toUpperCase());
	
	
			
	ResultSet rs = ps.executeQuery();
	while(rs.next()) {
		json = new JSONObject();
		json.put("title",rs.getString("Title"));
		json.put("rating",rs.getString("rating"));
		json.put("trailer",rs.getString("trailer"));
		json.put("picture",rs.getString("picture"));
		json.put("movieid",rs.getInt("movieid"));
		json.put("status",rs.getInt("status"));

		array.put(json);
	

	}
	System.out.println(array.toString());
	return array.toString();
	
	
	
}


@RequestMapping(value="/getmovieslist", method=RequestMethod.GET)
@ResponseBody
public String getmovieslist() throws ClassNotFoundException, SQLException
{
	
	JSONArray array = new JSONArray();
	connect();
	PreparedStatement ps = con.prepareStatement("select * from movie;");
	//ps.setInt(1,uid);
	
	JSONObject json;
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()) {
		json = new JSONObject();
		json.put("movieid",rs.getInt("movieid"));

		json.put("title",rs.getString("Title"));
		json.put("genre",rs.getString("Genre"));
		json.put("cast",rs.getString("Castmem"));
		//json.put("synopsis",rs.getString("Synopsis"));

		json.put("producer",rs.getString("Producer"));
		json.put("director",rs.getString("Director"));
		//json.put("rating",enc.decrypt(rs.getString("card_no"),key));
		json.put("rating",rs.getString("Rating"));
		//json.put("expdate",enc.decrypt(rs.getString("expdate"),key));
		//json.put("cvv",enc.decrypt(rs.getString("cvv"),key));
		array.put(json);

	}
	return array.toString();

	
}



@RequestMapping(value="/getpromolist", method=RequestMethod.GET)
@ResponseBody
public String getpromolist() throws ClassNotFoundException, SQLException
{
	
	JSONArray array = new JSONArray();
	connect();
	PreparedStatement ps = con.prepareStatement("select * from promotions ");
	//ps.setInt(1,uid);
	
	JSONObject json;
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()) {
		json = new JSONObject();
		json.put("discount",rs.getString("Discount"));
		json.put("startdate",rs.getString("startdate"));
		json.put("enddate",rs.getString("enddate"));
		//json.put("synopsis",rs.getString("Synopsis"));

		json.put("promocode",rs.getString("promocode"));
		json.put("PromoID",rs.getInt("PromoID"));
		json.put("sent",rs.getInt("sent"));

		//json.put("director",rs.getString("Director"));
		//json.put("rating",enc.decrypt(rs.getString("card_no"),key));
		//json.put("rating",rs.getString("Rating"));
		//json.put("expdate",enc.decrypt(rs.getString("expdate"),key));
		//json.put("cvv",enc.decrypt(rs.getString("cvv"),key));
		array.put(json);

	}
	return array.toString();

	
}



@RequestMapping(value="/sendPromotion", method=RequestMethod.POST)
@ResponseBody
public String sendp(@RequestParam("code") String pcode) throws ClassNotFoundException, SQLException
{
	
	connect();
	JSONObject json = new JSONObject();
	PreparedStatement stmt=con.prepareStatement("select * from promotions where promocode=?");
	stmt.setString(1,pcode);
	ResultSet rs = stmt.executeQuery();
	String promocode="";
	int discount=0;
	String startdate="";
	String enddate="";

	if(rs.next()) {
		promocode = rs.getString("promocode");
		discount = rs.getInt("discount");
		startdate = rs.getString("startdate");
		enddate = rs.getString("enddate");

	}
	stmt=con.prepareStatement("update promotions set sent=? where promocode=?");
	stmt.setInt(1,1);
	stmt.setString(2,pcode);
	
	int i = stmt.executeUpdate();  
	if(i>0) {
		stmt=con.prepareStatement("select email,first_name from user where promotions=?");
		stmt.setInt(1,1);
		
		 rs = stmt.executeQuery();
		while(rs.next()) {
			String Subject = "Click a show promotion code";
			String body = "Hi " + rs.getString("first_name") + ",\n\nPromotion details:\nCode: " + promocode + "\nDiscount: " + discount + "%" + "\nValidity: " + startdate + " to " + enddate + "\n\nThank you,\nClick a show movies";


			try {
				Properties props = new Properties();
				props.put("mail.smtp.auth","true");
				props.put("mail.smtp.starttls.enable","true");
				props.put("mail.smtp.host","smtp.gmail.com");
				props.put("mail.smtp.port","587");
				props.put("mail.smtp.from","deshithabollina@gmail.com");

				Authenticator auth = new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("deshithabollina@gmail.com","zbgwrlunjgfbiutq");
					}
				};
				Session session = Session.getInstance(props, auth);
				
				Message message = new MimeMessage(session);
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(rs.getString("email")));
				message.setSubject(Subject);
				Multipart mp = new MimeMultipart();
				BodyPart bp = new MimeBodyPart();
				bp.setText(body);
				mp.addBodyPart(bp);
				message.setContent(mp);
				Transport.send(message);
			}

			catch (Exception e) {
				e.printStackTrace();
				

			}			
		}
		
		
		
		json.put("success","Promotion sent successfully to all subscribed users");
		return json.toString();

	}
	return "";

	
	
}

@RequestMapping(value = "/editPromotion", method = RequestMethod.POST)
@ResponseBody
public String editPromotion(@RequestParam("promoid") String promoid,@RequestParam("promocode") String promocode,@RequestParam("discount") String dis,
		@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
		HttpServletRequest request) throws ClassNotFoundException, SQLException {
	connect();
	JSONObject json = new JSONObject();

	PreparedStatement stmt=con.prepareStatement("update promotions set discount=?,startdate=?,enddate=?,promocode=? where promoid=?;");  
	stmt.setInt(1,Integer.parseInt(dis)); 
	stmt.setString(2,startdate); 
	stmt.setString(3,enddate); 
	stmt.setString(4,promocode); 
	stmt.setInt(5,Integer.parseInt(promoid)); 


	int i = stmt.executeUpdate();  
	if(i>0) {
		json.put("success","Promotion edited successfully.");
		System.out.println(json.toString());
		return json.toString();  

		
	}
	return null;



}

@RequestMapping(value = "/suspend", method = RequestMethod.POST)
@ResponseBody
public String suspend(@RequestParam("userid") String userid,@RequestParam("email") String email,
		@RequestParam("username") String name,HttpServletRequest request) throws ClassNotFoundException, SQLException {
	connect();
	JSONObject json = new JSONObject();
	System.out.println(email);
	PreparedStatement stmt=con.prepareStatement("update user set status=? where user_id=?;");  
	stmt.setInt(1,2);
	stmt.setInt(2,Integer.parseInt(userid));

	int i = stmt.executeUpdate();  
	if(i>0) {
		String Subject = "Your account has been suspended";
		String body = "Hi " + name + ",\n\nYour account has been suspended.\n\nThank you,\nClick a show Movies";


		try {
			Properties props = new Properties();
			props.put("mail.smtp.auth","true");
			props.put("mail.smtp.starttls.enable","true");
			props.put("mail.smtp.host","smtp.gmail.com");
			props.put("mail.smtp.port","587");
			props.put("mail.smtp.from","deshithabollina@gmail.com");

			Authenticator auth = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("deshithabollina@gmail.com","zbgwrlunjgfbiutq");
				}
			};
			Session session = Session.getInstance(props, auth);
			Message message = new MimeMessage(session);
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject(Subject);
			Multipart mp = new MimeMultipart();
			BodyPart bp = new MimeBodyPart();
			bp.setText(body);
			mp.addBodyPart(bp);
			message.setContent(mp);
			Transport.send(message);
		}

		catch (Exception e) {
			e.printStackTrace();
			

		}

		json.put("success","User is suspended");
		return json.toString();

	}
	return null;


}

@RequestMapping(value = "/unsuspend", method = RequestMethod.POST)
@ResponseBody
public String unsuspendUser(@RequestParam("userid") String userid,@RequestParam("email") String email,
		@RequestParam("username") String name,HttpServletRequest request) throws ClassNotFoundException, SQLException {
	connect();
	JSONObject json = new JSONObject();

	PreparedStatement stmt=con.prepareStatement("update user set status=? where user_id=?;");  
	stmt.setInt(1,1);
	stmt.setInt(2,Integer.parseInt(userid));

	int i = stmt.executeUpdate();  
	if(i>0) {
		String Subject = "Good News. Your account has been unsuspended now. ";
		String body = "Hi " + name + ",\n\nYour account is unsuspended.\n\nThank you,\nClick a show movies";


		try {
			Properties props = new Properties();
			props.put("mail.smtp.auth","true");
			props.put("mail.smtp.starttls.enable","true");
			props.put("mail.smtp.host","smtp.gmail.com");
			props.put("mail.smtp.port","587");
			props.put("mail.smtp.from","deshithabollina@gmail.com");

			Authenticator auth = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("deshithabollina@gmail.com","zbgwrlunjgfbiutq");
				}
			};
			Session session = Session.getInstance(props, auth);
			
			Message message = new MimeMessage(session);
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject(Subject);
			Multipart mp = new MimeMultipart();
			BodyPart bp = new MimeBodyPart();
			bp.setText(body);
			mp.addBodyPart(bp);
			message.setContent(mp);
			Transport.send(message);
		}

		catch (Exception e) {
			e.printStackTrace();
			

		}

		json.put("success","User is unsuspended.");
		return json.toString();

	}
	return null;


}

@RequestMapping(value = "/addMovie", method = RequestMethod.POST)
@ResponseBody
public String addMovie(@RequestParam("title") String title,@RequestParam("category") String category,
		@RequestParam("director") String director,@RequestParam("producer") String producer,@RequestParam("cast") String cast,
		@RequestParam("synopsis") String synopsis,@RequestParam("review") String review,@RequestParam("rating") String rating,
		@RequestParam("trailer") String trailer,@RequestParam("picture") String picture,
		@RequestParam("language") String language,@RequestParam("releasedate") String releasedate,
		@RequestParam("duration") String duration,HttpServletRequest request) throws ClassNotFoundException, SQLException {
	
      
      Path result = null;
      try {
         result = Files.move(Paths.get("C:/deshi docs/movies/" + picture), Paths.get("C:/Users/deshi/eclipse-workspace/clickashow/src/main/webapp/" + picture));
      } catch (IOException e) {
         System.out.println("Exception while moving file: " + e.getMessage());
      }
      if(result != null) {
         System.out.println("File moved successfully.");
      }else{
         System.out.println("File movement failed.");
      }
	connect();
	
	JSONObject json = new JSONObject();

	PreparedStatement stmt=con.prepareStatement("insert into movie(title,genre,director,producer,castmem,synopsis,review,rating,trailer,picture,language,releasedate,duration)values(?,?,?,?,?,?,?,?,?,?,?,?,?);");  
	stmt.setString(1,title); 
	stmt.setString(2,category); 
	stmt.setString(3,director); 
	stmt.setString(4,producer); 
	stmt.setString(5,cast); 
	stmt.setString(6,synopsis); 
	stmt.setString(7,review); 
	stmt.setString(8,rating); 
	stmt.setString(9,"https://www.youtube.com/embed/" + trailer); 
	stmt.setString(10,picture); 
	stmt.setString(11,language); 
	stmt.setString(12,releasedate); 
	stmt.setString(13,duration); 



	int i = stmt.executeUpdate();  
	if(i>0) {

		json.put("success","Movie added successfully.");
		return json.toString();  

		
	}
	return null;



}

@RequestMapping(value = "/schedule", method = RequestMethod.POST)
@ResponseBody
public String scheduleMovie(@RequestParam("movieid") String movieid,@RequestParam("showdate") String showdate,
		@RequestParam("screen") String screen,@RequestParam("showtime") String showtime,HttpServletRequest request) throws ClassNotFoundException, SQLException {
	

	connect();
	
	JSONObject json = new JSONObject();
	
	PreparedStatement stmt = con.prepareStatement("select * from schedule where showdate=? and screen=? and showtime=?;");  
	stmt.setString(1,showdate); 
	stmt.setInt(2,Integer.parseInt(screen)); 
	stmt.setString(3,showtime); 
	ResultSet rs = stmt.executeQuery();
	if(rs.next()) {
		json.put("error","Show is already taken");
		return json.toString();
	}
	else {
		 stmt = con.prepareStatement("insert into schedule(movieid,showdate,screen,showtime)values(?,?,?,?);");  
			stmt.setInt(1,Integer.parseInt(movieid)); 
			stmt.setString(2,showdate); 
			stmt.setInt(3,Integer.parseInt(screen)); 
			stmt.setString(4,showtime); 
			stmt.executeUpdate();  
			
			stmt = con.prepareStatement("update movie set status=? where movieid=?");  
			stmt.setInt(1,1); 
			stmt.setInt(2,Integer.parseInt(movieid)); 
			stmt.executeUpdate();
			
			json.put("success","Movie scheduled successfully.");
			return json.toString();
	}
	
	



}



}



