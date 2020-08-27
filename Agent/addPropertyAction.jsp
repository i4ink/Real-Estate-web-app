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
<title>add property action</title>
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

String padd=(request.getParameter("padd"));
String lname=(request.getParameter("lname"));
String pmark=(request.getParameter("pmark"));
int pprice=Integer.parseInt(request.getParameter("pprice")); 
String bhk=(request.getParameter("bhk"));
int aid=Integer.parseInt(request.getParameter("aid")); 
String ptype =(request.getParameter("ptype"));
int ppin=Integer.parseInt(request.getParameter("ppin")); 
String pdate=(request.getParameter("pdate"));
int parea=Integer.parseInt(request.getParameter("parea")); 


String userid=(String)(session.getAttribute("userid"));
int uid=Integer.parseInt(userid);

try {

	// set path
	Class.forName("com.mysql.jdbc.Driver");
	
	connect = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/real_estate_office?user=root&password=shivam@2256&useSSL=false");
	statement = connect.createStatement();
	resultSet = statement.executeQuery("select locality_address from property where locality_address = "+"'"+padd+"'");
             int flg=0;
			
				while (resultSet.next()) {
                    flg=1;
				}
    if(uid==aid && flg == 0)
    {
	resultSet = statement.executeQuery("select propertyid from property order by propertyid asc");
             int propertyid=0;
			
				while (resultSet.next()) {
                    propertyid = resultSet.getInt(1);
				}
                propertyid = propertyid+1;

	resultSet = statement.executeQuery("select detailsid from details order by detailsid");
             int detailsid=0;
			
				while (resultSet.next()) {
                    detailsid = resultSet.getInt(1);
				}
                detailsid = detailsid+1;

                int bhkid=Integer.parseInt( String.valueOf(bhk.charAt(0)) );

              statement.executeUpdate("insert into details values ("+detailsid+","+"'"+parea+"'"+","+bhkid+","+propertyid+")");      

	resultSet = statement.executeQuery("select pincode from locality where pincode="+ppin);
             int tmp=0;
			
				while (resultSet.next()) {
                    tmp=1;
				}
                if(tmp==0){
              statement.executeUpdate("insert into locality values ("+ppin+","+"'"+lname+"'"+")");      
                }

                char tpe = 'S';
                if(ptype.equals("rent") || ptype.equals("Rent") || ptype.equals("RENT"))
                {
                    tpe='R';
                }

            statement.executeUpdate("insert into property values ("+propertyid+","+"'"+tpe+"'"+","+pprice+","+"'"+padd+"'"+"," + "'" + pmark + "'" + "," + "'" + pdate + "'" +","+ " 'available' " + "," + ppin + "," + aid + ")");
                

                %>
                <center> <h2 style="color:green;">Data inserted successfully</h2> </center>
                <%
    }
    else{
        %>
        <center> <h2 style="color:red;">Wrong agent id or trying to insert duplicate property</h2> </center>
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
