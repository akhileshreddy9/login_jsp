var oldUsername;
function checking(username,password)
{
	oldUsername = username;
	 var table = document.getElementById("mytable");
	 var val = document.getElementById(username).rowIndex;
	    table.deleteRow(val);
	    table.insertRow(val).innerHTML = '<td><input type="text" id="username" value="'+username+'"></td> <td><input type="text" id="password" value="'+password+'"></td><td><input type="button" value="Submit" onclick="fun()"></td>';
	   
}

function fun()
{
	
	
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	
	window.location = 'update.jsp?username='+username+'&password='+password+'&oldUsername='+oldUsername;
}
