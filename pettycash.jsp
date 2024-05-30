<%@page import="java.sql.*"%>

<%
   String purchase_date=request.getParameter("purchase_date");
   String dname=request.getParameter("dname");
   String product_name=request.getParameter("product_name");
   int rate=Integer.parseInt(request.getParameter("rate"));
   int qty=Integer.parseInt(request.getParameter("qty"));
   int bill=Integer.parseInt(request.getParameter("bill"));
   String enter_by=request.getParameter("enter_by");
   String purpose=request.getParameter("purpose");
   
   try
   {
      Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("insert into petty_cash(PURCHASE_DATE,DNAME,PRODUCT_NAME,RATE,QUANTITY,BILL,ENTER_BY,PURPOSE)values('"+purchase_date+"','"+dname+"','"+product_name+"','"+rate+"','"+qty+"','"+bill+"','"+enter_by+"','"+purpose+"')");
      
      response.sendRedirect("display_petty_cash.jsp");
   
   }
   catch(Exception e)
   {
       System.out.print(e);
   }
%>