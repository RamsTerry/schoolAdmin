<%@page import="java.sql.* " %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

<%

String teacherId = request.getParameter("id");


Connection conn;
PreparedStatement statement;

Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
statement=conn.prepareStatement("delete from teacher where id=?");

statement.setString(1, teacherId);
statement.executeUpdate();

out.println("Teacher successfully Deleted!!");


%>