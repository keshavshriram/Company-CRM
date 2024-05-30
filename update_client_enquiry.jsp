<%@page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("client_id"));
String enq_date=request.getParameter("enq_date");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String phoneno=request.getParameter("phoneno");
String email=request.getParameter("email");
String profession=request.getParameter("profession");
String client_info=request.getParameter("client_info");
String client_suggested_info=request.getParameter("client_suggested_info");
String status=request.getParameter("status");


try
{
Class.forName("com.mysql.jdbc.Driver");           
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
    
Statement st=con.createStatement();
 String sql ="update client_enquiry set CLIENT_ENTRY_DATE=?,FNAME=?,LNAME=?,PHONENO=?,EMAIL=?,PROFESSION=?,CLIENT_INFO=?,CLIENT_SUGG_PROF=?,SELECT_STATUS=? where client_id="+id; 
 
 PreparedStatement ps=con.prepareStatement(sql);
                   ps.setString(1, enq_date);
                   ps.setString(2, fname);
                   ps.setString(3, lname);
                   ps.setString(4, phoneno);
                   ps.setString(5, email);
                   ps.setString(6, profession);
                   ps.setString(7, client_info);
                   ps.setString(8, client_suggested_info);
                   ps.setString(9, status);

                   
                   int i=ps.executeUpdate();
                   if(i>0)
                   {
                       //out.print("Record Updated Successfully");
                       response.sendRedirect("display_client_enquiry.jsp");
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