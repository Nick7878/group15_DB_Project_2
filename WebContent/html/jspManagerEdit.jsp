 <%@page import ="java.sql.DriverManager"%>
 <%@page import ="java.sql.ResultSet"%>
 <%@page import ="java.sql.Statement"%>
 <%@page import ="java.sql.Connection"%> 
 <%@page import = "java.sql.PreparedStatement" %>
 <%@page contentType = "text/html" pageEncoding = "UTF-8"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.Date,java.sql.*"%>
<%@ page import=" java.util.regex.Pattern"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
 <%@ include file = "genericPage.html" %>

<!DOCTYPE html>
<html>
<head> </head>
<p><br></p>
<%

try{
	

PreparedStatement stmt = null;
String host = "jdbc:mysql://localhost:3306/cs336project?useSSL=false";
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection(host, "root", "gameboy*1");


%>
<form action ="jspCompleteManagerEditAction.jsp" method = "post">
	<%
	Statement statement = conn.createStatement();
	String accountNumber = request.getParameter("u");
	int accountNum = Integer.parseInt(accountNumber);
	String customersWithAccountNumQuery = "SELECT * FROM customer WHERE accountNum = " + accountNum;
	ResultSet resultSet = statement.executeQuery(customersWithAccountNumQuery);
	while(resultSet.next()){
	%>
	<input type = "hidden" name = "accNum" value = <%=resultSet.getString("accountNum") %> />
	<div class = "form-group">
		<label> Last Name </label>
		<input type = "text" class = "form-control" name = "lastName" value = <%=resultSet.getString("lastName") %> />
	</div>
	
	<div class = "form-group">
		<label>First Name: </label>
		<input type = "text" class = "form-control" name = "firstName" value = <%=resultSet.getString("firstName") %> />
	</div>
	
	<div class = "form-group">
		<label>Address: </label>
		<input type = "text" class = "form-control" name = "address" value = <%=resultSet.getString("address") %> />
	</div>
	
	<div class = "form-group">
		<label>City: </label>
		<input type = "text" class = "form-control" name = "city" value = <%=resultSet.getString("city") %> />
	</div>
	
	<div class = "form-group">
		<label>State: </label>
		<input type = "text" class = "form-control" name = "state" value = <%=resultSet.getString("state") %> maxLength="2" />
	</div>
	
	<div class = "form-group">
		<label>Zipcode: </label>
		<input type = "text" class = "form-control" name = "zip" value = <%=resultSet.getString("zipCode") %> maxLength="5" />
	</div>
	
	<div class = "form-group">
		<label>Telephone: </label>
		<input type = "text" class = "form-control" name = "telephone" value = <%=resultSet.getString("telephone") %> maxLength="10"/>
	</div>
	
	<div class = "form-group">
		<label>Credit Card #: </label>
		<input type = "text" class = "form-control" name = "creditCard" value = <%=resultSet.getString("creditCardNum") %> maxLength="16"/>
	</div>
	<%
	}
	%>
	<button type = "submit" id = "updateButton"> Update</button>
	</form>
	
	<%
} catch(Exception e) {
	e.printStackTrace();
	//make an alert and redirect back to managerTest using Javascript<!-- if error, show the alert and go back to login page --> 
	%>
	<script> 
    alert("Sorry, couldn't bring up account info to edit.");
    window.location.href = "jspManagerTest.jsp";
	</script>
	<%
}
%>
</html>
