<%@page import="java.sql.*"%>

<%
    int id=Integer.parseInt(request.getParameter("id"));
    
    try{
        Class.forName("com.mysql.jdbc.Driver");           
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
        Statement st=con.createStatement();
        
        String sql="select * from client_enquiry where client_id="+id;
        
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

		// validation for Proffession
		if(document.f1.profession.value=="")
		{
			alert("Please select Proffession");
			document.f1.profession.focus();
			return false;
		}

		
		// validation for client information
		if(document.f1.client_suggested_info.value=="")
		{
			alert("Please enter the Client Suggested Information");
			document.f1.client_suggested_info.focus();
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
       <form name="f1" method="POST" action="update_client_enquiry.jsp">
   	 	<h3 class="text-center">Update User</h3>
                <div class="form-group">
   	 		
                    <input type="hidden" name="client_id" class="form-control" value="<%=rs.getInt("CLIENT_ID")%>">
   	 	</div>
   	 	<div class="form-group">
   	 		Enquiry Date
                        <input type="text" name="enq_date" readonly class="form-control" value="<%=rs.getString("CLIENT_ENTRY_DATE")%>">
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
                    Email
                    <input type="email" name="email" class="form-control" value="<%=rs.getString("EMAIL")%>">
   	 	</div>

   	 	<div class="form-group">
   	 		<label value="<%=rs.getString("PROFESSION")%>">Profession</label>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="profession" value="JOB">JOB
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="profession" value="BUSINESS">BUSINESS
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="profession" value="SELF EMPLOYEE">SELF EMPLOYEE
   	 		</div>
   	 	</div>

   	 	<div class="form-group">
                    Client Information
                    <input type="text" name="client_info" class="form-control" value="<%=rs.getString("CLIENT_INFO")%>">
   	 	</div>
   	 	<div class="form-group">
                    Client Suggested Information
                    <input type="text" name="client_suggested_info" class="form-control" value="<%=rs.getString("CLIENT_SUGG_PROF")%>">
   	 	</div>

   	 	<div class="form-group">
   	 		<label value="<%=rs.getString("SELECT_STATUS")%>">Select Status</label>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="status" value="FollowUP">Follow Up
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="status" value="Lead">Lead
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="status" value="Not Intrested">Not Intrested
   	 		</div>
   	 	</div>

   	 	<div class="form-group text-center">
   	 		<button class="btn btn-info">Go To dashboard</button>

   	 		<button class="btn btn-info" type="submit" onclick="return validation()">Update User</button>
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