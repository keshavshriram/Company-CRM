<%@page import="java.sql.*"%>
<%
   String plan_date=request.getParameter("plan_date");
   String plan_day=request.getParameter("plan_day");
   String plan_time=request.getParameter("plan_time");
   String task_details=request.getParameter("task_details");
   String status=request.getParameter("status");
   String task=request.getParameter("task");
   String plan_by=request.getParameter("plan_by");
   
   try{
        Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("insert into dayplan_entry (DATE,DAY,TIME,DETAILS,STATUS,REMARK,PLAN_BY)values('"+plan_date+"','"+plan_day+"','"+plan_time+"','"+task_details+"','"+status+"','"+task+"','"+plan_by+"')");
      
     out.println("<br><br><br>");
     out.println("<centr>");
     out.println("<h2><font color='limegreen'>Entry Done Successfully</font></h2>");
     out.println("<a href='day_plan_entry.html'>Add New Entry </a>");
     out.println("<a href='display_plan_entry.jsp' Display Day Plan </a>");
     out.println("</center>");
   }
   catch(Exception e)
   {
       System.out.println(e);
   }
%>