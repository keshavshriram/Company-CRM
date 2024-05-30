<%@page import="java.sql.*"%>
<%
   String enq_date=request.getParameter("enq_date");
   String fname=request.getParameter("fname");
   String lname=request.getParameter("lname");
   String phoneno=request.getParameter("phoneno");
   String email=request.getParameter("email");
   String profession=request.getParameter("profession");
   String client_info=request.getParameter("client_info");
   String comp_name=request.getParameter("comp_name");
   String comp_add=request.getParameter("comp_add");

   try{
        Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("insert into client_registration (REG_DATE,FNAME,LNAME,PHONENO,EMAIL,PROFESSION,CLIENT_INFO,COMP_NAME,COMP_ADD)values('"+enq_date+"','"+fname+"','"+lname+"','"+phoneno+"','"+email+"','"+profession+"','"+client_info+"','"+comp_name+"','"+comp_add+"')");
      
     out.println("<br><br><br>");
     out.println("<center>");
     out.println("<h2><font color='limegreen'>Registration Done Successfully</font></h2>");
     out.println("<a href='client_registration.html'>New Registration </a>");
     out.println("<a href='display_registered_client.jsp' Display Registered Client </a>");
     out.println("</center>");
   }
   catch(Exception e)
   {
       System.out.println(e);
   }
%>