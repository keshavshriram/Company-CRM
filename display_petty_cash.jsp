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
        <a href="petty_cash.html">
            <button class="btn btn-info">
                <span class="glyphicon glyphicon-plus"> Add New Entry</span>
            </button>
        </a>
            </div>       
            <div class="col-sm-8">
        <h3 class="text-center">Petty Cash Details</h3>
            </div>
        </div>
    <center>
        <table class="table table-bordered">
            <tr bgcolor="gold">
                <th>Purchase Id</th>
                <th>Purchase Date</th>
                <th>Department Name</th>
                <th>Product Name</th>
                <th>Product Rate</th>
                <th>Product Quantity</th>
                <th>Product Bill</th>
                <th>Purchase By</th>
                <th>Description of need</th>

                <th colspan="2" align="center">Action</th>
            </tr>
            
            <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");           
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
                 
                    Statement st=con.createStatement();
                    
                    String sql="select * from petty_cash order by pid desc";
                    ResultSet rs=st.executeQuery(sql);
                    
                    while(rs.next())
                    {
                       %>
                        <tr>
                          <td><%=rs.getInt("PID")%></td>
                          <td><%=rs.getString("PURCHASE_DATE")%></td>
                          <td><%=rs.getString("DNAME")%></td>
                          <td><%=rs.getString("PRODUCT_NAME")%></td>
                          <td><%=rs.getInt("RATE")%></td>
                          <td><%=rs.getInt("QUANTITY")%></td>
                          <td><%=rs.getInt("BILL")%></td>
                          <td><%=rs.getString("ENTER_BY")%></td>
                          <td><%=rs.getString("PURPOSE")%></td>

                          
                          <td align="center">
                              <a href="delete_petty_cash.jsp?id=<%=rs.getInt("pid")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-trash"></span>Delete
                              </button>
                              </a>
                          </td>
                          <td align="center">
                              <a href="update_pettyycash_process.jsp?id=<%=rs.getInt("pid")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-pencil"></span>Update
                              </button>
                          </td>
                      </tr>
                     
                     <%
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