<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.demo.dao.UserDAO" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.regex.Pattern" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<jsp:useBean id="obj" class="com.demo.dao.UserDAO" />

<%

String id = request.getParameter("id");

int count = 0;
//String text = "anandc@AND.com AND xyz@yahoo.co.in ";
/* String[] splits = id.split(" ? ");
String tempId = splits[0];
String pass= splits[0]; */

String[] strArray= id.split(Pattern.quote("?"));
String tempId = strArray[0];
String pass= strArray[1];

//String pass = request.getParameter("name");
int x = obj.deleteUser(tempId);


//int x = obj.updateUser(id,pass);
//response.sendRedirect("view.jsp");
%>
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










<form method="post" action="register.jsp">
<table class="table table-bordered table-striped table-hover table-condensed">
<tr class="danger">
	<th>Username</th>
	<th>Password</th>
</tr>
<%
	try
{
		ResultSet rs = con.createStatement().executeQuery("select * from user");
		while(rs.next()) {
%>
			<tr id="<%=rs.getString(1) %>" class="success">
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td>
					<a href = "update.jsp?id=<%=rs.getString(1)  %>?pass =<%=rs.getString(2) %>"><img src="images/edit.png" /></a>
				</td>
				<td>
					<a href="delete.jsp?id=<%=rs.getString(1)%>"><img src="images/delete.png" /></a>
				</td>
			</tr>
<% } %>
		
		<tr>
		<td><input type="text" name="username" value = "<%= tempId %>"/></td>
		<td><input type="text" name="password" value="<%= pass %>"/></td>
		<td>
					<input type="submit"  value="Submit" >
				</td>
				<td>
					<a href="delete.jsp"><img src="images/delete.png" /></a>
				</td>
				
			
		</tr>
				<%				
		}
catch(Exception e) 
{
		e.printStackTrace();
	}

		%>
	
</table>
</form>





</body>
</html>