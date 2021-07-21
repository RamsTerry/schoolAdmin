<%@page import="java.sql.* " %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

<%
String fname = request.getParameter("firstname");
String lname = request.getParameter("lastName");
String num = request.getParameter("EmployeeNum");
String sub = request.getParameter("subject");
String gr = request.getParameter("grade");
String ge = request.getParameter("gender");
String rac = request.getParameter("race");
String mail = request.getParameter("email");
String phone = request.getParameter("phone");

Connection conn;
PreparedStatement statement;

Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/adminSchool", "root", "");
statement=conn.prepareStatement("insert into teacher(fname,lname,empnumber,subject,grade,gender,race,email,phone) values(?,?,?,?,?,?,?,?,?)");

statement.setString(1, fname);
statement.setString(2, lname);
statement.setString(3, num);
statement.setString(4, sub);
statement.setString(5, gr);
statement.setString(6, ge);
statement.setString(7, rac);
statement.setString(8, mail);
statement.setString(9, phone);
statement.execute();

out.println("Teacher successfully Added!!");


%>