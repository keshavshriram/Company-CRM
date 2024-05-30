<%@page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("plan_id"));
String plan_date=request.getParameter("plan_date");
String plan_day=request.getParameter("plan_day");
String plan_time=request.getParameter("plan_time");
String task_details=request.getParameter("task_details");
String status=request.getParameter("status");
String task=request.getParameter("task");
String plan_by=request.getParameter("plan_by");


try
{
Class.forName("com.mysql.jdbc.Driver");           
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
    
Statement st=con.createStatement();
 String sql ="update dayplan_entry set DATE=?,DAY=?,TIME=?,DETAILS=?,STATUS=?,REMARK=?,PLAN_BY=? where plan_id="+id; 
 
 PreparedStatement ps=con.prepareStatement(sql);
                   ps.setString(1, plan_date);
                   ps.setString(2, plan_day);
                   ps.setString(3, plan_time);
                   ps.setString(4, task_details);
                   ps.setString(5, status);
                   ps.setString(6, task);
                   ps.setString(7, plan_by);

                   
                   int i=ps.executeUpdate();
                   if(i>0)
                   {
                       //out.print("Record Updated Successfully");
                       response.sendRedirect("display_plan_entry.jsp");
                   }
                   else
                   {
                       out.print("Update Fail.....");
                   }

 
}
catch(Exception e)
{
    out.println(e);
}
%>