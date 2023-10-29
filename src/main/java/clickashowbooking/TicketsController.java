package clickashowbooking;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

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
public class TicketsController {
	
	Encryption obj = new Encryption();
final private String sk = "secure";


	
	@RequestMapping(value = "/managecards", method = RequestMethod.GET)
	public ModelAndView getManageCardsPage(ModelAndView mv,HttpServletRequest request) {
		
		if (request.getSession().getAttribute("userid") == null
				|| request.getSession().getAttribute("userid").equals("")) {
			mv = new ModelAndView("login");
			return mv;
		} else {
			ModelAndView mav = new ModelAndView("managecards");
			return mav;
		}

	}
	
	@RequestMapping(value = "/bookinghistory", method = RequestMethod.GET)
	public ModelAndView getHistoryPage(ModelAndView mv,HttpServletRequest request) {
		if (request.getSession().getAttribute("userid") == null
				|| request.getSession().getAttribute("userid").equals("")) {
			mv = new ModelAndView("login");
			return mv;
		} else {
		ModelAndView mav = new ModelAndView("bookings");
		return mav;
		}
	}

	
	
		
	@RequestMapping(value = "/addcard", method = RequestMethod.POST)
	@ResponseBody
	public String addCard(@RequestParam("userid") String userid,@RequestParam("cardnumber") String cn,@RequestParam("ct") String ct,
			@RequestParam("emonth") String emonth,@RequestParam("eyear") String eyear,@RequestParam("cvv") String cvv,
			HttpServletRequest request) throws ClassNotFoundException, SQLException {
		Connection con = Db.getInstance();
		JSONObject json = new JSONObject();
		PreparedStatement stmt=con.prepareStatement("select * from paymentcard where UserId = ?");
		stmt.setInt(1,Integer.parseInt(userid));
		ResultSet rs = stmt.executeQuery();
		int count = 0;
		while(rs.next()) {
			count++;
		}
		if(count < 2) {
			stmt=con.prepareStatement("insert into paymentcard(UserId,CardType,CardNo,ExpiryMonth,ExpiryYear,CVV)values(?,?,?,?,?,?);");  
			stmt.setInt(1,Integer.parseInt(userid)); 
			stmt.setInt(2,Integer.parseInt(ct)); 
			stmt.setString(3,obj.encrypt(cn, sk)); 
			stmt.setString(4,obj.encrypt(emonth, sk)); 
			stmt.setString(5,obj.encrypt(eyear, sk)); 
			stmt.setString(6,obj.encrypt(cvv, sk)); 

		
			int i = stmt.executeUpdate();  
			if(i>0) {
				json.put("Success","Card added successfully.");
				return json.toString();  

				
			}
		}
		else {
			json.put("Error","Cannot add more than 3 cards");
			return json.toString();  

		}


		return "";



	}
	
	
	@RequestMapping(value = "/editcard", method = RequestMethod.POST)
	@ResponseBody
	public String editCard(@RequestParam("id") String id,@RequestParam("primary") String primary,@RequestParam("cardnumber") String cn,@RequestParam("ct") String ct,
			@RequestParam("emonth") String emonth,@RequestParam("eyear") String eyear,@RequestParam("cvv") String cvv,
			HttpServletRequest request) throws ClassNotFoundException, SQLException {
				Connection con = Db.getInstance();;
		JSONObject json = new JSONObject();
		if(primary.equals("no")) {
			PreparedStatement stmt=con.prepareStatement("update paymentcard set cardtype=?,cardno=?,expirymonth=?,expiryyear=?,cvv=? where paymentid=?;");
			stmt.setInt(1, Integer.parseInt(ct));
			stmt.setString(2, obj.encrypt(cn,sk));
			stmt.setString(3, obj.encrypt(emonth,sk));
			stmt.setString(4, obj.encrypt(eyear,sk));
			stmt.setString(5, obj.encrypt(cvv,sk));
			stmt.setInt(6,Integer.parseInt(id));
			int i = stmt.executeUpdate();
			if(i>0) {
				json.put("Success","Card edited successfully.");
				return json.toString();  

			}
		}
		else {
			PreparedStatement stmt=con.prepareStatement("update user set cardtype=?,card_no=?,expiry_month=?,expiry_year=?,cvv=? where user_id=?;");
			stmt.setInt(1, Integer.parseInt(ct));
			stmt.setString(2, obj.encrypt(cn,sk));
			stmt.setString(3, obj.encrypt(emonth,sk));
			stmt.setString(4, obj.encrypt(eyear,sk));
			stmt.setString(5, obj.encrypt(cvv,sk));
			stmt.setInt(6,Integer.parseInt(id));
			int i = stmt.executeUpdate();
			if(i>0) {
				json.put("Success","Card edited successfully.");
				return json.toString();  

			}
		}
		return "";
	}
	
	@RequestMapping(value = "/getCards", method = RequestMethod.GET)
	@ResponseBody
	public String getCards(@RequestParam("userid") String userid,
			HttpServletRequest request) throws ClassNotFoundException, SQLException {
				Connection con = Db.getInstance();;
		JSONObject json = null;
		JSONArray arr = new JSONArray();
		PreparedStatement stmt = con.prepareStatement("select * from user where User_Id = ?");
		stmt.setInt(1,Integer.parseInt(userid));
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			json = new JSONObject();
			json.put("id", rs.getString("user_id"));

			json.put("ct",rs.getInt("cardtype") == 1 ? "Credit" : "Debit");
			System.out.println(rs.getString("card_no"));
			String cardnumber = obj.decrypt(rs.getString("card_no"),sk);
			System.out.println(cardnumber);
			cardnumber = cardnumber.substring(cardnumber.length() - 4);
			json.put("cn", cardnumber);
			json.put("em",obj.decrypt(rs.getString("expiry_month"),sk));
			json.put("ey",obj.decrypt(rs.getString("expiry_year"),sk) );
			json.put("cvv", obj.decrypt(rs.getString("cvv"),sk));
			json.put("primary", "yes");
			arr.put(json);

		}
			stmt=con.prepareStatement("select * from paymentcard where userid = ?;"); 
			stmt.setInt(1,Integer.parseInt(userid));

			 rs = stmt.executeQuery();
			
			while(rs.next()) {
				json = new JSONObject();
				json.put("id", rs.getString("paymentid"));

				json.put("ct",rs.getInt("cardtype") == 1 ? "Credit" : "Debit");
				String cardnumber = obj.decrypt(rs.getString("cardno"),sk);
				cardnumber = cardnumber.substring(cardnumber.length() - 4);
				json.put("cn", cardnumber);
				json.put("em",obj.decrypt(rs.getString("expirymonth"),sk));
				json.put("ey",obj.decrypt(rs.getString("expiryyear"),sk) );
				json.put("cvv", obj.decrypt(rs.getString("cvv"),sk));
				json.put("primary", "no");
				arr.put(json);

			}
			System.out.println(arr.toString());
			return arr.toString();


	}
	
	@RequestMapping(value = "/removecard", method = RequestMethod.POST)
	@ResponseBody
	public String removecard(@RequestParam("id") String id,
			HttpServletRequest request) throws ClassNotFoundException, SQLException {
				Connection con = Db.getInstance();;
		JSONObject json = new JSONObject();
		PreparedStatement stmt = con.prepareStatement("delete from paymentcard where paymentid = ?;");
		stmt.setInt(1,Integer.parseInt(id));
		int i = stmt.executeUpdate();
		
		if(i>0) {
			json.put("Success","Card deleted");
			return json.toString();

		}
		return "";
			


	}
	
	@RequestMapping(value = "/primarycard", method = RequestMethod.POST)
	@ResponseBody
	public String primarycard(@RequestParam("id") int id,HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("Hi: " + id);
				Connection con = Db.getInstance();;
		JSONObject json = new JSONObject();
		PreparedStatement stmt = con.prepareStatement("select * from user where user_id=?;");
		stmt.setInt(1,(int)request.getSession().getAttribute("userid"));
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			int pct = rs.getInt("cardtype");
			String pcn = rs.getString("card_no");
			String pem = rs.getString("expiry_month");
			String pey = rs.getString("expiry_year");
			String pcvv = rs.getString("cvv");
			 stmt = con.prepareStatement("select * from paymentcard where paymentid=?;");
			stmt.setInt(1,id);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				int ct = rs.getInt("cardtype");
				String cn = rs.getString("cardno");
				String em = rs.getString("expirymonth");
				String ey = rs.getString("expiryyear");
				String cvv = rs.getString("cvv");
				
				stmt = con.prepareStatement("update user set cardtype=?,card_no=?,expiry_month=?,expiry_year=?,cvv=? where user_id=?;");
				stmt.setInt(1,ct);
				stmt.setString(2, cn);
				stmt.setString(3, em);
				stmt.setString(4, ey);
				stmt.setString(5, cvv);
				stmt.setInt(6,(int)request.getSession().getAttribute("userid"));
				stmt.executeUpdate();
				
				stmt = con.prepareStatement("update paymentcard set cardtype=?,cardno=?,expirymonth=?,expiryyear=?,cvv=? where paymentid=?;");
				stmt.setInt(1,pct);
				stmt.setString(2, pcn);
				stmt.setString(3, pem);
				stmt.setString(4, pey);
				stmt.setString(5, pcvv);
				stmt.setInt(6,id);
				stmt.executeUpdate();

				json.put("Success", "Primary card updated successfully");
				return json.toString();

				
				
			}
			
			

		}
		return "";
			


	}
	
	@RequestMapping(value = "/getcarddetails", method = RequestMethod.POST)
	@ResponseBody
	public String getcarddetails(@RequestParam("id") String id,@RequestParam("primary") String primary,HttpServletRequest request) throws ClassNotFoundException, SQLException {
				Connection con = Db.getInstance();;
		JSONObject json = new JSONObject();
		if(primary.equals("yes")) {
			PreparedStatement stmt = con.prepareStatement("select * from user where User_Id = ?");
			stmt.setInt(1,Integer.parseInt(id));
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				json.put("id", rs.getString("user_id"));

				json.put("ct",rs.getInt("cardtype"));
				json.put("cn", obj.decrypt(rs.getString("card_no"),sk));
				json.put("em",obj.decrypt(rs.getString("expiry_month"),sk));
				json.put("ey",obj.decrypt(rs.getString("expiry_year"),sk) );
				json.put("cvv", obj.decrypt(rs.getString("cvv"),sk));

			}			

		}
		else {
			PreparedStatement stmt = con.prepareStatement("select * from paymentcard where PaymentId = ?");
			stmt.setInt(1,Integer.parseInt(id));
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				json.put("id", rs.getString("paymentid"));
				json.put("ct",rs.getInt("cardtype"));
				json.put("cn", obj.decrypt(rs.getString("cardno"),sk));
				json.put("em",obj.decrypt(rs.getString("expirymonth"),sk));
				json.put("ey",obj.decrypt(rs.getString("expiryyear"),sk) );
				json.put("cvv", obj.decrypt(rs.getString("cvv"),sk));

			}	
		}
		System.out.println(json.toString());
		return json.toString();
			


	}
	
	@RequestMapping(value = "/seats", method = RequestMethod.GET)
	
	public ModelAndView seatsPage(@RequestParam("mid") String mid,@RequestParam("showdate") String showdate,
			@RequestParam("showtime") String showtime,@RequestParam("mname") String mname,@RequestParam("screen") String screen,
			HttpServletRequest request) throws ClassNotFoundException, SQLException {
				Connection con = Db.getInstance();;
		JSONObject json = new JSONObject();
		PreparedStatement stmt = con.prepareStatement("select * from movieseats where movieid=? and showdate=? and showtime=? and screen=?");

		stmt.setInt(1,Integer.parseInt(mid));
		stmt.setString(2,showdate);
		stmt.setString(3,showtime);
		stmt.setInt(4,Integer.parseInt(screen));

		ResultSet rs = stmt.executeQuery();
		String seats="";
		while(rs.next()) {
			
				seats +=	rs.getString("seats") + ",";
				System.out.println("seats are: " + seats);

		}
		
		json.put("mname", mname);
		json.put("mid", mid);
		json.put("showdate",showdate);
		json.put("showtime",showtime);
		json.put("screen",screen);
		if(seats != "") {
		json.put("seats",seats.substring(0,seats.length() - 1));
		}
		else {
			json.put("seats","");

		}

		System.out.println(json.toString());
		ModelAndView mav = new ModelAndView("movieseats");
		mav.addObject("moviedata",json.toString());
		return mav;


	}
	
@RequestMapping(value = "/applyPromo", method = RequestMethod.POST)
	@ResponseBody
	public String applyPromocode(@RequestParam("pcode") String pcode,@RequestParam("price") String ticketprice,
			HttpServletRequest request) throws ClassNotFoundException, SQLException, ParseException {
				Connection con = Db.getInstance();;
		JSONObject json = new JSONObject();
		PreparedStatement stmt = con.prepareStatement("select * from promotions");

		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString("PromoCode").equalsIgnoreCase(pcode)) {
				String currentdate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

				String startdate = rs.getString("startdate");
				String enddate = rs.getString("enddate");
				
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        Date sd = sdf.parse(startdate);
		        Date ed = sdf.parse(enddate);
		        Date cd = sdf.parse(currentdate);
		        
		        int result1 = cd.compareTo(sd);
		        int result2 = cd.compareTo(ed);
		        
		        if(result1==0 || result2==0 || (result1 > 0 && result2 < 0)) {

		            int discount = (Integer.parseInt(ticketprice) * rs.getInt("discount"))/100;
		            int price = Integer.parseInt(ticketprice) - discount;




		        	json.put("Success", "promotion applied");
		        	json.put("updatedprice", price);

		        	return json.toString();
		        }
		        else {
		        	json.put("Error", "Promo code expired");
		        	return json.toString();

		        }

		        




				
			}

		}
    	json.put("Error", "promotion code not available");

    	return json.toString();
		
		

	}
	
@RequestMapping(value = "/pay", method = RequestMethod.POST)
@ResponseBody
public String pay(@RequestParam("uid") String uid,@RequestParam("mid") String mid,@RequestParam("mname") String mname,
		@RequestParam("sd") String sd,@RequestParam("st") String st,@RequestParam("screen") String screen,@RequestParam("seats") String seats,
		@RequestParam("price") int price,@RequestParam("cvv") String cv,@RequestParam("cn") String cn,
		HttpServletRequest request) throws ClassNotFoundException, SQLException, ParseException {
			Connection con = Db.getInstance();;
	JSONObject json = new JSONObject();
	PreparedStatement stmt = con.prepareStatement("select * from user where user_id=?");
	stmt.setInt(1, Integer.parseInt(uid));
	ResultSet rs = stmt.executeQuery();
	rs.next();
String email = rs.getString("email");

				  stmt = con.prepareStatement("insert into movieseats(userid,movieid,moviename,showdate,showtime,screen,seats,price)values(?,?,?,?,?,?,?,?);");
				 stmt.setInt(1,Integer.parseInt(uid) );
				 stmt.setInt(2,Integer.parseInt(mid) );
				 stmt.setString(3, mname);
				 stmt.setString(4, sd);
				 stmt.setString(5, st);
				 stmt.setString(6, screen);
				 stmt.setString(7, seats);
				 stmt.setInt(8, price);
				 stmt.executeUpdate();
					String Subject = "Ticket details";
					String body="Hi,\n\nYour tickets have been successfully booked.\n\nTicket details:\nMovie: " + mname + "\nDate: " + sd + "\nTime: " + st + "\nScreen Number: " + screen + "\nSeats: " + seats + "\nTotal price: " + price + "\n\nThank you,\nClick a show";
						

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



				json.put("Success", "Tickets Booked");
				return json.toString();

			}
						
	
		
@RequestMapping(value = "/bookings", method = RequestMethod.GET)
@ResponseBody
public String bookings(@RequestParam("uid") String uid,HttpServletRequest request) throws ClassNotFoundException, SQLException {
			Connection con = Db.getInstance();;
	JSONObject json;
	JSONArray arr = new JSONArray();
	PreparedStatement stmt = con.prepareStatement("select * from movieseats where userid = ?;");
	stmt.setInt(1,Integer.parseInt(uid));
	ResultSet rs = stmt.executeQuery();
	
	while(rs.next()) {
		json = new JSONObject();
		json.put("id", rs.getInt("id"));

		json.put("mn", rs.getString("moviename"));
		json.put("sd", rs.getString("showdate"));
		json.put("st", rs.getString("showtime"));
		json.put("screen", rs.getInt("screen"));
		json.put("seats", rs.getString("seats"));
		json.put("price", rs.getInt("price"));

		arr.put(json);
	}
	return arr.toString();
		


}

	
	

}

	


