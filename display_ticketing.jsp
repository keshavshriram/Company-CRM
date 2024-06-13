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
        <a href="add_ticketing.html">
            <button class="btn btn-info">
                <span class="glyphicon glyphicon-plus"> Add New Ticketing </span>
            </button>
        </a>
            </div>       
            <div class="col-sm-8">
        <h3 class="text-center">Ticketing entry Details</h3>
            </div>
        </div>
    <center>
        <table class="table table-bordered">
            <tr bgcolor="gold">
                <th>SR.NO</th>
                <th>Ticketing Id</th>
                <th>User Id</th>
                <th>Entry Date</th>
                <th>Department Name</th>
                <th>Client Name</th>
                <th>Project Name</th>
                <th>Discription of Issue</th>
                <th>Hand Over To</th>
                <th>Remark</th>
                <th colspan="2" align="center">Action</th>
            </tr>
            
            <%
                int uid =(Integer)session.getAttribute("session_uid");
                try{
                    Class.forName("com.mysql.jdbc.Driver");           
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
                    Statement st=con.createStatement();
                    String sql="select * from add_ticketing where uid="+uid;
                    ResultSet rs=st.executeQuery(sql);
                    int x=101;
                    while(rs.next())
                    {
                      %>
                      
                      <tr>
                          <td><%=x%></td>
                          <td><%=rs.getInt("TICKETING_ID")%></td>
                          <td><%=rs.getString("uid")%></td>
                          <td><%=rs.getString("ENTRY_DATE")%></td>
                          <td><%=rs.getString("DNAME")%></td>
                          <td><%=rs.getString("CLIENT_NAME")%></td>
                          <td><%=rs.getString("PROJECT")%></td>
                          <td><%=rs.getString("ISSUE")%></td>
                          <td><%=rs.getString("HANDOVERTO")%></td>
                          <td>
                      <marquee scrolldelay="150"> <font color="limegreen"> <%=rs.getString("REMARK")%></font></marquee>
                          </td>

                          
                          <td align="center">
                              <a href="delete_ticketing.jsp?id=<%=rs.getInt("TICKETING_ID")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-trash"></span>
                              </button>
                              </a>
                          </td>
                          <td align="center">
                              <a href="update_ticketing_process.jsp?id=<%=rs.getInt("TICKETING_ID")%>">
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