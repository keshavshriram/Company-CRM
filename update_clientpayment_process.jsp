<%@page import="java.sql.*"%>

<%
    int id=Integer.parseInt(request.getParameter("id"));
    
    try{
        Class.forName("com.mysql.jdbc.Driver");           
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
        Statement st=con.createStatement();
        
        String sql="select * from client_pay_entry where payment_id="+id;
        
        ResultSet rs=st.executeQuery(sql);
        
        
        while(rs.next())
        {
          %>
         <html>
          <head>
	<title></title>
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
		color: #000123;
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
		background: linear-gradient(to right bottom,deeppink,purple);
		padding: 10px;
                color:white;
	}
	.btn
	{
		background-color: gold;
		border: none;
	}
       
        
</style>
<script type="text/javascript">
	function validation()
	{
		// validation first name
		if(document.f1.fname.value=="")
		{
			alert("Please enter the First Name ");
			document.f1.fname.focus();
			return false;
		}

		var data=/^[A-Za-z]+$/;
		if(!document.f1.fname.value.match(data))
		{
			alert("Please enter the valid First Name");
			document.f1.fname.focus();
			return false;
		}


		// validation last name
		if(document.f1.lname.value=="")
		{
			alert("Please enter the Last Name");
			document.f1.lname.focus();
			return false;
		}
		if(!document.f1.lname.value.match(data))
		{
			alert("Please enter valid Last Name");
			document.f1.lname.focus();
			return false;
		}

		// validation for Phone No

		if(document.f1.phoneno.value.length!=10)
		{
			alert("Please enter the valid Phone No");
			document.f1.phoneno.focus();
			return false;
		}

		// validation for email
		if(document.f1.email.value=="")
		{
			alert("Please enter the Email");
			document.f1.email.focus();
			return false;
		}
      
      if(document.f1.busi_nature.value=="")
      {
      	alert("Please enter the Business Nature");
      	document.f1.busi_nature.focus();
      	return false;
      }
      if(document.f1.pay_amt.value=="")
      {
      	alert("Please enter the Payment Amount");
      	document.f1.pay_amt.focus();
      	return false;
      }
		
	}// end of validation

	function showDate()
	{
		var d=new Date();
		var dd=d.getDate();

		var month_list=["JAN","FEB","MAR","APR","MAY","JUNE","JULY","AUG","SEPT","OCT","NOV","DEC"];

		var mm=month_list[d.getMonth()];

		var yy=d.getFullYear();

		var cdate=dd+"/"+mm+"/"+yy;

		document.f1.enq_date.value=cdate;
	}
</script>
</head>
<body onload="showDate()">

   <div class="jumbotron">
   	  <h2 style="color: gold;">PB Matics CRM</h2>
   	  <p>Digital Software Solution</p>
   </div>

   <button class="btn btn-primary">
   	<a href="logout.html">Log Out</a>
   </button>

   <div class="form formdiv">
       <form name="f1" method="POST" action="update_clientpayment.jsp">
   	 	<h3 class="text-center">Update Client Payment</h3>
                <div class="form-group">
   	 		
                    <input type="hidden" name="payment_id" class="form-control" value="<%=rs.getInt("PAYMENT_ID")%>">
   	 	</div>
   	 	<div class="form-group">
   	 		Payment Date
                        <input type="text" name="enq_date" readonly class="form-control" value="<%=rs.getString("PAY_DATE")%>">
   	 	</div>

   	 	<div class="form-group">
                    First Name
                    <input type="text" name="fname" class="form-control" value="<%=rs.getString("FNAME")%>">
   	 	</div>

   	 	<div class="form-group">
                    Last Name
                    <input type="text" name="lname" class="form-control" value="<%=rs.getString("LNAME")%>">
   	 	</div>

   	 	<div class="form-group">
                    Phone No
                    <input type="text" name="phoneno" class="form-control" value="<%=rs.getString("PHONENO")%>">
   	 	</div>

   	 	<div class="form-group">
                    Business Nature
                    <input type="text" name="busi_nature" class="form-control" value="<%=rs.getString("BUSINESS_NATURE")%>">
   	 	</div>

   	 	<div class="form-group">
                    Payment Amount
                    <input type="number" name="pay_amt" class="form-control" value="<%=rs.getInt("PAY_AMT")%>">
   	 	</div>

   	 	<div class="form-group">
   	 		<label value="<%=rs.getString("PAY_MODE")%>">Payment Mode</label>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="payment_mode" value="Netbanking">Netbanking
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="payment_mode" value="UPI">UPI
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="payment_mode" value="By Cheque">By Cheque
   	 		</div>
   	 	</div>

   	 	<div class="form-group text-center">
   	 		<button class="btn btn-info">Go To dashboard</button>

   	 		<button class="btn btn-info" type="submit" onclick="return validation()">Submit Client Payment</button>
   	 		<button class="btn btn-info">Reset</button>
   	 	</div>
   	 </form>
   </div>
                <%
        }// end of while loop
         
        con.close();
        
    }// end of try
    catch(Exception e)
    {
        System.out.print(e);
    }
    %>
    
</body>
</html>