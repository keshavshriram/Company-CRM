<%@page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("pay_id"));
String pay_date=request.getParameter("pay_date");
String pay_time=request.getParameter("pay_time");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
int pay_amt=Integer.parseInt(request.getParameter("pay_amt"));
String job=request.getParameter("job");
String payment_mode=request.getParameter("payment_mode");
String incentive_amt=request.getParameter("incentive_amt");
int final_pay_amt=Integer.parseInt(request.getParameter("final_pay_amt"));


try
{
Class.forName("com.mysql.jdbc.Driver");           
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
    
Statement st=con.createStatement();
 String sql ="update employee_pay_entry set PAY_DATE=?,PAY_TIME=?,FNAME=?,LNAME=?,PAY_AMT=?,JOB=?,PAY_MODE=?,INCENTIVE_AMT=?,FINAL_AMT=? where EMP_PAY_ID="+id; 
 
 PreparedStatement ps=con.prepareStatement(sql);
                   ps.setString(1, pay_date);
                   ps.setString(2, pay_time);
                   ps.setString(3, fname);
                   ps.setString(4, lname);
                   ps.setInt(5, pay_amt);
                   ps.setString(6, job);
                   ps.setString(7, payment_mode);
                   ps.setString(8, incentive_amt);
                   ps.setInt(9, final_pay_amt);

                   
                   int i=ps.executeUpdate();
                   if(i>0)
                   {
                       //out.print("Record Updated Successfully");
                       response.sendRedirect("display_emppayment_entry.jsp");
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