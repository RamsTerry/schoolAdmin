<%@page import="java.sql.* " %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

<%

String name = request.getParameter("AssignName");
String code = request.getParameter("AssignCode");


Connection conn;
PreparedStatement statement;

Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
statement=conn.prepareStatement("insert into batch(assignName,assignCode) values(?,?)");

statement.setString(1, name);
statement.setString(2, code);
statement.execute();

out.println("Grade successfully Added!!");


%>