<%@page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("reg_id"));
String enq_date=request.getParameter("enq_date");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String phoneno=request.getParameter("phoneno");
String email=request.getParameter("email");
String profession=request.getParameter("profession");
String client_info=request.getParameter("client_info");
String comp_name=request.getParameter("comp_name");
String comp_add=request.getParameter("comp_add");


try
{
Class.forName("com.mysql.jdbc.Driver");           
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
    
Statement st=con.createStatement();
 String sql ="update client_registration set REG_DATE=?,FNAME=?,LNAME=?,PHONENO=?,EMAIL=?,PROFESSION=?,CLIENT_INFO=?,COMP_NAME=?,COMP_ADD=? where reg_id="+id; 
 
 PreparedStatement ps=con.prepareStatement(sql);
                   ps.setString(1, enq_date);
                   ps.setString(2, fname);
                   ps.setString(3, lname);
                   ps.setString(4, phoneno);
                   ps.setString(5, email);
                   ps.setString(6, profession);
                   ps.setString(7, client_info);
                   ps.setString(8, comp_name);
                   ps.setString(9, comp_add);

                   
                   int i=ps.executeUpdate();
                   if(i>0)
                   {
                       //out.print("Record Updated Successfully");
                       response.sendRedirect("display_registered_client.jsp");
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