<%@page import="java.sql.*"%>

<%
   String entry_date=request.getParameter("entry_date");
   String dname=request.getParameter("dname");
   String client_name=request.getParameter("client_name");
   String project=request.getParameter("project");
   String issue=request.getParameter("issue");
   String handoverto=request.getParameter("handoverto");
   String remark=request.getParameter("remark");
   int uid=(Integer)(session.getAttribute("session_uid"));
   
   try
   {
      Class.forName("com.mysql.jdbc.Driver");           
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
      Statement st=con.createStatement();
      
      int i=st.executeUpdate("insert into add_ticketing(ENTRY_DATE,uid,DNAME,CLIENT_NAME,PROJECT,ISSUE,HANDOVERTO,REMARK)values('"+entry_date+"','"+ uid +"','"+dname+"','"+client_name+"','"+project+"','"+issue+"','"+handoverto+"','"+remark+"')");
      
      response.sendRedirect("display_ticketing.jsp");
   
   }
   catch(Exception e)
   {
       System.out.print(e);
   }
%>