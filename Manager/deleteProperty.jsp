<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>delete property</title>
</head>
<body>
<%@ page import="java.sql.*,java.io.*,java.util.Scanner,javax.servlet.http.*"%>
<%
Connection connect = null;
Statement statement = null;
ResultSet resultSet = null;

int pid=Integer.parseInt(request.getParameter("pid"));//Integer.parseInt(request.getParameter("id")); 
//String pswd=(request.getParameter("pass"));
try { 

	// set path
	Class.forName("com.mysql.jdbc.Driver");
	
	connect = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/real_estate_office?user=root&password=shivam@2256&useSSL=false");
	statement = connect.createStatement();

	// prepare query for first result
	resultSet = statement.executeQuery(" select * from property where propertyid="+pid);
			 int flag = 0;
             String s="hi";
			
				while (resultSet.next()) {
                     s= resultSet.getString(5);
                    flag=1;
                    break;
				}
				
				if(flag == 1){
                    statement.executeUpdate(" delete from property where propertyid="+pid);
                    %>
                    <h3 style="color:green;">property deleted successfully</h3>
                    <% 
				}
                else
                {
                    %>
                    <h3 style="color:red;">sorry!!! Wrong property id</h3>
                    <%
                }
			
	statement.close();
	connect.close();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


%>
</body>
</html>
