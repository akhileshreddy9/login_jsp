<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.demo.dao.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<jsp:useBean id="obj" class="com.demo.dao.UserDAO" />
<table>


<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
int x = obj.updateUser(id,pass);
response.sendRedirect("view.jsp");
%>



</table>
</body>
</html>