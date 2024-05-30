<%@page import="java.sql.*"%>
<%
   String vname=request.getParameter("vname");
   String pay_date=request.getParameter("pay_date");
   int pay_amt=Integer.parseInt(request.getParameter("pay_amt"));
   String payment_mode=request.getParameter("payment_mode");
   String pay_by=request.getParameter("pay_by");

   try{
        Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("insert into vendor_pay_entry (VNAME,PAY_DATE,PAY_AMT,PAY_MODE,PAY_BY)values('"+vname+"','"+pay_date+"','"+pay_amt+"','"+pay_by+"','"+payment_mode+"')");
      
     out.println("<br><br><br>");
     out.println("<center>");
     out.println("<h2><font color='limegreen'>Vendor Payment Entry Done Successfully</font></h2>");
     out.println("<a href='vendor_payment_entry.html'>Add New Entry </a>");
     out.println("<a href='display_vendor_payment.jsp' Display Vendor Payment </a>");
     out.println("</center>");
   }
   catch(Exception e)
   {
       System.out.println(e);
   }
%>