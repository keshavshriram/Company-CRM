<%@page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("payment_id"));
String enq_date=request.getParameter("enq_date");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String phoneno=request.getParameter("phoneno");
String busi_nature=request.getParameter("busi_nature");
int pay_amt=Integer.parseInt(request.getParameter("pay_amt"));
String payment_mode=request.getParameter("payment_mode");


try
{
Class.forName("com.mysql.jdbc.Driver");           
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
    
Statement st=con.createStatement();
 String sql ="update client_pay_entry set PAY_DATE=?,FNAME=?,LNAME=?,PHONENO=?,BUSINESS_NATURE=?,PAY_AMT=?,PAY_MODE=? where payment_id="+id; 
 
 PreparedStatement ps=con.prepareStatement(sql);
                   ps.setString(1, enq_date);
                   ps.setString(2, fname);
                   ps.setString(3, lname);
                   ps.setString(4, phoneno);
                   ps.setString(5, busi_nature);
                   ps.setInt(6, pay_amt);
                   ps.setString(7, payment_mode);
                   
                   int i=ps.executeUpdate();
                   if(i>0)
                   {
                       //out.print("Record Updated Successfully");
                       response.sendRedirect("display_client_payment.jsp");
                   }
                   else
                   {
                       out.print("Update Fail.....");
                   }

 
}
catch(Exception e)
{
    System.out.println(e);
}
%>