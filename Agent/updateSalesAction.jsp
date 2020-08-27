<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/js/bootstrap-datepicker.min.js"></script>

<link rel="stylesheet" type="text/css"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker3.min.css">
<title>Agent login redirect</title>
</head>
<body>

            <%
		//to prevent back button after logout for this page
		response.setHeader("cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("username")==null)
		{
			response.sendRedirect("../index.jsp");    //avoid access to this page without login
		}
        %>  
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <!--<a class="navbar-brand" href="#">Real Estate Agency</a>-->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                
                <li class="nav-item active">
                <form action = "logout.jsp">
                    <button type="submit" class="btn btn-dark">Real Estate Agency</button>
                    </form>
                </li >
                
            </ul>
        </div>
                         <div align="right">
                 		<form  action="logout.jsp" >
		<button type="submit" class='btn btn-success pull-right'>logout</button>
		</form>
        </div>
    </nav>

<%@ page import="java.sql.*,java.io.*,java.util.Scanner,javax.servlet.http.*"%>
<%
Connection connect = null;
Statement statement = null;
Statement st=null;
ResultSet resultSet = null;

int pid=Integer.parseInt(request.getParameter("pid")); 
int aid=Integer.parseInt(request.getParameter("aid")); 
int cpin=Integer.parseInt(request.getParameter("cpin")); 
long ccont=Long.parseLong(request.getParameter("ccont")); 
String cname=(request.getParameter("cname"));
String sdate=(request.getParameter("sdate"));
String lname=(request.getParameter("lname"));

String userid=(String)(session.getAttribute("userid"));
int uid = Integer.parseInt(userid);

try {

	// set path
	Class.forName("com.mysql.jdbc.Driver");
	
	connect = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/real_estate_office?user=root&password=shivam@2256&useSSL=false");
	statement = connect.createStatement();
    st = connect.createStatement();

	resultSet = statement.executeQuery("select propertyid from property where propertyid="+pid+" and tag='available'");
             int temp=0;
			
				while (resultSet.next()) {
                    temp=1;
				}

	// prepare query for first result
    //out.print("userid is"+userid);
    if(uid==aid && temp==1)
    {

	resultSet = statement.executeQuery("select clientid from client");
             int clientid=0;
			
				while (resultSet.next()) {
                    clientid= resultSet.getInt(1);
				}
                clientid = clientid+1;

	resultSet = statement.executeQuery("select contactid from contact");
             int contactid=0;
			
				while (resultSet.next()) {
                    contactid= resultSet.getInt(1);
				}
                contactid = contactid+1;
	resultSet = statement.executeQuery("select pincode from locality where pincode="+cpin);
             int pcode=0;
             int flag=0;
			
				while (resultSet.next()) {
                    pcode= resultSet.getInt(1);
                    flag=1;
				}
                if(flag==0)
                {
                st.executeUpdate("insert into locality values ("+cpin+","+"'"+lname+"'"+")");
                }
                st.executeUpdate("insert into contact values ("+contactid+","+ccont+")");
                st.executeUpdate("insert into client values ("+clientid+","+"'"+cname+"'"+","+contactid+","+cpin+")");
                st.executeUpdate("insert into sales values ("+pid+","+aid+","+"'"+sdate+"'"+","+clientid+")");
%>
<center> <h2 style="color:green;">Updated successfully<h2> </center>
<%
        
    }
    else
    {
        %>
        <center> <h2 style="color:red;">Wrong agent or propertyid</h2> </center>
        <%
    }
                st.close();
	statement.close();
	connect.close();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


%>
</body>
</html>
