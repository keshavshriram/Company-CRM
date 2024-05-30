<%@page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("userid"));
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String phoneno=request.getParameter("phoneno");
String email=request.getParameter("email");
String pass=request.getParameter("pass");
String uname=request.getParameter("uname");

try
{
Class.forName("com.mysql.jdbc.Driver");           
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
    
Statement st=con.createStatement();
 String sql ="update users set FNAME=?,LNAME=?,PHONENO=?,EMAIL=?,UNAME=?,PASS=? where userid="+id; 
 
 PreparedStatement ps=con.prepareStatement(sql);
                   ps.setString(1, fname);
                   ps.setString(2, lname);
                   ps.setString(3, phoneno);
                   ps.setString(4, email);
                   ps.setString(5, uname);
                   ps.setString(6, pass);
                   
                   int i=ps.executeUpdate();
                   if(i>0)
                   {
                       //out.print("Record Updated Successfully");
                       response.sendRedirect("display_for_update.jsp");
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