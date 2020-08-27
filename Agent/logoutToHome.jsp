 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html> 
<html> 
    <head> 
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
       <title>logout</title> 
    </head> 
    <body> 
	<%
	HttpSession sess = request.getSession();
	sess.removeAttribute("username");
	sess.invalidate();
	response.sendRedirect("../index.jsp");
	%>
	
    </body> 
</html> 
