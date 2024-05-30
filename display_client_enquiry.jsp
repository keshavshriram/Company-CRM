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
        <a href="new_client_entry.html">
            <button class="btn btn-info">
                <span class="glyphicon glyphicon-plus"> Add New Entry</span>
            </button>
        </a>
            </div>       
            <div class="col-sm-8">
        <h3 class="text-center">All Client Details</h3>
            </div>
        </div>
    <center>
        <table class="table table-bordered">
            <tr bgcolor="gold">
                        <th>SR.NO</th>
                        <th>Id</th>
  			<th>Date</th>
  			<th>First Name</th>
  			<th>Last Name</th>
  			<th>Phone No</th>
  			<th>Email</th>
  			<th>Profession</th>
  			<th>Client Info</th>
                       	<th>Client Sugg Info</th>
                        <th>Status</th>
  			<th colspan="2">Action</th> 
            </tr>
            
            <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");           
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
                 
                    Statement st=con.createStatement();
                    
                    String sql="select * from client_enquiry order by client_id desc";
                    ResultSet rs=st.executeQuery(sql);
                 
                    int x=101;
                    while(rs.next())
                    {
                       %>
                        <tr>
                          <td><%=x%></td>  
                          <td><%=rs.getInt("CLIENT_ID")%></td>
                          <td><%=rs.getString("CLIENT_ENTRY_DATE")%></td>
                          <td><%=rs.getString("FNAME")%></td>
                          <td><%=rs.getString("LNAME")%></td>
                          <td><%=rs.getString("PHONENO")%></td>
                          <td><%=rs.getString("EMAIL")%></td>
                          <td><%=rs.getString("PROFESSION")%></td>
                          <td><%=rs.getString("CLIENT_INFO")%></td>
                          <td><%=rs.getString("CLIENT_SUGG_PROF")%></td>
                          <td><%=rs.getString("SELECT_STATUS")%></td>
                          
                          
                          <td align="center">
                              <a href="delete_client_entry.jsp?id=<%=rs.getInt("client_id")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-trash"></span>
                              </button>
                              </a>
                          </td>
                          <td align="center">
                              <a href="update_cliententry_process.jsp?id=<%=rs.getInt("client_id")%>">
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