<%@page import="java.sql.*"%>

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
        <a href="create_user.html">
            <button class="btn btn-info">
                <span class="glyphicon glyphicon-plus"> Add New User</span>
            </button>
        </a>
            </div>       
            <div class="col-sm-8">
        <h3 class="text-center">CRM User Details</h3>
            </div>
        </div>
    <center>
        <table class="table table-bordered">
            <tr bgcolor="gold">
                <th>SR.No</th>
                <th>User Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone No</th>
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
                <th colspan="2" align="center">Action</th>
            </tr>
            
            <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");           
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
                    Statement st=con.createStatement();
                    String sql="select * from users order by userid desc";
                    ResultSet rs=st.executeQuery(sql);
                    int x=101;
                    while(rs.next())
                    {
                      %>
                      
                      <tr>
                          <td><%=x%></td>
                          <td><%=rs.getInt("USERID")%></td>
                          <td><%=rs.getString("FNAME")%></td>
                          <td><%=rs.getString("LNAME")%></td>
                          <td><%=rs.getString("PHONENO")%></td>
                          <td><%=rs.getString("EMAIL")%></td>
                          <td><%=rs.getString("UNAME")%></td>
                          <td><%=rs.getString("PASS")%></td>
                          
                          <td align="center">
                              <a href="deleteuser.jsp?id=<%=rs.getInt("userid")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-trash"></span>Delete
                              </button>
                              </a>
                          </td>
                          <td align="center">
                              <a href="update_user_process.jsp?id=<%=rs.getInt("userid")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-pencil"></span>Update
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
                                    out.println(e);
                            }
                    %>
                
     
        </table>
    </center>            
    
    </body>
</html>