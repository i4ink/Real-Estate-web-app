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
    #newdiv{
        padding-left: 200px;
        padding-right: 200px;
        padding-top: 50px;
    }
    #logout1{
        padding-left:1030px;
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

        <div id="newdiv">
        <center><p><h2 style="color:blue;"><b><i>Add New Property</i></b></h2></p></center>
        <form method ="get" action="addPropertyAction.jsp">
            <div class="form-row">
            
              <div class="form-group col-md-8">
                <label for="inputPassword4">Address</label>
                <input type="text" class="form-control" name ="padd" id="inputPassword4" placeholder="Address" required>
              </div>
              <div class="form-group col-md-4">
                <label for="inputPassword4">Locality Name</label>
                <input type="text" class="form-control" name ="lname" id="inputPassword4" placeholder="Locality Name" required>
              </div>
            
            </div>
            <div class="form-row">
            <div class="form-group col-sm-8">
              <label for="inputAddress">Landmark</label>
              <input type="text" class="form-control" name="pmark" id="inputAddress" placeholder="Landmark">
            </div>
            <div class="form-group col-md-4">
                <label for="inputAddress">Price</label>
                <input type="number" class="form-control" name="pprice" id="price" placeholder="Price of Property" required>
              </div>

            </div>
            <fieldset class="form-group" >
                <div class="row">
                  <legend class="col-form-label col-sm-2 pt-0">BHK:</legend>
                  <div class="col-sm-10" >
                    <div class="form-check" >
                      <input class="form-check-input" type="radio" name="bhk" id="gridRadios1" value="1 BHK" checked>
                      <label class="form-check-label" for="gridRadios1" >
                        1 BHK
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="bhk" id="gridRadios2" value="2 BHK">
                      <label class="form-check-label" for="gridRadios2">
                        2 BHK
                      </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="bhk" id="gridRadios3" value="3 BHK">
                        <label class="form-check-label" for="gridRadios3">
                          3 BHK
                        </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="radio" name="bhk" id="gridRadios4" value="4 BHK">
                        <label class="form-check-label" for="gridRadios4">
                          4 BHK
                        </label>
                     </div>
                  </div>
                </div>
              </fieldset>
            <div class="form-row">
              <div class="form-group col-md-3">
                <label for="inputagent">Your Agent ID</label>
                <input type="number" class="form-control" name="aid" id="inputagent" required>
              </div>
              <div class="form-group col-md-4">
                <label for="type">Type(Sale/Rent)</label>
                <input type="text" class="form-control" name="ptype" id="type" required>
              </div>
              <div class="form-group col-md-5">
                <label for="inputpin">Pin Code</label>
                <input type="number" class="form-control" name="ppin" id="inputpin" required>
              </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="datepicker">Available on Market Date</label>
                    <input type="text" class="form-control" name="pdate" id="datepicker" required>
                </div> 
                <div class="form-group col-md-3">
                    <label for="inputpin">Property Area</label>
                    <input type="number" class="form-control" name="parea" id="inputarea" required>
                  </div>
                <div class="form-group col-md-5">
                <form action="/action_page.php">
        <label for="img">Select image:</label>
      <input type="file" class="form-control"  id="img" name="img" accept="image/*">
      </form>
                  </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
          </div>
    </body>
</html>
