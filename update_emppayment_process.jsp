<%@page import="java.sql.*"%>


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


		// validation for Payment Amount
		if(document.f1.pay_amt.value=="")
		{
			alert("Please enter the Payment Amount");
			document.f1.pay_amt.focus();
			return false;
		}
      
                    
                if(document.f1.job.value=="")
                {
                  alert("Please enter the Job");
                  document.f1.job.focus();
                  return false;
                }
                
                 if(document.f1.payment_mode.value=="")
                {
                  alert("Please select the Payment Mode");
                  document.f1.payment_mode.focus();
                  return false;
                }
                
                   if(document.f1.incentive_amt.value=="")
                {
                  alert("Please select the Incentive Amount");
                  document.f1.incentive_amt.focus();
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
                
                var h=d.getHours();
                var m=d.getMinutes();
                var ctime=h+":"+m;
                
                document.f1.pay_time.value=ctime;
	}
        function payment()
        {
            var pay_amt=document.f1.pay_amt.value;
            var incentive_amt=document.f1.incentive_amt.value;
            
            var final_pay=(pay_amt*incentive_amt)+parseInt(pay_amt);
            
            document.f1.final_pay_amt.value=final_pay;
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
    <%
    int id=Integer.parseInt(request.getParameter("id"));
    
    try{
        Class.forName("com.mysql.jdbc.Driver");           
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
        Statement st=con.createStatement();
        
        String sql="select * from employee_pay_entry where EMP_PAY_ID="+id;
        
        ResultSet rs=st.executeQuery(sql);
        
        
        while(rs.next())
        {
          %>

   <div class="form formdiv">
       <form name="f1" method="POST" action="update_employee_payment.jsp">
   	 	<h3 class="text-center">Update Employee Payment</h3>
                <div class="form-group">
   	 		
                    <input type="hidden" name="pay_id" readonly class="form-control" value="<%=rs.getInt("EMP_PAY_ID")%>">
   	 	</div>
   	 	<div class="form-group">
   	 		Payment Date
                        <input type="text" name="pay_date" readonly class="form-control" value="<%=rs.getString("PAY_DATE")%>">
   	 	</div>
                <div class="form-group">
   	 		Payment Time
                        <input type="text" name="pay_time" readonly class="form-control" value="<%=rs.getString("PAY_TIME")%>">
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
                    Payment Amount
                    <input type="number" name="pay_amt" class="form-control" value="<%=rs.getInt("PAY_AMT")%>">
   	 	</div>

   	 	<div class="form-group">
   	 		<select name="job" class="form-control" value="<%=rs.getString("JOB")%>">
   	 			<option value="">--Select Job--</option>
                                <option value="Manager" <%=(rs.getString("JOB")).equals("Manager")?"selected":""%>>Manager</option>
   	 			<option value="Developer" <%=(rs.getString("JOB")).equals("Developer")?"selected":""%>>Developer</option>
   	 			<option value="Tester" <%=(rs.getString("JOB")).equals("Tester")?"selected":""%>>Tester</option>
                                <option value="Analyst" <%=(rs.getString("JOB")).equals("Manager")?"selected":""%>>Analyst</option>
   	 		</select>
   	 	</div>

   	 	<div class="form-group">
   	 		<label value="<%=rs.getString("PAY_MODE")%>">Payment Mode</label>
   	 		<div class="radio-inline">
                            <%
                                String data=rs.getString("PAY_MODE");
                                String idata=rs.getString("INCENTIVE_AMT");
                            %>
   	 			<input type="radio" name="payment_mode" value="Netbanking" <%=data.equals("Netbanking")?"checked":"unchecked"%>>Netbanking
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="payment_mode" value="UPI" <%=data.equals("UPI")?"checked":"unchecked"%>>UPI
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="payment_mode" value="By Cheque" <%=data.equals("By Cheque")?"checked":"unchecked"%>>By Cheque
   	 		</div>
   	 	</div>
                
                <div class="form-group">
   	 		<label>Incentive Amount</label>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="incentive_amt" value="0.02" <%=idata.equals("0.02")?"checked":"unchecked"%> onclick="payment()">2%
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="incentive_amt" value="0.05" <%=idata.equals("0.05")?"checked":"unchecked"%> onclick="payment()">5%
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="incentive_amt" value="0.10" <%=idata.equals("0.10")?"checked":"unchecked"%> onclick="payment()">10%
   	 		</div>
                        <div class="radio-inline">
                            <input type="radio" name="incentive_amt" value="0" <%=idata.equals("0")?"checked":"unchecked"%> onclick="payment()">No Incentive
   	 		</div>
   	 	</div>
                <div class="form-group">
                    Final Payment Amount
                    <input type="number" name="final_pay_amt" class="form-control" value="<%=rs.getInt("FINAL_AMT")%>">
   	 	</div>

   	 	<div class="form-group text-center">
   	 		<button class="btn btn-info">Go To dashboard</button>

   	 		<button class="btn btn-info" type="submit" onclick="return validation()">Update Employee Payment</button>
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