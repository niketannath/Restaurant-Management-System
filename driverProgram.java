import java.sql.*;
 
import java.util.*;
import java.io.IOException;



 
public class driverProgram
{	
	public static boolean loginAuth(String username, String password){
		try{
		String query = "select password from manager where empID = '"+username+"';";	
			
		String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		boolean auth = false;
		while(rs.next()){
			if(rs.getString("password").equals(password))
				auth = true;
		}
		return auth;
		
		}catch(Exception e1){
			System.out.println(e1);
			return false;
		}
		
	}

	public static void administrativeEmployeeView(){
		try{
			String query = "select * from employee order by empID;";

			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.format("%5s%20s%15s%15s%15s%10s%10s%15s%15s","ID","Name"," Contact"," DOB"," DOJ","Gender","Salary","Qualification","Experience");
			System.out.println();
			while(rs.next()){
				
				System.out.format("%5s%20s%15s%15s%15s%10s%10s%15s%15s",rs.getString("empID"), rs.getString("empName"), rs.getString("contactNo"),
								  rs.getString("DOB"), rs.getString("DOJ"), rs.getString("gender"), rs.getString("salary"), rs.getString("qualification"),
								  rs.getString("experience"));
				System.out.println();

			}

			}catch(Exception e1){
				System.out.println(e1);
			}
	}
	
	public static void administrativeEmployeeAdd(){
		try{
			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			
			String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11;
			System.out.println("Enter respectively the following etails of the employee: ");
			System.out.print("Type of employee (M:manager, W:waiter, C:chef)");
			char empType = sc.next().charAt(0);
			System.out.print("Employee ID(refer to employee table to find an appropriate ID): ");
			s1 = sc.nextLine();
			s1=sc.nextLine();
			System.out.print("Name: ");
			s2 = sc.nextLine();
			System.out.print("Address: ");
			s3 = sc.nextLine();
			System.out.print("Phone No: ");
			s4 = sc.nextLine();
			System.out.print("DOB (YYYY-MM-DD) : ");
			s5 = sc.nextLine();
			System.out.print("DOJ (YYYY-MM-DD : )");
			s6 = sc.nextLine();
			System.out.print("Gender: ");
			s7 = sc.nextLine();
			System.out.print("Salary: ");
			s8 = sc.nextLine();
			System.out.print("Qualification: ");
			s9 = sc.nextLine();
			System.out.print("Experience: ");
			s10 = sc.nextLine();
			
			String query1 = String.format("INSERT INTO employee VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', %s, '%s', '%s');",
			s1,s2,s3,s4,s5,s6,s7,s8,s9,s10).replace("''", "NULL");		
			Statement stmt1 = con.createStatement();
			int flag1 = stmt1.executeUpdate(query1);
			
			if(flag1==0){
				System.out.println("Error occured.");
				return;
			}
			
			Statement stmt2 = con.createStatement();
			String query2;
			if(empType == 'M'){
				System.out.print("Enter password of manager: ");
				s11 = sc.next();
				query2 = String.format("insert into manager values('%s','%s');",s1,s11).replace("''", "NULL");
				int flag2 = stmt2.executeUpdate(query2);
				if(flag2==0){
					System.out.println("Error occured while adding password.");
					Statement stmt3 = con.createStatement();
					stmt3.executeUpdate("delete from employee where empID='"+s1+"';");
				}
			}else if(empType == 'C'){
				System.out.print("Enter specialty of chef: ");
				s11 = sc.nextLine();
				query2 = String.format("insert into chef values('%s','%s');",s1,s11).replace("''","NULL");
				int flag2 = stmt2.executeUpdate(query2);
				if(flag2==0){
					System.out.println("Error occured while adding speciality.");
					Statement stmt3 = con.createStatement();
					stmt3.executeUpdate("delete from employee where empID='"+s1+"';");
				}
			}
			
			System.out.println("Addition successful.");
			
			
			
			
			}catch(Exception e1){
				System.out.println(e1);
			}
	}
	
	public static void administrativeEmployeeEdit(){
		try{
			
			System.out.print("Enter the employee ID you want to change");
			String s1 = sc.next();
			System.out.print("Enter the new conatct no");
			String s2 = sc.next();
			String query = "update employee set contactNo ='" + s2 + "' where empID = '" + s1 +"'";

			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			Statement stmt = con.createStatement();
			int rs = stmt.executeUpdate(query);
			if(rs!=0)
				System.out.println(s1 + "'s contact number updated successfully!!!");
			else
				System.out.println("Failed!!!!");
			}catch(Exception e1){
				
				System.out.println(e1);
				
			}
	}

	public static void administrativeEmployeeRemove(){
		try{
			
			System.out.print("Enter the employee ID you want to delete");
			String s1 = sc.next();
			String query = "delete from employee where empID = '" + s1 + "'";

			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			Statement stmt = con.createStatement();
			int rs = stmt.executeUpdate(query);
			if(rs!=0)
				System.out.println(s1 + " deleted successfully!!!");
			else
				System.out.println("Failed!!!!");
			}catch(Exception e1){
				
				System.out.println(e1);
				
			}
	}

	
	
	public static void administrativeMenuView(){
		try{
			String query = "select * from menu order by itemID;";

			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.format("%15s%30s%15s%30s%15s","itemID","itemName"," category"," description"," price");
			System.out.println();
			while(rs.next()){
				
				System.out.format("%15s%30s%15s%30s%15s",rs.getString("itemID"), rs.getString("itemName"), rs.getString("category"),
								  rs.getString("description"), rs.getString("price"));
				System.out.println();

			}

			}catch(Exception e1){
				System.out.println(e1);
			}
	}
	
	public static void administrativeMenuAdd(){
		try{
			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");

			String s1,s2,s3,s4,s5;
			System.out.print("Item ID(refer to menu table to find an appropriate ID): ");
			s1 = sc.nextLine();
			s1=sc.nextLine();
			System.out.print("Item Name: ");
			s2 = sc.nextLine();
			System.out.print("Category: ");
			s3 = sc.nextLine();
			System.out.print("Description: ");
			s4 = sc.nextLine();
			System.out.print("Price : ");
			s5 = sc.nextLine();

			String query1 = String.format("INSERT INTO menu VALUES ('%s', '%s', '%s', '%s', %s);", s1,s2,s3,s4,s5).replace("''", "NULL");
			Statement stmt1 = con.createStatement();
			int flag1 = stmt1.executeUpdate(query1);

			if(flag1==0){
				System.out.println("Error occured.");
				return;
			}

			System.out.println("Addition successful.");

			}catch(Exception e1){
				System.out.println(e1);
			}
	}
	
	public static void administrativeMenuEdit(){
		try{
			
			System.out.print("Enter the item ID you want to change");
			String s1 = sc.next();
			System.out.print("Enter the new price");
			String s2 = sc.next();
			String query = "update menu set price ='" + s2 + "' where itemID = '" + s1 +"'";

			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			Statement stmt = con.createStatement();
			int rs = stmt.executeUpdate(query);
			if(rs!=0)
				System.out.println(s1 + "'s price updated successfully!!!");
			else
				System.out.println("Failed!!!!");
			}catch(Exception e1){
				
				System.out.println(e1);
				
			}
	}
	
	public static void administrativeMenuRemove(){
		try{
			
			System.out.print("Enter the item ID you want to delete");
			String s1 = sc.next();
			String query = "delete from menu where itemID = '" + s1 + "'";

			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			Statement stmt = con.createStatement();
			int rs = stmt.executeUpdate(query);
			if(rs!=0)
				System.out.println(s1 + " deleted successfully!!!");
			else
				System.out.println("Failed!!!!");
			}catch(Exception e1){
				
				System.out.println(e1);
				
			}
	}
	
	//--------------------------------------------------------------------
	
	public static void managementAssignTable(){
		try{
		String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
		
		Statement stmt0 = con.createStatement();
		String displayQuery = "select tableID, capacity from restaurant.table where customerID is NULL;";
		ResultSet displayTable =  stmt0.executeQuery(displayQuery);
		System.out.format("%10s%12s","tableID","capacity");
		System.out.println();
		while(displayTable.next()) {
			System.out.format("%10s%12s",displayTable.getString("tableID"), displayTable.getString("capacity"));
			System.out.println();
			
		}
		
		stmt0.close();
		
		
		System.out.print("Enter head count:");
		int headCount = sc.nextInt();
		int customerID = -1;
		stmt0 = con.createStatement();
		String query0 = "insert into customer (headCount) values("+headCount+");";
		String arr[] = {"customerID"};
		stmt0.executeUpdate(query0, arr);
		ResultSet rs = stmt0.getGeneratedKeys();
		while(rs.next()){
			customerID = rs.getInt(1);
		}
		
		
		System.out.print("Enter number of tables to be assigned: ");
		int n = sc.nextInt();
		System.out.print("Enter tableID's: ");
		boolean flag = true;
		for(int i=0;i<n;i++){
			Statement stmt = con.createStatement();
			String query = "update restaurant.table set customerID ="+customerID+" where customerID is NULL and tableID="+sc.nextInt()+";";
			flag = flag & (stmt.executeUpdate(query) != 0);
			stmt.close();
			
		}
		if(flag)
			System.out.println("Success. CustomerID: "+customerID);
		else
			System.out.println("Failure.");
		}catch(Exception e1){
			System.out.println(e1);
		}
		
		
	}
	
	public static void managementViewTable() {
		try{
			String query = "select tableID, customerID from restaurant.table order by tableID;";

			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.format("%7s%12s","tableID","customerID");
			System.out.println();
			while(rs.next()){
				
				System.out.format("%7s%12s",rs.getString("tableID"), rs.getString("customerID"));
				System.out.println();
			}

			}catch(Exception e1){
				System.out.println(e1);
			}
	}
	
	public static void managementGenerateBill(){
		try{
			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			
			
			//Step 1 is to identify the customerID
			System.out.print("Enter the tableID that requests the bill: ");
			int tableRequestingBill = sc.nextInt();
			
			String query = "select customerID from restaurant.table where tableID = "+tableRequestingBill+";";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.wasNull()){
				System.out.println("The table is vacant. Please check again.");
				return;
			}
			rs.next();
			int customerID = rs.getInt("customerID");
			stmt.close();
			rs.close();
			
			
			//Step 2 is to check if any undelivered orders for that customer remain
			stmt = con.createStatement();
			
			query = "select orderID from restaurant.order NATURAL JOIN restaurant.table where deliveredTime IS NULL AND customerID="+customerID+";";
			
			rs = stmt.executeQuery(query);
			if(rs.next()){
				System.out.print("The following orders are undelivered: ");
				System.out.print(rs.getInt("orderID")+", ");
				while(rs.next()){
					System.out.print(rs.getInt("orderID")+", ");
				}
				System.out.println("\nEnsure these orders are delivered first.");
				return;
			}
			stmt.close();
			rs.close();
			
			//Step 3 is to start creating the tuple in billarchive.
			query = "insert into billarchive values("+customerID+", "+(System.currentTimeMillis()/1000)+",0,0,0);";
			stmt = con.createStatement();
			stmt.executeUpdate(query);
			rs.close();
			stmt.close();
			
			//Step 4 is to fill itemsinbill relation by combining all the items in all the orders
			query = "select itemID, sum(qty) as qty " +
					"from itemsinorder natural join restaurant.order natural join restaurant.table" +
					" where customerID ="+customerID+" group by itemID;";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				Statement stmt2 = con.createStatement();
				
				String query2 = "insert into itemsinbill values("+customerID+", '"+
								rs.getString("itemID")+"', "+rs.getInt("qty")+");";
				
				stmt2.executeUpdate(query2);
				stmt2.close();
			}
			
			stmt.close();
			rs.close();
			
			//Step 5 is to update the amount, tax and grand total in bill tuple.
			stmt = con.createStatement();
			double amt=0;
			query = "select sum(qty*price) as amount from menu natural join itemsinbill where billNo = "+customerID+";";
			rs = stmt.executeQuery(query);
			rs.next();
			amt = rs.getDouble("amount");
			
			stmt.close();
			stmt = con.createStatement();
			query = "update billarchive set amount = "+amt+", tax=" + (amt*0.18)+", grandTotal= "+(amt*1.18)+" where billNo = "+customerID+";";
			stmt.executeUpdate(query);
			stmt.close();
			
			//Step 6 is to remove the customer from the database.
			stmt = con.createStatement();
			query = "delete from restaurant.order where tableID in (select tableID from restaurant.table where customerID="+customerID+");";
			
			stmt.executeUpdate(query);
			stmt.close();
			stmt = con.createStatement();
			query = "delete from customer where customerID="+customerID+";";
			stmt.executeUpdate(query);
			stmt.close();
			rs.close();
			
			
			//Step 7 is to print the bill
			System.out.println("Bill generation complete.");
			System.out.println("Bill No: \t"+customerID);
			stmt = con.createStatement();
			query = "select itemName, price, qty, (price*qty) as subTotal from menu natural join itemsinbill where billNo="+customerID+";";
			rs = stmt.executeQuery(query);
			System.out.format("%40s%7s%7s%10s","Item","price","qty","Sub Total");
			System.out.println();
			while(rs.next()){
				System.out.format("%40s%7s%7s%10s",rs.getString("itemName"),rs.getString("price"),rs.getString("qty"),rs.getString("subTotal"));
				System.out.println();
			}
			
			System.out.println("Total amount: "+amt);
			System.out.println("Tax: "+(amt*0.18));
			System.out.println("Grand Total: "+(amt*1.18));
			
			
			
			
			
			
			
		}catch(Exception e1){
			System.out.println(e1);
		}
		
		
	}
	
	public static void managementPlaceOrder(){
		try{
			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			
			System.out.print("Enter tableID placing order:");
			int tableID = sc.nextInt();
			int orderID=-1;
			boolean flag=false;
			
			
			Statement stmt0 = con.createStatement();
			String query0 = "select tableID from restaurant.table where customerID is NOT NULL and tableID = "+tableID+";";
			ResultSet rs0 =  stmt0.executeQuery(query0);
			if(!rs0.next()){
				System.out.println("Table is vacant, please check again.");
				return;
			}
			
				
			Statement stmt = con.createStatement();
			String query = "insert into restaurant.order(tableID, placedTime) values ("+tableID+", 0);";
			String arr[] = {"orderID"};
			flag = (stmt.executeUpdate(query, arr) != 0);
			ResultSet rs = stmt.getGeneratedKeys();
			while(rs.next()){
				orderID = rs.getInt(1);
			}
			stmt.close();
			
			System.out.print("Enter number of distinct items in order: ");
			int n = sc.nextInt();
			for(int i=0;i<n;i++){
				Statement stmt1 = con.createStatement();
				System.out.print("Enter itemID: ");
				String itemID = sc.next();
				System.out.print("Enter Quantity: ");
				int quantity = sc.nextInt();
				
				String query1 = "insert into itemsinorder values("+orderID+", '"+itemID+"', "+quantity+");";
				flag = flag & (stmt1.executeUpdate(query1) != 0);
				stmt1.close();
			}
			
			stmt = con.createStatement();
			query = "update restaurant.order set placedTime = "+(System.currentTimeMillis()/1000)+" where orderID="+orderID+";";
			flag = flag & (stmt.executeUpdate(query) != 0);
			
			if(flag==true)
				System.out.println("Success in placing order "+orderID);
			else
				System.out.println("Failure.");
			
			
		}catch(Exception e1){
			System.out.println(e1);
		}
	}

	public static void managementViewUndeliveredOrder() {
		try{
			String query = "select orderId, tableID, placedTime	from restaurant.order where deliveredTime is NULL order by placedTime;";

			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.format("%10s%10s%15s","orderID","tableID","placedTime");
			System.out.println();
			while(rs.next()){
				
				System.out.format("%10s%10s%15s",rs.getString("orderID"), rs.getString("tableID"), rs.getString("placedTime"));
				System.out.println();
			}

			}catch(Exception e1){
				System.out.println(e1);
			}
	}
	
	public static void managementUpdateOrderStatus() {
		try{
			
			System.out.print("Enter the order ID ");
			String s1 = sc.next();
			long ans = System.currentTimeMillis()/1000;
			String query = "update restaurant.order set deliveredTime ='" + ans + "' where orderID = '" + s1 +"'";

			String connectionURL = "jdbc:mysql://localhost:3306/restaurant";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(connectionURL, "root", "oj287m87");
			Statement stmt = con.createStatement();
			int rs = stmt.executeUpdate(query);
			if(rs!=0)
				System.out.println(s1 + " order updated successfully!!!");
			else
				System.out.println("Failed!!!!");
			}catch(Exception e1){
				
				System.out.println(e1);
				
			}
	}

	
	public static Scanner sc = new Scanner(System.in);
	public static boolean log = false;
	
	
	//----------------------------------------------------
	
	public static void employee()
	{
		int ch = 0;
		while(ch != 5)
		{
			//clear screen
			System.out.println("\n\n\t\t\t\t---------------EMPLOYEE OPTIONS------------" + "\n\n");
			System.out.println("1. VIEW\n" + "2. ADD\n" + "3. EDIT\n" + "4. REMOVE\n" + "5. BACK\n" );
			System.out.println("Enter your choice:");
			ch = sc.nextInt();
			//clear screen
			switch(ch)
			{
			case 1 : 
					administrativeEmployeeView();
					break;
			case 2 : 
					administrativeEmployeeAdd();
					break;
			case 3 :
					administrativeEmployeeEdit();
					break;
			case 4 :
					administrativeEmployeeRemove();
					break;
			case 5 : break;
			default:System.out.print("Invalid choice");
					//delay
			}
		}
	}
	
	public static void menu()
	{
		int ch = 0;
		while(ch != 5)
		{
			//clear screen
			System.out.println("\n\n\t\t\t\t---------------MENU OPTIONS------------" + "\n\n");
			System.out.println("1. VIEW\n" + "2. ADD\n" + "3. EDIT\n" + "4. REMOVE\n" + "5. BACK\n" );
			System.out.println("Enter your choice:");
			ch = sc.nextInt();
			//clear screen
			switch(ch)
			{
			case 1 :administrativeMenuView();
					break;
			case 2 :administrativeMenuAdd();
					break;
			case 3 :administrativeMenuEdit();
					break;
			case 4 :administrativeMenuRemove();
					break;
			case 5 : break;
			default:System.out.print("Invalid choice");
					//delay
			}
		}
	}
	
	public static void administrative()
	{
		int ch = 0;
		while(ch != 3)
		{
			//clear screen
			System.out.println("\n\n\t\t\t\t---------------ADMINISTRATIVE OPTIONS------------" + "\n\n");
			System.out.println("1. EMPLOYEE\n" + "2. MENU\n" + "3. BACK\n" );
			System.out.println("Enter your choice:");
			ch = sc.nextInt();
			//clear screen
			switch(ch)
			{
			case 1 : employee();
					break;
			case 2 : menu();
					break;
			case 3 : break;
			default:System.out.print("Invalid choice");
					//delay
			}
		}
	}
	
	public static void management()
	{
		int ch = 0;
		while(ch != 8)
		{
			//clear screen
			System.out.println("\n\n\t\t\t\t---------------MANAGEMENT OPTIONS------------" + "\n\n");
			System.out.println("1. ASSIGN TABLE\n" + "2. VIEW TABLES\n" + "3. GENERATE BILL\n" + "4. PLACE ORDER\n" + "5. VIEW UNDELIVERED ORDERS\n" + "6. UPDATE ORDER STATUS\n" +  "7. BACK\n");
			System.out.println("Enter your choice:");
			ch = sc.nextInt();
			//clear screen
			switch(ch)
			{
			case 1 : 
					managementAssignTable();
					break;
			case 2 : 
					managementViewTable();
					break;
			case 3 : 
					managementGenerateBill();
					break;
			case 4 : 
					managementPlaceOrder();
					break;
			case 5 : 
					managementViewUndeliveredOrder();
					break;
			case 6 : 
					managementUpdateOrderStatus();
					break;

			case 7 :break;
			default:System.out.print("Invalid choice");
					//delay
			}
		}
		
	}
	
	public static void driver()
	{
		int ch = 0;
		while(ch != 3)
		{
			//clear screen
			System.out.println("\n\n\t\t\t\t---------------RESTAURANT MANAGEMENT SYSTEM------------" + "\n\n");
			System.out.println("1. ADMINISTRATIVE\n" + "2. MANAGEMENT\n" + "3. LOGOUT\n" );
			System.out.println("Enter your choice:");
			ch = sc.nextInt();
			//clear screen
			switch(ch)
			{
			case 1 : administrative();
					break;
			case 2 : management();
					break;
			case 3 : System.out.print("LOGGING OUT!!!!");
					log = false;
					//delay
					break;
			default:System.out.print("Invalid choice");
					//delay
			}
		}
	}
	
	public static void main(String [] args)
	{
		while(log == false) {
			System.out.println("\n\n\t\t\t\t---------------RESTAURANT MANAGEMENT SYSTEM------------" + "\n\n");
			System.out.print("User name : ");
			String user = sc.next();
			System.out.print("Password : ");
			String password = sc.next();
			if(loginAuth(user, password)) {
				log = true;
				System.out.println("Logged in Successfully!");
				//TimeUnit.SECONDS.sleep(1);
				driver();
			}
			else {
				System.out.println("Invalid credentials");
			}
		}
	}

	
}