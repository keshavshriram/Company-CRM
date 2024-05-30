<%@page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("pid"));
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
 String sql ="update petty_cash set PURCHASE_DATE=?,DNAME=?,PRODUCT_NAME=?,RATE=?,QUANTITY=?,BILL=?,ENTER_BY=?,PURPOSE=? where pid="+id; 
 
 PreparedStatement ps=con.prepareStatement(sql);
                   ps.setString(1, purchase_date);
                   ps.setString(2, dname);
                   ps.setString(3, product_name);
                   ps.setInt(4, rate);
                   ps.setInt(5, qty);
                   ps.setInt(6, bill);
                   ps.setString(7, enter_by);
                   ps.setString(8, purpose);

                   
                   int i=ps.executeUpdate();
                   if(i>0)
                   {
                       //out.print("Record Updated Successfully");
                       response.sendRedirect("display_petty_cash.jsp");
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