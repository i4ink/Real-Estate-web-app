 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html> 
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
    
<style>
    body{
        padding-left: 200px;
        padding-right: 200px;
        padding-top: 150px;
    }
    
</style>  
<script>
   $( document ).ready(function() {
    $("#datepicker").datepicker({ 
        format: 'yyyy-mm-dd'
    });
    $("#datepicker").on("change", function () {
        var fromdate = $(this).val();
        //alert(fromdate);
    });
});
   
    </script>
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
        <nav style="position:fixed;left:0;right:0;top:0;width:100%;" class="navbar navbar-expand-lg navbar-light bg-light">
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

        <center><h3><a href="agentProperty.jsp">click here</a>to see you properties</h3></center> <br><br>
        <center><p><h2><b><i>Update Sold/Rented Property Details</i></b></h2></p></center>
        <form method="get" action="updateSalesAction.jsp">
            <div class="form-row">
              <div class="form-group col-md-3">
                <label for="inputpropid">Property ID</label>
                <input type="number" class="form-control" name="pid" placeholder="Property ID">
              </div>
              <div class="form-group col-md-3">
                <label for="inputclientname">Client Name</label>
                <input type="text" class="form-control" name="cname" placeholder="Client Name" required>
              </div>
              <div class="form-group col-md-3">
                <label for="inputcontactno">Client Contact No.</label>
                <input type="number" class="form-control" name="ccont" placeholder="Client Contact No.">
              </div>
              <div class="form-group col-md-3">
                <label for="locality">Client Locality Name</label>
                <input type="text" placeholder="Locality Name" class="form-control" id="localityname" name="lname" required>
            </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-4">
                <label for="inputagent">Your Agent ID</label>
                <input type="number" placeholder="Agent ID" class="form-control" name="aid" required>
              </div>
              <div class="form-group col-md-4">
                <label for="datepicker">Selling Date</label>
                <input type="text" class="form-control" placeholder="YYYY-MM-DD" id="datepicker" name="sdate" required>
            </div>
            <div class="form-group col-md-4">
                <label for="cpin1">Client Pincode</label>
                <input type="number" placeholder="XXXXXX" class="form-control" id="cpin1" name="cpin" required>
            </div> 
            </div>
            <div class="form-row">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
          <!--<h4>${userid}</h4> -->
    </body>
</html>