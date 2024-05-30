<%@page import="java.sql.*"%>
<%
   String enq_date=request.getParameter("enq_date");
   String fname=request.getParameter("fname");
   String lname=request.getParameter("lname");
   String phoneno=request.getParameter("phoneno");
   String busi_nature=request.getParameter("busi_nature");
   int pay_amt=Integer.parseInt(request.getParameter("pay_amt"));
   String payment_mode=request.getParameter("payment_mode");
   
   try{
        Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("insert into client_pay_entry (PAY_DATE,FNAME,LNAME,PHONENO,BUSINESS_NATURE,PAY_AMT,PAY_MODE)values('"+enq_date+"','"+fname+"','"+lname+"','"+phoneno+"','"+busi_nature+"','"+pay_amt+"','"+payment_mode+"')");
      
     out.println("<br><br><br>");
     out.println("<center>");
     out.println("<h2><font color='limegreen'>Client Payment Entry Done Successfully</font></h2>");
     out.println("<a href='client_payment_entry.html'>Add New Entry </a>");
     out.println("<a href='display_client_payment.jsp' Display Client Payment </a>");
     out.println("</center>");
   }
   catch(Exception e)
   {
       System.out.println(e);
   }
%>