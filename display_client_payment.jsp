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
        
       <div class="jumbotron">
  	  <h2 style="color: gold;">PB Matics CRM</h2>
  	  <p>Digital Software Solution</p>
       </div>
        
        <div class="row">
            <div class="col-sm-4">
        <a href="client_payment_entry.html">
            <button class="btn btn-info">
                <span class="glyphicon glyphicon-plus"> Add New Entry</span>
            </button>
        </a>
            </div>       
            <div class="col-sm-8">
        <h3 class="text-center">Client Payment Details</h3>
            </div>
        </div>
    <center>
        <table class="table table-bordered">
            <tr bgcolor="gold">
                        <th>Client Id</th>
  			<th>Payment Date</th>
  			<th>First Name</th>
  			<th>Last Name</th>
  			<th>Phone No</th>
  			<th>Email</th>
  			<th>Nature of Business</th>
  			<th>Amount Paid</th>
                        <th colspan="2" align="center">Action</th>       
            </tr>
            
            <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");           
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
                 
                    Statement st=con.createStatement();
                    
                    String sql="select * from client_pay_entry order by payment_id desc";
                    ResultSet rs=st.executeQuery(sql);
                    
                    while(rs.next())
                    {
                       %>
                        <tr>
                          <td><%=rs.getInt("PAYMENT_ID")%></td>
                          <td><%=rs.getString("PAY_DATE")%></td>
                          <td><%=rs.getString("FNAME")%></td>
                          <td><%=rs.getString("LNAME")%></td>
                          <td><%=rs.getString("PHONENO")%></td>
                          <td><%=rs.getString("BUSINESS_NATURE")%></td>
                          <td><%=rs.getInt("PAY_AMT")%></td>
                          <td><%=rs.getString("PAY_MODE")%></td>

                          
                          <td align="center">
                              <a href="delete_client_payment.jsp?id=<%=rs.getInt("payment_id")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-trash"></span>Delete
                              </button>
                              </a>
                          </td>
                          <td align="center">
                              <a href="update_clientpayment_process.jsp?id=<%=rs.getInt("payment_id")%>">
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