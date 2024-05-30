<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Client Lead</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
</script>

<style type="text/css">
	.jumbotron
	{
		padding: 10px;
		font-family: sans-serif;
		background-color: #ED3196;
	}
	p 
	{
		color: white;
		font-weight: bolder;
		margin-top: -15px;
		font-style: italic;
	}
	.well
	{
		font-size: 20px;
		background-color: gold;
	}
	.well:hover
	{
		background-color: #ED3196;
		color: white;
		cursor: pointer;
	}
	a 
	{
		text-decoration: none;
		color: white;
	}
	a:hover
	{
		text-decoration: none;
		color: white;
	}
	.formdiv
	{
		width: 40%;
		margin-left: 30%;
	}
	.btn
	{
		background: linear-gradient(to left,deeppink,purple);
		border: 2px solid white;
		color: white;
		border-radius: 20px;
		padding: 5px 20px;
	}
	.btn:hover
    {
    	background: linear-gradient(to left,purple,deeppink);
    	color: white;
    }
</style>
</head>
<body>
  
  <div class="jumbotron">
  	  <h2 style="color: gold;">PB Matics CRM</h2>
  	  <p>Digital Software Solution</p>
  </div>
  	
  <div class="container-fluid">
  	<button class="btn btn-primary">
  		<a href="logout.html">Log Out</a>
  	</button>
  
  	<button class="btn">
  		<a href="new_client_enquiry.html">
  			<span class="glyphicon glyphicon-plus"></span>
  			Add New Client Enquiry
  		</a>
  	</button>

  	<table class="table table-bordered">
  		<tr bgcolor="gold">
  			<th>Client Id</th>
  			<th>Enquiry Date</th>
  			<th>First Name</th>
  			<th>Last Name</th>
  			<th>Phone No</th>
  			<th>Email Id</th>
  			<th>Profession</th>
  			<th>Client Info</th>
  			<th>Suggest Info</th>          
  			<th>Client Status</th>          
  		</tr>
  	        <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");           
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
                 
                    Statement st=con.createStatement();
                    
                    String sql="select * from client_enquiry where select_status='Lead' order by client_id desc";
                    ResultSet rs=st.executeQuery(sql);
                    
                    while(rs.next())
                    {
                       %>
                        <tr>
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
  </div>

</body>
</html>