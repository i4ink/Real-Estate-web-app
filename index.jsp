<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>
        Real Estate Agency
    </title>
    <style>
        #manager{
            padding-left: 900px;
        }
        .search-sec{
            padding: 2rem;
        }
        .search-slt{
            display: block;
            width: 100%;
            font-size: 0.875rem;
            line-height: 1.5;
            color: #55595c;
            //background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            height: calc(3rem + 2px) !important;
            border-radius:0;
        }
        .wrn-btn{
            width: 100%;
            font-size: 16px;
            font-weight: 400;
            text-transform: capitalize;
            height: calc(3rem + 2px) !important;
            border-radius:0;
        }
        @media (min-width: 992px){
            .search-sec{
                position: relative;
                top: -114px;
                //background: rgba(26, 70, 104, 0.51);
            }
        }
       
        @media (max-width: 1920px){
            .search-sec{
                background: rgb(8, 43, 70);
            }
        }
        #search
        {
            padding: 10px;
            margin-top: 110px;
            margin-bottom: 0px;
        }
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
  opacity:0.7;
}
.container1 {
  margin: 20px auto;
  width: 100%;
  max-width: 550px;
}
  body{
width: 100%;
height:100%;
background-attachment:fixed;
    background-image: url('1.jpg');
margin-top:0;
padding:0;
background-size:100% 114%;
background-repeat: no-repeat;
}


    </style>
    <script>
        $( function() {
            var availableTags = [
            "Fancy Bazar",
            "Silpukhuri",
            "Kharguli",
            "Dispur",
            "Ganeshguri",
            "Ulubari",
            "Rehabari",
            "Bharalumukh",
            "Kamakhya",
            "Maligaon",
            "Pandu",
            "Jhalukbari",
            "Dharapur",
            "Guwahati Airport",
            "Gopinath Nagar",
            "Azara",
            "Binova Nagar",
            "Kahilipara",
            "Noonmati",
            "Bamunimaidan",
            "Khanapara",
            "Amerigog",
            "Zoo Road",
            "Beltola",
            "Amingaon"
            ];
            $( "#tags,#tags1").autocomplete({
                source: availableTags
            });
        } );

    </script>
    <script>
        $( function() {
            var availableloc_Tags = [
            "781001",
            "781003",
            "781004",
            "781005",
            "781006",
            "781007",
            "781008",
            "781009",
            "781010",
            "781011",
            "781012",
            "781013",
            "781014",
            "781015",
            "781016",
            "781017",
            "781018",
            "781019",
            "781020",
            "781021",
            "781022",
            "781023",
            "781024",
            "781025"
            ];
            $( "#loc_tag" ).autocomplete({
                source: availableloc_Tags
            });
        } );
    </script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <!--<a class="navbar-brand" href="#">Real Estate Agency</a>-->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
               
                <li class="nav-item active">
                <form  method="post" action="index.jsp">
                    <button type="button" class="btn btn-dark"><a style="font-family:Times New Roman;color:red" >Real Estate Agency</a></button>
                    </form>
                </li>
               
                <li class="nav-item" id="manager">
                    <a style="color:blue" class="form-control mr-sm-2" href="Manager/login.jsp">Manager login</a>
                </li>
                <li style="color:blue;" class="nav-item">
                    <a  style="color:blue;" class="form-control mr-sm-2" href="Agent/login.jsp">Agent Login</a>
                </li>
            </ul>
        </div>
    </nav>
 
            <section class="search-sec" id="search">
                <div class="container">
                    <form action="searchResult.jsp" method="post" novalidate="novalidate">
                        <div class="row">
                            <div class="col-lg-12">
                                 <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-10 p-0">
                                        <input type="text" name="lname" class="form-control search-slt" placeholder="Enter Locality" id="tags">
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                        <select type="text" name="bhk" class="form-control search-slt" id="BHK">
                                            <option value="BHK" selected> BHK </option>
                                            <option value="1BHK"> 1BHK </option>
                                            <option value="2BHK"> 2BHK </option>
                                            <option value="3BHK"> 3BHK </option>
                                            <option value="4BHK"> 4BHK </option>
                                        </select>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                        <select type="text" name="budg" class="form-control search-slt" id="Budget">
                                            <option value="00000" selected> 00000 </option>
                                            <option value="<10000"> <10000 </option>
                                            <option value="<15000"> <15000 </option>
                                            <option value="<20000"> <20000 </option>
                                            <option value="<30000"> <30000 </option>
                                        </select>
                                    </div>
                                   
                                    <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                        <button type="submit" class="btn btn-danger wrn-btn">Search for Rent</button>
                                    </div>
                                </div>
                                <br>
                                </div>
                                </div>
                                </form>
                               
                    <form action="searchResultBuy.jsp" method="post" novalidate="novalidate">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-10 p-0">
                                        <input type="text" name="lname" class="form-control search-slt" placeholder="Enter Locality" id="tags1">
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                        <select type="text" name="bhk" class="form-control search-slt" id="BHK">
                                            <option value="BHK" selected> BHK </option>
                                            <option value="1BHK"> 1BHK </option>
                                            <option value="2BHK"> 2BHK </option>
                                            <option value="3BHK"> 3BHK </option>
                                            <option value="4BHK"> 4BHK </option>
                                        </select>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                        <select type="text" name="budg" class="form-control search-slt" id="Budget">
                                            <option value="0000000" selected> 0000000 </option>
                                            <option value="<2000000"> <2000000 </option>
                                            <option value="<3000000"> <3000000 </option>
                                            <option value="<4000000"> <4000000 </option>
                                            <option value="<5000000"> <5000000 </option>
                                            <option value="<7000000"> <7000000 </option>
                                            <option value="<1000000"> <10000000 </option>
                                        </select>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                        <button type="submit" class="btn btn-danger wrn-btn">Search for Buy</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <div class="container1">
                <form action="pincodeSearch.jsp" method="post" novalidate="novalidate">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-9 col-md-6 col-sm-6 p-0">
                                    <input type="number" id="loc_tag" name="pcode" class="form-control search-slt" placeholder="Enter Pincode to see Available Properties near your location" >
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                                    <button type="submit" class="btn btn-danger wrn-btn">Enter</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
                <!--<center><h2 style="color:white";><b><u><i>Properties Details</i></u></b></h2></center>
-->

<%-- 
<div class="table-responsive-sm">
<table class="table table-hover" id="table">
  <tr>
    <th style="color:white";>ID</th>
    <th style="color:white";>Locality</th>
    <th style="color:white";>landmark</th>
    <th style="color:white";>Pincode</th>
    <th style="color:white";>BHK</th>
    <th style="color:white";>Price</th>
    <th style="color:white";>Sell/Rent</th>
  </tr>
  <tr>
    <td style="color:green">1.</td>
    <td style="color:green">Shine Heaven</td>
    <td style="color:green">Sankat Mochan Mandir</td>
    <td style="color:green">7801021</td>
    <td style="color:green">2BHK</td>
    <td style="color:green">32.3L</td>
    <td style="color:green">Sale</td>
  </tr>
 
 
</table>
</div> --%>
<footer style="color:blue;padding-top:230px;padding-left:540px">&copy;Copyright 2020 Real Estate Agency</footer>
        </body>
        </html>
