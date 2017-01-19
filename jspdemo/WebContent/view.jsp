<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

</head>
<body>
<table class="table table-bordered table-striped table-hover table-condensed">
<tr class="danger">
	<th align ='center'>Username</th>
	<th align ='center'>Password</th>
	<th colspan ="2" align="center">CRUD Options</th>
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
					<a href = "update.jsp?id=<%=rs.getString(1)  %>"><img src="images/edit.png" /></a>
				</td>
				<td>
					<a href="delete.jsp?id=<%=rs.getString(1)%>"><img src="images/delete.png" /></a>
				</td>
			</tr>
<%				
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<tr>
	<td>
		<a href="add.jsp"><img src="images/add.png" /></a>
	</td>
</tr>
</table>
</body>
</html>