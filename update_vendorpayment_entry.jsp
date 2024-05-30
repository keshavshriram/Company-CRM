<%@page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("vendor_id"));
String pay_date=request.getParameter("pay_date");
String vname=request.getParameter("vname");
int amt_paid=Integer.parseInt(request.getParameter("amt_paid"));
String payment_mode=request.getParameter("payment_mode");
String pay_by=request.getParameter("pay_by");


try
{
Class.forName("com.mysql.jdbc.Driver");           
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
    
Statement st=con.createStatement();
 String sql ="update vendor_pay_entry set PAY_DATE=?,VNAME=?,PAY_AMT=?,PAY_MODE=?,PAY_BY=? where vendor_id="+id; 
 
 PreparedStatement ps=con.prepareStatement(sql);
                   ps.setString(1, pay_date);
                   ps.setString(2, vname);
                   ps.setInt(3, amt_paid);
                   ps.setString(4, payment_mode);
                   ps.setString(5, pay_by);
                   
                   int i=ps.executeUpdate();
                   if(i>0)
                   {
                       //out.print("Record Updated Successfully");
                       response.sendRedirect("display_vendor_payment.jsp");
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