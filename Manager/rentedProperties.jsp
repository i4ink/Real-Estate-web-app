 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html> 
<html> 
    <head> 
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
       <title>Rented properties details</title> 
	   <style>
table, th, td {
  border: 1px solid black;
}
</style>
    </head> 
    <body> 
        <h1>Rented properties details</h1>


           <table style="width:100%">
  <tr>
    <th>Propertyid</th>
    <th>agentid</th>
    <th>name</th>
    <th>sale_date</th>
    <th>clientid</th>
    <th>name</th>
    <th>client_contact</th>
    <th>property_locality</th>
    <th>sale_price</th>
  </tr>
<%@ page import="java.sql.*,java.io.*,java.util.Scanner,javax.servlet.http.*"%>
<%
Connection connect = null;
Statement statement = null;
ResultSet resultSet = null;

String id=request.getParameter("id");//Integer.parseInt(request.getParameter("id")); 
String pswd=(request.getParameter("pass"));

try {

	// set path
	Class.forName("com.mysql.jdbc.Driver");
	
	connect = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/real_estate_office?user=root&password=shivam@2256&useSSL=false");
	statement = connect.createStatement();

	// prepare query for first result
	resultSet = statement.executeQuery(" select s.propertyid,s.agentid,a.name,s.sales_date,s.clientid,c.name,con.contact_no as client_contact,l.locality_name,p.price from sales s,agent a,property p,locality l,client c,contact con where s.agentid=a.agentid and p.propertyid=s.propertyid and l.pincode=p.locality_pincode and c.clientid=s.clientid and con.contactid=c.contactid and p.type='R';");
			 //int flag = 0;
			
				while (resultSet.next()) {
					String a  = resultSet.getString(1);
					String b = resultSet.getString(2);
					String c = resultSet.getString(3);
					String d = resultSet.getString(4);
					String e = resultSet.getString(5);
					String f = resultSet.getString(6);
					String g = resultSet.getString(7);
					String h = resultSet.getString(8);
					String i = resultSet.getString(9);
          %>

        <tr>
          <td><%= a%></td>
          <td><%= b%></td>
          <td><%= c%></td>
          <td><%= d%></td>
          <td><%= e%></td>
          <td><%= f%></td>
          <td><%= g%></td>
          <td><%= h%></td>
          <td><%= i%></td>
        </tr>
        <%}
			
	statement.close();
	connect.close();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


%>
</table> 
    </body> 
</html> 