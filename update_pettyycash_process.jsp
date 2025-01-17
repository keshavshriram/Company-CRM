<%@page import="java.sql.*"%>

<%
    int id=Integer.parseInt(request.getParameter("id"));
    
    try{
        Class.forName("com.mysql.jdbc.Driver");           
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
        Statement st=con.createStatement();
        
        String sql="select * from petty_cash where pid="+id;
        
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
		// validation for purchase_date
		if(document.f1.purchase_date.value=="")
		{
			alert("Please enter the Purchase Date");
			document.f1.purchase_date.focus();
			return false;
		}

      // validation for dname
		if(document.f1.dname.value=="")
		{
			alert("Please enter the Department Name");
			document.f1.dname.focus();
			return false;
		}

		var data=/^[A-Za-z ]+$/;
		if(!document.f1.dname.value.match(data))
		{
			alert("Please enter the valid Department Name");
			document.f1.dname.focus();
			return false;
		}
		
      // validation for product name
		if(document.f1.product_name.value=="")
		{
			alert("Please enter Product Name");
			document.f1.product_name.focus();
			return false;
		}

      if(!document.f1.product_name.value.match(data))
      {
      	alert("Please enter valid Product Name");
      	document.f1.product_name.focus();
      	return false;
      }

		// validation for rate 

		if(document.f1.rate.value=="")
		{
			alert("Please enter Product rate");
			document.f1.rate.focus();
			return false;
		}

		if(document.f1.rate.value<0)
		{
			alert("Please enter valid Product rate");
			document.f1.rate.focus();
			return false;
		}

		// validation for qty
		if(document.f1.qty.value=="")
		{
			alert("Please enter the Product Quantity");
			document.f1.qty.focus();
			return false;
		}

		if(document.f1.qty.value<0)
		{
			alert("Please enter the valid Product Quantity");
			document.f1.qty.focus();
			return false;
		}

		if(document.f1.entry_by.value=="")
		{
			alert("Please enter the Employee Name");
			document.f1.entry_by.focus();
			return false;
		}
      
      if(!document.f1.entry_by.value.match(data))
		{
			alert("Please enter the valid Employee Name");
			document.f1.entry_by.focus();
			return false;
		}
		// validation for purpose
		if(document.f1.purpose.value=="")
		{
			alert("Please enter the purpose of Purchase");
			document.f1.purpose.focus();
			return false;
		}
		if(!document.f1.purpose.value.match(data))
		{
			alert("Please enter the valid Purpose of Purchase");
			document.f1.purpose.focus();
			return false;
		}
	}// end of validation

	function billing()
	{
		var rate=document.f1.rate.value;
		var qty=document.f1.qty.value;

		var finalbill=rate*qty;

		document.f1.bill.value=finalbill;
	}
        function showDate()
	{
		var d=new Date();
		var dd=d.getDate();

		var month_list=["JAN","FEB","MAR","APR","MAY","JUNE","JULY","AUG","SEPT","OCT","NOV","DEC"];

		var mm=month_list[d.getMonth()];

		var yy=d.getFullYear();

		var cdate=dd+"/"+mm+"/"+yy;

		document.f1.purchase_date.value=cdate;
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
                      <h2 class="text-center" style="color:white;">Update User</h2>
           <form name="f1" action="update_pettycash.jsp" method="POST">
   	 	
   	 	<div class="form-group">
   	 	   
                    <input type="hidden" name="pid" class="form-control" value="<%=rs.getInt("PID")%>">
   	 	</div>

   	 	<div class="form-group">
                    Purchase Date
                    <input type="text" name="purchase_date" class="form-control" value="<%=rs.getString("PURCHASE_DATE")%>">
   	 	</div>

   	 	<div class="form-group">
                    Department Name
                    <input type="text" name="dname" class="form-control" value="<%=rs.getString("DNAME")%>">
   	 	</div>

   	 	<div class="form-group">
                    Product Name
                    <input type="text" name="product_name" class="form-control" value="<%=rs.getString("PRODUCT_NAME")%>">
   	 	</div>

   	 	<div class="form-group">
                    Product Rate
                    <input type="number" name="rate"  class="form-control" value="<%=rs.getInt("RATE")%>">
   	 	</div>

   	 	<div class="form-group">
                    Product Quantity
                    <input type="number" name="qty"  class="form-control" value="<%=rs.getInt("QUANTITY")%>" onkeyup="billing()">
   	 	</div>
                <div class="form-group">
                    Product Bill
                    <input type="number" name="bill"  class="form-control" value="<%=rs.getInt("BILL")%>">
   	 	</div>
                
                <div class="form-group">
                    Purchase By
                    <input type="text" name="enter_by"  class="form-control" value="<%=rs.getString("ENTER_BY")%>">
   	 	</div>
                
                 <div class="form-group">
                    Description of need
                    <input type="text" name="purpose"  class="form-control" value="<%=rs.getString("PURPOSE")%>">
   	 	</div>
   	 	<div class="form-group text-center">
   	 		<button class="btn btn-info">Go To dashboard</button>

                        <button class="btn btn-info" type="submit" value="Update Petty Cash" onclick="return validation()">Update Petty Cash</button>
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