<%@page import="java.sql.*"%>
<%
   String pay_date=request.getParameter("pay_date");
   String pay_time=request.getParameter("pay_time");
   String fname=request.getParameter("fname");
   String lname=request.getParameter("lname");
   int pay_amt=Integer.parseInt(request.getParameter("pay_amt"));
   String job=request.getParameter("job");
   String payment_mode=request.getParameter("payment_mode");
   String incentive_amt=request.getParameter("incentive_amt");
   int final_pay_amt=Integer.parseInt(request.getParameter("final_pay_amt"));

   try{
        Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("insert into employee_pay_entry (PAY_DATE,PAY_TIME,FNAME,LNAME,PAY_AMT,JOB,PAY_MODE,INCENTIVE_AMT,FINAL_AMT)values('"+pay_date+"','"+pay_time+"','"+fname+"','"+lname+"','"+pay_amt+"','"+job+"','"+payment_mode+"','"+incentive_amt+"','"+final_pay_amt+"')");
      
     out.println("<br><br><br>");
     out.println("<center>");
     out.println("<h2><font color='limegreen'>Employee Payment Entry Done Successfully</font></h2>");
     out.println("<a href='employee_payment_entry.html'>Add New Entry </a>");
     out.println("<a href='display_emppayment_entry.jsp' Display Employee Payment </a>");
     out.println("</center>");
   }
   catch(Exception e)
   {
       System.out.println(e);
   }
%>