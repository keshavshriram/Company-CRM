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
        
       <%@include file="brand_and_user_name.jsp"%>
        
        <div class="row">
            <div class="col-sm-4">
        <a href="vendor_payment_entry.html">
            <button class="btn btn-info">
                <span class="glyphicon glyphicon-plus">New Entry</span>
            </button>
        </a>
            </div>       
            <div class="col-sm-8">
        <h3 class="text-center">Vendor Payment Details</h3>
            </div>
        </div>
    <center>
        <table class="table table-bordered">
            <tr bgcolor="gold">
                        <th>SR.NO</th>
                        <th>Vendor Id</th>
                  	<th>Payment Date</th>
                        <th>Vendor Name</th>
  			<th>Amount Paid</th>
                        <th>Payment Mode</th>
                       <th>Payment By</th>
                        <th colspan="2" align="center">Action</th>   
            </tr>
            
            <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");           
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
                 
                    Statement st=con.createStatement();
                    
                    String sql="select * from vendor_pay_entry order by vendor_id desc";
                    ResultSet rs=st.executeQuery(sql);
                    int x=101;
                    while(rs.next())
                    {
                       %>
                        <tr>
                          <td><%=x%></td>
                          <td><%=rs.getInt("VENDOR_ID")%></td>
                          <td><%=rs.getString("VNAME")%></td>
                          <td><%=rs.getString("PAY_DATE")%></td>
                          <td><%=rs.getInt("PAY_AMT")%></td>
                          <td><%=rs.getString("PAY_MODE")%></td>
                          <td><%=rs.getString("PAY_BY")%></td>

                          
                          <td align="center">
                              <a href="delete_vendor_payment.jsp?id=<%=rs.getInt("VENDOR_ID")%>">
                              <button class="btn btn-info">
                                  <span class="glyphicon glyphicon-trash"></span>Delete
                              </button>
                              </a>
                          </td>
                          <td align="center">
                              <a href="update_vendorpayment_process.jsp?id=<%=rs.getInt("VENDOR_ID")%>">
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
                            System.out.println(e);
                            }
                    %>
        </table>
    </center>
</body>
</html>