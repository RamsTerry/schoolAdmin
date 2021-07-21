<%@page import="java.sql.* " %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

<%

String studentId = request.getParameter("id");


Connection conn;
PreparedStatement statement;

Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
statement=conn.prepareStatement("delete from student where id=?");

statement.setString(1, studentId);
statement.executeUpdate();

out.println("Student successfully Deleted!!");


%>