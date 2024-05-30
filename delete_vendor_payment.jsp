<%@page import="java.sql.*"%>

<%
 int id=Integer.parseInt(request.getParameter("id"));
 try
 {
     Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("delete from vendor_pay_entry where VENDOR_ID="+id);
      
      response.sendRedirect("display_vendor_payment.jsp");
      
 }
 catch(Exception e)
 {
     System.out.print(e);
 }
%>