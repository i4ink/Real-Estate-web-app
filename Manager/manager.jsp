 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html> 
<html> 
    <head> 
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
       <title>Manager Interface</title> 
    </head> 
    <center><body> 
		<form action="logout.jsp" style="float: right;size:500px;">
		<button type="submit" class="btn btn-primary">logout</button>
		</form>
        <center><h1 style="color:blue;">Manager Interface</h1></center> 
        <%
		//to prevent back button after logout for this page
		response.setHeader("cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("username")==null)
		{
			response.sendRedirect("../index.jsp");    //avoid access to this page without login
		}
        %>  
		<center><h2 style="color:green;">Welcome ${username}</h2></center>

        <ol>
		<form method ="get" action="agentSales.jsp"> 
           <li> Enter the agent id whose sales detail you want : <input type="text" name="id"><br/><br/></li>
                <input type ="submit" value="SUBMIT">     
        </form> <br/>
		<form method ="get" action="deleteProperty.jsp"> 
           <li> Enter the property id which you want to delete: <input type="text" name="pid"><br/><br/></li>
                <input type ="submit" value="SUBMIT">     
        </form> 
		<br/>
		<li><a href="rentedProperties.jsp">click here </a>to get rented property details</li></ol>

    </body></center> 
</html> 