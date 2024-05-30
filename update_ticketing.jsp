<%@page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("ticketing_id"));
String entry_date=request.getParameter("entry_date");
String dname=request.getParameter("dname");
String client_name=request.getParameter("client_name");
String project_name=request.getParameter("project_name");
String issue=request.getParameter("issue");
String handoverto=request.getParameter("handoverto");
String remark=request.getParameter("remark");


try
{
Class.forName("com.mysql.jdbc.Driver");           
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
    
Statement st=con.createStatement();
 String sql ="update add_ticketing set ENTRY_DATE=?,DNAME=?,CLIENT_NAME=?,PROJECT=?,ISSUE=?,HANDOVERTO=?,REMARK=? where ticketing_id="+id; 
 
 PreparedStatement ps=con.prepareStatement(sql);
                   ps.setString(1, entry_date);
                   ps.setString(2, dname);
                   ps.setString(3, client_name);
                   ps.setString(4, project_name);
                   ps.setString(5, issue);
                   ps.setString(6, handoverto);
                   ps.setString(7, remark);
                   
                   int i=ps.executeUpdate();
                   if(i>0)
                   {
                       //out.print("Record Updated Successfully");
                       response.sendRedirect("display_ticketing.jsp");
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