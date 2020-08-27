<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agent login redirect</title>
</head>
<body>
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
	resultSet = statement.executeQuery("select agentid,pass,name from agent");
			 int flag = 0;
			
				while (resultSet.next()) {
					//String userId = resultSet.getString(1);
					//String userName = resultSet.getString(2);
					//String contact_id = resultSet.getString(3);
					//String locality_pincode = resultSet.getString(4);
					//out.println(" Id : " + userId + " Name: " + userName + " contact_id: "+contact_id + "locality_pincode:"+locality_pincode);
					String aid = resultSet.getString(1);
					String pas = resultSet.getString(2);
					String nme = resultSet.getString(3);
					if(id.equals(aid) && pswd.equals(pas))
					{
						//out.println("valid agentid");
						HttpSession sess = request.getSession();
						sess.setAttribute("username",nme);
						sess.setAttribute("userid",id);
						flag=1;
						response.sendRedirect("agent.jsp");
					}
				}
				
				if(flag == 0){
					response.sendRedirect("relogin.jsp");
					//out.println("ooops........Inalid userid or password ");
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