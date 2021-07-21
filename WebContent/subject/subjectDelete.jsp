<%@page import="java.sql.* " %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

<%

String subjectId = request.getParameter("id");


Connection conn;
PreparedStatement statement;

Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
statement=conn.prepareStatement("delete from subject where id=?");

statement.setString(1, subjectId);
statement.executeUpdate();

out.println("Subject successfully Deleted!!");


%>