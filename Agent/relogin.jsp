 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html> 
<html> 
    <head>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
       <title>Agent Login Page</title> 
    </head> 

    <style>
.form-group
{
  margin-left: 10px;
  width: 300px;
}
.btn-primary
{
  margin-left: 15px;
}
.content {
  padding-top: 100px;
  max-width: 300px;
  margin: auto;
}
.cen {
  color: blueviolet;
  font-family:Verdana, Geneva, Tahoma, sans-serif;
}

 </style>
 
     <body class="content">
      <center class="cen"><p><h2><i><b>Agent Login</b></i></h2></p></center>
      <h5 style="color:red;">ooops wrong user ID or password please try again</h3>
        <form method ="get" action="agentResult.jsp"> 
            <div class="form-group">
              <label for="exampleInputEmail1">User ID</label>
              <input type="text" class="form-control" name="id" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Password</label>
              <input type="password" class="form-control" name="pass" id="exampleInputPassword1">
              <small id="emailHelp" class="form-text text-muted">We'll never share your User Id and password with anyone else.</small>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
    </body>

</html> 
