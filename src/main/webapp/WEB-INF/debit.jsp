<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>


<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>



<%
		int i = 1;
	%>
	<div id="main" align="center" style="">
		<div id="lead" class="z-depth-1">
			<h1>${title} transactions</h1>

			<div id="table">
				<table class=" bordered highlight ">
					<tr>
					<th><span>id</span></th>
						<th><span>acc num</span></th>
						

						<th><span>amount</span></th>

						<th><span>date</span></th>
						
					</tr>

					<c:forEach var="result_row" items="${data}">
						<tr>
							<td><%=i%></td>
							<td><c:out value="${acc_no}" /></td>

							
							<td><c:out value="${result_row.amount}" /></td>
							<td><c:out value="${result_row.created_at}" /></td>
							
						</tr>
						<%
							i = i + 1;
						%>

					</c:forEach>

				</table>
			</div>
		</div>
	</div>


</body>
</html>