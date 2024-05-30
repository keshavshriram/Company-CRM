<%@page import="java.sql.*"%>

<%
 int id=Integer.parseInt(request.getParameter("id"));
 try
 {
     Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("delete from client_registration where reg_id="+id);
      
      response.sendRedirect("display_registered_client.jsp");
      
 }
 catch(Exception e)
 {
     System.out.print(e);
 }
%>