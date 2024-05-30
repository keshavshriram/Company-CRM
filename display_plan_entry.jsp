<%@page import="java.sql.*" %>

<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
</script>
<style>
    .table{
        width:100%;
    }
    a{
        text-decoration: none;
        font-size: 17px;
    }
</style>
    </head>
    
    <body>
        
       <%@include file="header.html"%>
        
        <div class="row">
            <div class="col-sm-4">
        <a href="day_plan_entry.html">
            <button class="btn btn-info">
                <span class="glyphicon glyphicon-plus"> Add New Entry</span>
            </button>
        </a>
            </div>       
            <div class="col-sm-8">
        <h3 class="text-center">Day Plan Details</h3>
            </div>
        </div>
    <center>
        <table class="table table-bordered">
            <tr bgcolor="gold">
                <th>SR.NO</th>
                <th>Plan Id</th>
                <th>Plan Date</th>
                <th>Plan Day</th>
                <th>Plan Time</th>
                <th>Task Details</th>
                <th>Task Status</th>
                <th>Remark</th>
                <th>Plan By</th>

                <th colspan="2" align="center">Action</th>
            </tr>
            
            <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");           
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
                 
                    Statement st=con.createStatement();
                    
                    String sql="select * from dayplan_entry order by plan_id desc";
                    ResultSet rs=st.executeQuery(sql);
                    int x=101;
                    while(rs.next())
                    {
                       %>
                        <tr>
                          <td><%=x%></td>
                          <td><%=rs.getInt("PLAN_ID")%></td>
                          <td><%=rs.getString("DATE")%></td>
                          <td><%=rs.getString("DAY")%></td>
                          <td><%=rs.getString("TIME")%></td>
                          <td><%=rs.getString("DETAILS")%></td>
                          <td><%=rs.getString("STATUS")%></td>
                          <td><%=rs.getString("REMARK")%></td>
                          <td><%=rs.getString("PLAN_BY")%></td>

                          
                          <td align="center">
                              <a href="delete_day_plan.jsp?id=<%=rs.getInt("plan_id")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-trash"></span>
                              </button>
                              </a>
                          </td>
                          <td align="center">
                              <a href="update_dayplan_process.jsp?id=<%=rs.getInt("plan_id")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-pencil"></span>
                              </button>
                          </td>
                      </tr>
                     
                     <%
                     x++;
                    }
                    con.close();
                }
                catch(Exception e)
                            {
                            System.out.println(e);
                            }
                    %>
        </table>
    </center>
</body>
</html>