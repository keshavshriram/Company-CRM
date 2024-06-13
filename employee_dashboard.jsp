<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
</script>
	<title></title>

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
		.btn
		{
			background-color: gold;
		}
	</style>
</head>
<body>
 
    <%@include file="brand_and_user_name.jsp"%>

   <button class="btn btn-primary">
   	   <a href="logout.jsp">Log Out</a>
   </button>

   <div class="container-fluid text-center">
   	     <h3>Employee Dashboard</h3>

   	  <div class="row">
   	  	 <div class="col-sm-3">
   	  	 	<a href="new_client_enquiry.html">
   	  	 	<div class="well">
   	  	 		New Client Enquiry
   	  	 	</div>
   	  	 	</a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_client_enquiry.jsp">
   	  	 	<div class="well">
   	  	 			Display All Client Enquiry
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="client_followup.jsp">
   	  	 	<div class="well">
   	  	 		Display Client Follow Up
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="clientlead.jsp">
   	  	 		<div class="well">
   	  	 			Display Client Lead
   	  	 		</div>
   	  	 	</a>
   	  	 </div>

   	  </div> <!-- end of row-1 --> 

   	   <div class="row">
   	  	 <div class="col-sm-3">
   	  	 	<a href="client_registration.html">
   	  	 	<div class="well">
   	  	 		Client Registration Entry
   	  	 	</div>
   	  	 	</a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_registered_client.jsp">
   	  	 	<div class="well">
   	  	 			Registered Client
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="client_payment_entry.html">
   	  	 	<div class="well">
   	  	 		Client Payment Entry
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_client_payment.jsp">
   	  	 		<div class="well">
   	  	 			Display Client Payment
   	  	 		</div>
   	  	 	</a>
   	  	 </div>

   	  </div> <!-- end of row-2 --> 

          <!-- 3rd row -->
           <div class="row">
   	  	 <div class="col-sm-3">
   	  	 	<a href="vendor_payment_entry.html">
   	  	 	<div class="well">
   	  	 		Vendor Payment Entry
   	  	 	</div>
   	  	 	</a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_vendor_payment.jsp">
   	  	 	<div class="well">
   	                         Display Vendor Payment
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="employee_payment_entry.html">
   	  	 	<div class="well">
   	  	 		Employee Payment Entry
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_emppayment_entry.jsp">
   	  	 		<div class="well">
   	  	 			Display Employee Payment
   	  	 		</div>
   	  	 	</a>
   	  	 </div>

   	  </div> <!-- end of row-4 --> 

             <div class="row">
   	  	 <div class="col-sm-3">
   	  	 	<a href="day_plan_entry.html">
   	  	 	<div class="well">
   	  	 		Day Plan Entry
   	  	 	</div>
   	  	 	</a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_plan_entry.jsp">
   	  	 	<div class="well">
   	  	 	         Display Day Plan
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="add_ticketing.html">
   	  	 	<div class="well">
   	  	 		Ticketing Entry
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_ticketing.jsp">
   	  	 		<div class="well">
   	  	 			Display Ticketing
   	  	 		</div>
   	  	 	</a>
   	  	 </div>

   	  </div> <!-- end of row-4 --> 

   </div><!-- end of container div -->

</body>
</html>