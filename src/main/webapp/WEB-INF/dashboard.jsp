<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>


<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="ISO-8859-1">
<meta name="google-signin-client_id" content="30081514308-nsdkis6qpuda4f9vr2mb2d3aeg0otqgq.apps.googleusercontent.com">
   <script src="https://apis.google.com/js/platform.js" async defer></script>
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<title>Dashboard</title>
</head>
<body>
	<nav>
		<div class="nav-wrapper blue darken-1">
			<a href="dashboard" class="brand-logo" style="margin-left: 30px;">Atm Services</a>
			<ul id="nav-mobile" class="right hide-on-med-and-down">
				<li><a href="#">Welcome :<span><b>${Name}</b></span></a></li>
				
				<li><a href="logout">Log Out</a></li>
			</ul>
		</div>
	</nav>
	<div id="main">
		
		<div class="container">
    <div class="section">

      <!--   Icon Section   -->
      <div class="row">
        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><i class="material-icons">chat_bubble</i></h2>
           <!--  <h5 class="center">Speeds up development</h5>
 -->
            <p class="light">check your balance here
            <form action="balance" method="post">
            <input type="hidden" name="acc_no" value="${acc_no}">
            <input type=submit>
            </form>
          
            </p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><i class="material-icons">group</i></h2>
            

              <p class="light">check your debit transactions here
            <form action="debit" method="post">
            <input type="hidden" name="acc_no" value="${acc_no}">
            <input type=submit>
            </form>
          
            </p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><i class="material-icons">mood</i></h2>
             <p class="light">check your credit transactions here
            <form action="credit" method="post">
            <input type="hidden" name="acc_no" value="${acc_no}">
            <input type=submit>
            </form>
          
            </p>

            </div>
        </div>
      </div>

    </div>
  </div>
		
	</div>
	<footer class="page-footer blue darken-1" style="padding-top: 0px;">
		<div class="footer-copyright">
			
		</div>
	</footer>
</body>

<style>
table {
	width: 800px;
}
#ques {
	background: rgba(255, 255, 255, .3);
	padding: 10px;
	border-radius: 3px;
	width: 820px;
	margin: 30px auto;
}
td {
	font-size: 18px;
	padding-left: 20px;
	background: rgba(255, 255, 255, .4);
}
td a {
	color: #444;
}
h2 {
	font-size: 40px;
	color: #0572d2;
}
#index {
	width: 60px;
}
</style>
</html>