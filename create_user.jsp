<%@page import="java.sql.*"%>

<% 
 String fname=request.getParameter("fname");
 String lname=request.getParameter("lname");
 String phoneno=request.getParameter("phoneno");
 String email=request.getParameter("email");
 String username=request.getParameter("uname");
 String password=request.getParameter("pass");
 
 try
 {
      Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("insert into users(fname,lname,phoneno,email,uname,pass) values ('"+fname+"','"+lname+"','"+phoneno+"','"+email+"','"+username+"','"+password+"')");
 
      response.sendRedirect("display_user.jsp");
 }
 catch(Exception e)
 {
     System.out.print(e);
 }
%>