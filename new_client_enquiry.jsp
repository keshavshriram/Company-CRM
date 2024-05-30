<%@page import="java.sql.*"%>
<%
   String enq_date=request.getParameter("enq_date");
   String fname=request.getParameter("fname");
   String lname=request.getParameter("lname");
   String phoneno=request.getParameter("phoneno");
   String email=request.getParameter("email");
   String profession=request.getParameter("profession");
   String client_info=request.getParameter("client_info");
   String client_suggested_info=request.getParameter("client_suggested_info");
   String status=request.getParameter("status");

   try{
        Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("insert into client_enquiry(CLIENT_ENTRY_DATE,FNAME,LNAME,PHONENO,EMAIL,PROFESSION,CLIENT_INFO,CLIENT_SUGG_PROF,SELECT_STATUS)values('"+enq_date+"','"+fname+"','"+lname+"','"+phoneno+"','"+email+"','"+profession+"','"+client_info+"','"+client_suggested_info+"','"+status+"')");
      
     out.println("<br><br><br>");
     out.println("<center>");
     out.println("<h2><font color='limegreen'>Enquiry Submit Successfully</font></h2>");
     out.println("<a href='new_client_enquiry.html'>Add New Entry </a>");
     out.println("<a href='display_client_enquiry.jsp' Display Client Enquiry </a>");
     out.println("</center>");
   }
   catch(Exception e)
   {
       System.out.println(e);
   }
%>