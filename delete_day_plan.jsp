<%@page import="java.sql.*"%>

<%
 int id=Integer.parseInt(request.getParameter("id"));
 try
 {
     Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("delete from dayplan_entry where plan_id="+id);
      
      response.sendRedirect("display_plan_entry.jsp");
      
 }
 catch(Exception e)
 {
     System.out.print(e);
 }
%>