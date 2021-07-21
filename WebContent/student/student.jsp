<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.* " %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<% 			Connection conn;
			PreparedStatement statement;
			ResultSet rs;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Student</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<body>

	<div class='row'>
	<div class ="col-sm-4">
		<h1>Insert Student</h1>
				<form action="add.jsp" method="post">
			<div class="form-group">
				<label for="exampleInputPassword1">First Name</label> <input
					type="text" name="firstname" class="form-control"
					id="exampleInputPassword1" placeholder="First Name">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Last Name</label> <input
					type="text" name="lastName" class="form-control"
					id="exampleInputPassword1" placeholder="Last Name">
			</div>
						<div class="form-group">
				<label for="exampleInputPassword1">Student Number</label> <input
					type="text" name="studentNum" class="form-control"
					id="exampleInputPassword1" placeholder="Enter the Student Number">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Subject</label>
				<select name="subject" id="subject" >
				<option>-----Select Subject----</option>
				<%
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
				String query="select * from subject";
				Statement st=conn.createStatement();
				rs=st.executeQuery(query);
				
				while(rs.next()){
					String id=rs.getString("id");
				String subjectName = rs.getString("subjectName");	
				%>
				<option value="<%=id%>"><%=subjectName %></option>
				<%} %>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Grade</label>
				<select name="grade" id="grade" >
				<option>-----Select Grade----</option>
			<% 
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
				String query2="select * from batch";
				Statement st2=conn.createStatement();
				rs=st.executeQuery(query2);
				
				while(rs.next()){
					String id=rs.getString("id");
				String name = rs.getString("AssignName");	
				%>
				
				<option value="<%=id%>"><%=name %></option>
				<%} %>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Gender</label>
					<select name='gender' class="form-control" id="exampleInputPassword1">
				<option>--Select Gender--</option>
				<option>Male</option>
				<option>Female</option>
				</select>
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> <input
					type="email" name="email" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					placeholder="Enter email" />
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Race</label>
				 <select name='race' class="form-control" id="exampleInputPassword1">
				<option>--Select Race--</option>
				<option>Black</option>
				<option>White</option>
				</select>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Phone Number</label> <input type="text"
					name="phone" class="form-control" id="exampleInputPassword1"
					placeholder="Phone">
			</div>
			<p>
		 <small id="Help"
					class="form-text text-muted">We'll never share your details
					with anyone else.</small></p>
			<button type="submit" class="btn btn-primary" value="submit">Submit</button>
		</form>
		</div>
		<div class="col-sm-3">
		
		<table id="tb-sub" cellpadding="5" >
			<thead>
			<tr>
			<th>Student Name</th>
			<th>Student Lastname</th>
			<th>Student Number</th>
			<th>Student Subject</th>
			<th>Student Grade</th>
			<th>Student Gender</th>
			<th>Student Race</th>
			<th>Student Email</th>
			<th>Student Phone</th>
			<th>Student Delete</th>
			</tr>
			</thead>
			<tbody>
			<%

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
			String query4="select s.id,s.fname,s.lname,s.stdnumber,c.subjectName,b.AssignName,s.gender,s.race,s.email,s.phone from student s JOIN subject c ON s.subject=c.id JOIN batch b ON s.grade=b.id";
			Statement st4=conn.createStatement();
			rs=st.executeQuery(query4);
			while(rs.next()){
				String id=rs.getString("s.id");
			
			%>
			<tr padding="5px">
			<td><%=rs.getString("s.fname") %></td>
			<td><%=rs.getString("s.lname") %></td>
			<td><%=rs.getString("s.stdnumber") %></td>
			<td><%=rs.getString("c.subjectName") %></td>
			<td><%=rs.getString("b.AssignName") %></td>
			<td><%=rs.getString("s.gender") %></td>
			<td><%=rs.getString("s.race") %></td>
			<td><%=rs.getString("s.email") %></td>
			<td><%=rs.getString("s.phone") %></td>
			<td><a href="stdDelete.jsp?id=<%=id%>">Delete</a></td>
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