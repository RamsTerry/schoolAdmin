<%@page import="java.sql.* " %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

<%

String batchId = request.getParameter("id");


Connection conn;
PreparedStatement statement;

Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
statement=conn.prepareStatement("delete from batch where id=?");

statement.setString(1, batchId);
statement.executeUpdate();

out.println("Grade successfully Deleted!!");


%>