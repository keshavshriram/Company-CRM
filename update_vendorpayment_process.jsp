<%@page import="java.sql.*"%>

<%
    int id=Integer.parseInt(request.getParameter("id"));
    
    try{
        Class.forName("com.mysql.jdbc.Driver");           
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
        Statement st=con.createStatement();
        
        String sql="select * from vendor_pay_entry where VENDOR_ID="+id;
        
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

		// validation for Business Nature
		if(document.f1.nature_business.value=="")
		{
			alert("Please enter the Nature of Business");
			document.f1.nature_business.focus();
			return false;
		}

		
		// validation for Amount Paid
		if(document.f1.amt_paid.value=="")
		{
			alert("Please enter the Amount Paid");
			document.f1.amt_paid.focus();
			return false;
		}
		
		if(document.f1.pay_by.value=="")
		{
			alert("Please enter the Payment By");
			document.f1.pay_by.focus();
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

		document.f1.pay_date.value=cdate;
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
       <form name="f1" method="POST" action="update_vendorpayment_entry.jsp">
   	 	<h3 class="text-center">Update Vendor Payment</h3>
                <div class="form-group">
   	 		
                    <input type="hidden" name="vendor_id" readonly class="form-control" value="<%=rs.getInt("VENDOR_ID")%>">
   	 	</div>
                
                <div class="form-group">
   	 		
                    <input type="text" name="pay_date" readonly class="form-control" value="<%=rs.getString("PAY_DATE")%>">
   	 	</div>
                
                <div class="form-group">
                    <input type="text" name="vname" placeholder="Vendor Name" class="form-control" value="<%=rs.getString("VNAME")%>">
   	 	</div>
                

   	 	<div class="form-group">
                    <input type="text" name="amt_paid" placeholder="Payment Amount" class="form-control" value="<%=rs.getInt("PAY_AMT")%>">
   	 	</div>
                
                <div class="form-group">
   	 		<label>Payment Mode</label>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="payment_mode" value="UPI">UPI
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="payment_mode" value="Cash">Cash
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="payment_mode" value="Cheque">Cheque
   	 		</div>
                        <div class="radio-inline">
   	 			<input type="radio" name="payment_mode" value="Netbanking">Netbanking
   	 		</div>
   	 	</div>
   	 	<div class="form-group">
                    <input type="text" name="pay_by" placeholder="Payment By" class="form-control" value="<%=rs.getString("PAY_AMT")%>">
   	 	</div>

   	 	<div class="form-group text-center">
   	 		<button class="btn btn-info">Go To dashboard</button>

   	 		<button class="btn btn-info" type="submit" onclick="return validation()">Submit</button>
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