<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%!
	Connection con;
	
	public void jspInit() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection
					("jdbc:mysql://localhost:3306/sys","root","password");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<jsp:useBean id="user" class="com.demo.model.UserBean" />
<jsp:setProperty name="user" property="*"/>
<jsp:useBean id="obj" class="com.demo.dao.UserDAO" />
</head>

<body>

<form method="post" action="register.jsp">
<table class="table table-bordered table-striped table-hover table-condensed">
<tr class="danger">
	<th>Username</th>
	<th>Password</th>
</tr>
<%
	try{
		ResultSet rs = con.createStatement().executeQuery("select * from user");
		while(rs.next()) {
%>
			<tr id="<%=rs.getString(1) %>" class="success">
				<td contentEditable="true"><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td>
					<a href = "update.jsp?id=<%=rs.getString(1)  %>?pass =<%=rs.getString(2) %>"><img src="images/edit.png" /></a>
				</td>
				<td>
					<a href="delete.jsp?id=<%=rs.getString(1)%>"><img src="images/delete.png" /></a>
				</td>
			</tr>
<%				
		}}
catch(Exception e) 
{
		e.printStackTrace();
	}

		%>
		
		<tr>
		<td><input type="text" name="username" /></td>
		<td><input type="text" name="password" /></td>
		<td colspan ="2">
					<input type="submit"  value="Submit" >
				</td>
				
			
		</tr>
		
	
</table>
</form>
</body>
</html>