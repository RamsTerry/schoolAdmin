<%@page import="java.sql.* " %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

<%

String name = request.getParameter("subjectName");
String code = request.getParameter("subjectCode");
String description = request.getParameter("description");

Connection conn;
PreparedStatement statement;

Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
statement=conn.prepareStatement("insert into subject(subjectName,subjectCode,description) values(?,?,?)");

statement.setString(1, name);
statement.setString(2, code);
statement.setString(3, description);
statement.execute();

out.println("Subject successfully Added!!");


%>