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
    
    
    <%@ include file="brand_and_user_name.jsp"%>
   

   <button class="btn btn-primary">
   	   <a href="logout.jsp">Log Out</a>
   </button>

   <div class="container-fluid text-center">
   	     <h3>Admin Department</h3>

   	  <div class="row">
   	  	 <div class="col-sm-3">
   	  	 	<a href="create_user.html">
   	  	 	<div class="well">
   	  	 		Create New User
   	  	 	</div>
   	  	 	</a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_user.jsp">
   	  	 	<div class="well">
   	  	 			Display User
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_for_update.jsp">
   	  	 	<div class="well">
   	  	 		Update User
   	  	 	</div>
   	  	        </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="Display_for_remove.jsp">
   	  	 		<div class="well">
   	  	 			Remove User
   	  	 		</div>
   	  	 	</a>
   	  	 </div>

   	  </div> <!-- end of row-1 --> 

   	   <div class="row">
   	  	 <div class="col-sm-3">
   	  	 	<a href="petty_cash.html">
   	  	 	<div class="well">
   	  	 		Petty Cash Entry
   	  	 	</div>
   	  	 	</a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="display_petty_cash.jsp">
   	  	 	<div class="well">
   	  	 			Display Petty Cash
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="add_ticketing.html">
   	  	 	<div class="well">
   	  	 		Add Ticketing
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

   	  </div> <!-- end of row-2 --> 


       <div class="row">
   	  	 <div class="col-sm-3">
   	  	 	<a href="display_client_payment.jsp">
   	  	 	<div class="well">
   	  	 		Display Client Payment
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
   	  	 	<a href="display_emppayment_entry.jsp">
   	  	 	<div class="well">
   	  	 		Display Employee Payment
   	  	 	</div>
   	  	    </a>
   	  	 </div>

   	  	 <div class="col-sm-3">
   	  	 	<a href="ledgerbook.jsp">
   	  	 		<div class="well">
   	  	 			Display Ledger Book
   	  	 		</div>
   	  	 	</a>
   	  	 </div>

   	  </div> <!-- end of row-3 --> 



   </div><!-- end of container div -->

</body>
</html>