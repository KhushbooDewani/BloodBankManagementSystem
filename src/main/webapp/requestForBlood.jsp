<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
body{
  background-color: #fafad2;
}
</style>
</head>
<body>
<br>
<center>
<table id="customers">
<tr>
<th style="background-color:#ff6347">Name</th>
<th style="background-color:#ff6347">Mobile Number</th>
<th style="background-color:#ff6347">Email</th>
<th style="background-color:#ff6347">Blood Group</th>
<th style="background-color:#ff6347">Done</th>
<th style="background-color:#ff6347">Delete</th>
</tr>
<tr>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from bloodrequest where status='pending'");
	while(rs.next())
	{	
%>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><a href="requestForBloodDone.jsp?mobilenumber=<%=rs.getString(2)%>">Done</a></td>
<td><a href="requestForBloodDelete.jsp?mobilenumber=<%=rs.getString(2)%>">Delete</a></td>
</tr>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</table>



</center>
<br>
<br>
<br>
<br>
</body>
</html>