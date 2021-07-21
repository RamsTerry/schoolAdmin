<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.* " %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Subject</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<body>

	<div class='row'>
	<div class ="col-sm-4">
		<h1>Insert Subject Details</h1>
		<form action='addSubject.jsp' method="post">
			<div class="form-group">
				<label for="exampleInputPassword1">Subject Name</label> <input
					type="text" name="subjectName" class="form-control"
					id="exampleInputPassword1" placeholder="Enter Name">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Subject Code</label> <input
					type="text" name="subjectCode" class="form-control"
					id="exampleInputPassword2" placeholder="Enter Code">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Description</label> <input
					type="text" name="description" class="form-control"
					id="exampleInputPassword3" placeholder="Enter Description">
			</div>
			<button type="submit" id="" class="btn btn-primary" value="submit">Submit</button>
		</form>
		</div>
		<div class="col-sm-3">
		
		<table id="tb-sub" cellpadding="5" >
			<thead>
			<tr>
			<th>Subject Name</th>
			<th>Subject Code</th>
			<th>Subject Description</th>
			<th>Subject Delete</th>
			</tr>
			</thead>
			<tbody>
			<%
			Connection conn;
			PreparedStatement statement;
			ResultSet rs;

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
			String query="select * from subject";
			Statement st=conn.createStatement();
			rs=st.executeQuery(query);
			while(rs.next()){
				String id=rs.getString("id");
			
			%>
			<tr padding="5px">
			<td><%=rs.getString("subjectName") %></td>
			<td><%=rs.getString("subjectCode") %></td>
			<td><%=rs.getString("description") %></td>
			<td><a href="subjectDelete.jsp?id=<%=id%>">Delete</a></td>
			</tr>
			<%} %>
			</tbody>
		</table>
		
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>