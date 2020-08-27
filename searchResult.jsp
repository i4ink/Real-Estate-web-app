<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
    table {
            position: absolute;
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 97%;
  margin-left: 20px;
        }

td, th {
  border: 1px solid #dddddd;
  text-align: center;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
#manager{
            padding-left: 900px;
        }

        body{
            width=150%;
        }
</style>

    </head>
    <body >
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <!--<a class="navbar-brand" href="#">Real Estate Agency</a>-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    
                    <li class="nav-item active">
                    <form method="post" action="index.jsp">
                        <button type="submit" class="btn btn-dark">Real Estate Agency</button>
                        </form>
                    </li>
                    
                    <li class="nav-item" id="manager">
                        <a class="form-control mr-sm-2" href="Manager/login.jsp">Manager login</a>
                    </li>
                    <li class="nav-item">
                        <a class="form-control mr-sm-2" href="Agent/login.jsp">Agent Login</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        <br>
        <table id="table">
            <tr>
              <th>propertyid</th>
              <th>sale/rent</th>
              <th>price</th>
              <th>address</th>
              <th>landmark</th>
              <th>marketDate</th>
              <th>locality pincode</th>
              <th>agentid</th>
              <th>agent name</th>
              <th>agent contact</th>
              <th>BHK</th>
              <th>area</th>
            </tr>

<%@ page import="java.sql.*,java.io.*,java.util.Scanner,javax.servlet.http.*"%>
<%
Connection connect = null;
Statement statement = null;
Statement st=null;
ResultSet resultSet = null;

String lname=(request.getParameter("lname"));
String bhk=(request.getParameter("bhk"));
//String pmark=(request.getParameter("pmark"));
String budg=(request.getParameter("budg")); 
//String bhk=(request.getParameter("bhk"));
//int aid=Integer.parseInt(request.getParameter("aid")); 
//String ptype =(request.getParameter("ptype"));
//int ppin=Integer.parseInt(request.getParameter("ppin")); 
//String pdate=(request.getParameter("pdate"));
//int parea=Integer.parseInt(request.getParameter("parea")); 
//
//
//String userid=(String)(session.getAttribute("userid"));
//int uid=Integer.parseInt(userid);

try {

	// set path
	Class.forName("com.mysql.jdbc.Driver");
	
	connect = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/real_estate_office?user=root&password=shivam@2256&useSSL=false");
	statement = connect.createStatement();

    if(lname.equals("") && bhk.equals("BHK") && budg.equals("00000"))
    {
        resultSet = statement.executeQuery("select p.propertyid,p.type,p.price,p.locality_address,p.landmark,p.on_market_date,p.locality_pincode,p.agentid,a.name,c.contact_no,d.BHK,d.size from property p, agent a,contact c,details d where p.agentid=a.agentid and a.contactid=c.contactid and p.propertyid=d.propertyid  and p.tag='available' and p.type='R'");

        while(resultSet.next())
        {
            String a=resultSet.getString(1);
            String b=resultSet.getString(2);
            String c=resultSet.getString(3);
            String d=resultSet.getString(4);
            String e=resultSet.getString(5);
            String f=resultSet.getString(6);
            String g=resultSet.getString(7);
            String h=resultSet.getString(8);
            String i=resultSet.getString(9);
            String j=resultSet.getString(10);
            String k=resultSet.getString(11);
            String l=resultSet.getString(12);
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
              <td><%= j%></td>
              <td><%= k%></td>
              <td><%= l%></td>
            </tr>
            
            <%
        }
    }
    else if(lname.equals("") && !(bhk.equals("BHK")) && budg.equals("00000"))
    {
        resultSet = statement.executeQuery("select p.propertyid,p.type,p.price,p.locality_address,p.landmark,p.on_market_date,p.locality_pincode,p.agentid,a.name,c.contact_no,d.BHK,d.size from property p, agent a,contact c,details d where p.agentid=a.agentid and a.contactid=c.contactid and p.propertyid=d.propertyid  and p.tag='available' and p.type='R' and d.BHK='"+bhk+"'");

        while(resultSet.next())
        {
            String a=resultSet.getString(1);
            String b=resultSet.getString(2);
            String c=resultSet.getString(3);
            String d=resultSet.getString(4);
            String e=resultSet.getString(5);
            String f=resultSet.getString(6);
            String g=resultSet.getString(7);
            String h=resultSet.getString(8);
            String i=resultSet.getString(9);
            String j=resultSet.getString(10);
            String k=resultSet.getString(11);
            String l=resultSet.getString(12);
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
              <td><%= j%></td>
              <td><%= k%></td>
              <td><%= l%></td>
            </tr>
            
            <%
        }
    }
    else if(!(lname.equals("")) && (bhk.equals("BHK")) && budg.equals("00000"))
    {
        resultSet = statement.executeQuery("select p.propertyid,p.type,p.price,p.locality_address,p.landmark,p.on_market_date,p.locality_pincode,p.agentid,a.name,c.contact_no,d.BHK,d.size from property p, agent a,contact c,details d,locality l where l.pincode=p.locality_pincode and p.agentid=a.agentid and a.contactid=c.contactid and p.propertyid=d.propertyid  and p.tag='available' and p.type='R' and l.locality_name='"+lname+"'");

        while(resultSet.next())
        {
            String a=resultSet.getString(1);
            String b=resultSet.getString(2);
            String c=resultSet.getString(3);
            String d=resultSet.getString(4);
            String e=resultSet.getString(5);
            String f=resultSet.getString(6);
            String g=resultSet.getString(7);
            String h=resultSet.getString(8);
            String i=resultSet.getString(9);
            String j=resultSet.getString(10);
            String k=resultSet.getString(11);
            String l=resultSet.getString(12);
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
              <td><%= j%></td>
              <td><%= k%></td>
              <td><%= l%></td>
            </tr>
            
            <%
        }
    }
    else if(lname.equals("") && (bhk.equals("BHK")) && !(budg.equals("00000")) )
    {
        resultSet = statement.executeQuery("select p.propertyid,p.type,p.price,p.locality_address,p.landmark,p.on_market_date,p.locality_pincode,p.agentid,a.name,c.contact_no,d.BHK,d.size from property p, agent a,contact c,details d where p.agentid=a.agentid and a.contactid=c.contactid and p.propertyid=d.propertyid  and p.tag='available' and p.type='R' and p.price"+budg);

        while(resultSet.next())
        {
            String a=resultSet.getString(1);
            String b=resultSet.getString(2);
            String c=resultSet.getString(3);
            String d=resultSet.getString(4);
            String e=resultSet.getString(5);
            String f=resultSet.getString(6);
            String g=resultSet.getString(7);
            String h=resultSet.getString(8);
            String i=resultSet.getString(9);
            String j=resultSet.getString(10);
            String k=resultSet.getString(11);
            String l=resultSet.getString(12);
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
              <td><%= j%></td>
              <td><%= k%></td>
              <td><%= l%></td>
            </tr>
            
            <%
        }
    }
    else if(!(lname.equals("")) && !(bhk.equals("BHK")) && (budg.equals("00000")) )
    {
        resultSet = statement.executeQuery("select p.propertyid,p.type,p.price,p.locality_address,p.landmark,p.on_market_date,p.locality_pincode,p.agentid,a.name,c.contact_no,d.BHK,d.size from property p, agent a,contact c,details d where p.agentid=a.agentid and a.contactid=c.contactid and p.propertyid=d.propertyid  and p.tag='available' and p.type='R' and l.locality_name="+"'"+lname+"'"+" and d.BHK="+"'"+bhk+"'");

        while(resultSet.next())
        {
            String a=resultSet.getString(1);
            String b=resultSet.getString(2);
            String c=resultSet.getString(3);
            String d=resultSet.getString(4);
            String e=resultSet.getString(5);
            String f=resultSet.getString(6);
            String g=resultSet.getString(7);
            String h=resultSet.getString(8);
            String i=resultSet.getString(9);
            String j=resultSet.getString(10);
            String k=resultSet.getString(11);
            String l=resultSet.getString(12);
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
              <td><%= j%></td>
              <td><%= k%></td>
              <td><%= l%></td>
            </tr>
            
            <%
        }
    }
    else if(!(lname.equals("")) && (bhk.equals("BHK")) && !(budg.equals("00000")) )
    {
        resultSet = statement.executeQuery("select p.propertyid,p.type,p.price,p.locality_address,p.landmark,p.on_market_date,p.locality_pincode,p.agentid,a.name,c.contact_no,d.BHK,d.size from property p, agent a,contact c,details d where p.agentid=a.agentid and a.contactid=c.contactid and p.propertyid=d.propertyid  and p.tag='available' and p.type='R' and p.price"+budg+" and l.locality_name="+"'"+lname+"'");

        while(resultSet.next())
        {
            String a=resultSet.getString(1);
            String b=resultSet.getString(2);
            String c=resultSet.getString(3);
            String d=resultSet.getString(4);
            String e=resultSet.getString(5);
            String f=resultSet.getString(6);
            String g=resultSet.getString(7);
            String h=resultSet.getString(8);
            String i=resultSet.getString(9);
            String j=resultSet.getString(10);
            String k=resultSet.getString(11);
            String l=resultSet.getString(12);
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
              <td><%= j%></td>
              <td><%= k%></td>
              <td><%= l%></td>
            </tr>
            
            <%
        }
    }
    else if(lname.equals("") && !(bhk.equals("BHK")) && !(budg.equals("00000")) )
    {
        resultSet = statement.executeQuery("select p.propertyid,p.type,p.price,p.locality_address,p.landmark,p.on_market_date,p.locality_pincode,p.agentid,a.name,c.contact_no,d.BHK,d.size from property p, agent a,contact c,details d where p.agentid=a.agentid and a.contactid=c.contactid and p.propertyid=d.propertyid  and p.tag='available' and p.type='R' and p.price"+budg+" and d.BHK="+"'"+bhk+"'");

        while(resultSet.next())
        {
            String a=resultSet.getString(1);
            String b=resultSet.getString(2);
            String c=resultSet.getString(3);
            String d=resultSet.getString(4);
            String e=resultSet.getString(5);
            String f=resultSet.getString(6);
            String g=resultSet.getString(7);
            String h=resultSet.getString(8);
            String i=resultSet.getString(9);
            String j=resultSet.getString(10);
            String k=resultSet.getString(11);
            String l=resultSet.getString(12);
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
              <td><%= j%></td>
              <td><%= k%></td>
              <td><%= l%></td>
            </tr>
            
            <%
        }
    }
    else if(!(lname.equals("")) && !(bhk.equals("BHK")) && !(budg.equals("00000")) )
    {
        resultSet = statement.executeQuery("select p.propertyid,p.type,p.price,p.locality_address,p.landmark,p.on_market_date,p.locality_pincode,p.agentid,a.name,c.contact_no,d.BHK,d.size from property p, agent a,contact c,details d, locality l where l.pincode=p.locality_pincode and  p.agentid=a.agentid and a.contactid=c.contactid and p.propertyid=d.propertyid  and p.tag='available' and p.type='R' and p.price"+budg+" and l.locality_name="+"'"+lname+"'"+" and d.BHK='"+bhk+"'");

        while(resultSet.next())
        {
            String a=resultSet.getString(1);
            String b=resultSet.getString(2);
            String c=resultSet.getString(3);
            String d=resultSet.getString(4);
            String e=resultSet.getString(5);
            String f=resultSet.getString(6);
            String g=resultSet.getString(7);
            String h=resultSet.getString(8);
            String i=resultSet.getString(9);
            String j=resultSet.getString(10);
            String k=resultSet.getString(11);
            String l=resultSet.getString(12);
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
              <td><%= j%></td>
              <td><%= k%></td>
              <td><%= l%></td>
            </tr>
            
            <%
        }
    }
    else{
        %>
        <center><h1 style="color:red;padding-top:100px;">WRONG INPUT</h1> </center>
        <%
    }
    %>
</table>
 <%
	statement.close();
	connect.close();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
    %>
    <center> <h2 style="color:red;"><%= e%></h2> </center>
    <%
}


%>

    </body>
</html>
