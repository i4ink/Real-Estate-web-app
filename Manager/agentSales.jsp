 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html> 
<html> 
    <head> 
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
       <title>agent sales details</title> 
	   <style>
table, th, td {
  border: 1px solid black;
}
</style>
    </head> 
    <body> 
<%@ page import="java.sql.*,java.io.*,java.util.Scanner,javax.servlet.http.*"%>
<%
Connection connect = null;
Statement statement = null;
ResultSet resultSet = null;

String id=request.getParameter("id");//Integer.parseInt(request.getParameter("id")); 
//String pswd=(request.getParameter("pass"));

try { 

	// set path
	Class.forName("com.mysql.jdbc.Driver");
	
	connect = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/real_estate_office?user=root&password=shivam@2256&useSSL=false");
	statement = connect.createStatement();
    resultSet = statement.executeQuery("select name from agent where agentid="+id);
    String nme="";
    while(resultSet.next())
    {
        nme= resultSet.getString(1);

    }
    %>
        <div>
        <center> <h2 style="color:blue;">rented properties details of <%=nme%></h2></center>
 <table style="width:100%;">
  <tr>
    <th>Propertyid</th>
    <th>landmark</th>
    <th>locality_name</th>
    <th>BHK</th>
    <th>size</th>
    <th>price</th>
    <th>sale_date</th>
  </tr>

<%
	// prepare query for first result
	resultSet = statement.executeQuery(" select s.propertyid,p.landmark,l.locality_name,d.BHK,d.size,p.price,s.sales_date from sales s,property p,locality l,details d where p.propertyid=s.propertyid and l.pincode=p.locality_pincode  and d.propertyid=p.propertyid and p.type='R' and p.agentid="+id);
			 int flag = 0;
				while (resultSet.next()) {
                    flag=1;
					String a  = resultSet.getString(1);
					String b = resultSet.getString(2);
					String c = resultSet.getString(3);
					String d = resultSet.getString(4);
					String e = resultSet.getString(5);
					String f = resultSet.getString(6);
					String g = resultSet.getString(7);
                    %>

        <tr>
          <td><%= a%></td>
          <td><%= b%></td>
          <td><%= c%></td>
          <td><%= d%></td>
          <td><%= e%></td>
          <td><%= f%></td>
          <td><%= g%></td>
        </tr>
        <% } %>
        </table>
        <%
        if(flag==0)
        {
            %>
            <center><h3 style="color:red;">No rented properties to show</h3></center>
        <% } %>

            </div>

        <div>
        <center> <h2 style="color:blue;">sold properties details of <%=nme%></h2></center>
           <table style="width:100%;">
  <tr>
    <th>Propertyid</th>
    <th>landmark</th>
    <th>locality_name</th>
    <th>BHK</th>
    <th>size</th>
    <th>price</th>
    <th>sale_date</th>
  </tr>

<%
	// prepare query for first result
	resultSet = statement.executeQuery(" select s.propertyid,p.landmark,l.locality_name,d.BHK,d.size,p.price,s.sales_date from sales s,property p,locality l,details d where p.propertyid=s.propertyid and l.pincode=p.locality_pincode  and d.propertyid=p.propertyid and p.type='S' and p.agentid="+id);
			    flag = 0;
				while (resultSet.next()) {
                    flag=1;
					String a  = resultSet.getString(1);
					String b = resultSet.getString(2);
					String c = resultSet.getString(3);
					String d = resultSet.getString(4);
					String e = resultSet.getString(5);
					String f = resultSet.getString(6);
					String g = resultSet.getString(7);
                    %>

        <tr>
          <td><%= a%></td>
          <td><%= b%></td>
          <td><%= c%></td>
          <td><%= d%></td>
          <td><%= e%></td>
          <td><%= f%></td>
          <td><%= g%></td>
        </tr>
        <% } %>
        </table>
        <%
        if(flag==0)
        {
            %>
            <center><h3 style="color:red;">No sold properties to show</h3></center>

            
            <%
        } %>
            </div>
            <% 
	statement.close();
	connect.close();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
    </body> 
</html> 
