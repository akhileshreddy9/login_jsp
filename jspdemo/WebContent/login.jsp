<head>
<%!
	String str="good morning";	

%>
</head>
<body>
<h3>This is my JSP, <%= str.toUpperCase() %></h3>

<%
	String str="hi";
	out.println("Hello! " + str);
	
%>
</body>