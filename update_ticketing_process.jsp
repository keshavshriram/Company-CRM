<%@page import="java.sql.*"%>

<%
    int id=Integer.parseInt(request.getParameter("id"));
    
    try{
        Class.forName("com.mysql.jdbc.Driver");           
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
        Statement st=con.createStatement();
        
        String sql="select * from add_ticketing where ticketing_id="+id;
        
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
                color: white;
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
		// validation for entry_date
		if(document.f1.entry_date.value=="")
		{
			alert("Please enter the Entry Date");
			document.f1.entry_date.focus();
			return false;
		}

      // validation for dname
		if(document.f1.dname.value=="")
		{
			alert("Please enter the Department Name");
			document.f1.dname.focus();
			return false;
		}

		var data=/^[A-Za-z]+$/;
		if(!document.f1.dname.value.match(data))
		{
			alert("Please enter the valid Department Name");
			document.f1.dname.focus();
			return false;
		}
		
      // validation for client name
		if(document.f1.client_name.value=="")
		{
			alert("Please enter Client Name");
			document.f1.client_name.focus();
			return false;
		}

      if(!document.f1.client_name.value.match(data))
      {
      	alert("Please enter valid Client Name");
      	document.f1.client_name.focus();
      	return false;
      }

		// validation for Project  

		if(document.f1.project.value=="")
		{
			alert("Please enter Project Name");
			document.f1.project.focus();
			return false;
		}

		 if(!document.f1.project.value.match(data))
      {
      	alert("Please enter valid Project Name");
      	document.f1.project.focus();
      	return false;
      }

		// validation for description of issue
		if(document.f1.issue.value=="")
		{
			alert("Please enter the Description of Issue");
			document.f1.issue.focus();
			return false;
		}

		 if(!document.f1.issue.value.match(data))
      {
      	alert("Please enter valid Issue");
      	document.f1.issue.focus();
      	return false;
      }
      

      // validation for handoverto
		if(document.f1.handoverto.value=="")
		{
			alert("Please enter the Name of hand over to");
			document.f1.handoverto.focus();
			return false;
		}

		 if(!document.f1.handoverto.value.match(data))
      {
      	alert("Please enter valid Name of hand over to");
      	document.f1.handoverto.focus();
      	return false;
      }

      // validation for remark
		if(document.f1.remark.value=="")
		{
			alert("Please select the Remark");
			document.f1.remark.focus();
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

		document.f1.entry_date.value=cdate;
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
           <form name="f1" action="update_ticketing.jsp" method="POST">
   	 	
   	 	<div class="form-group">
   	 	   
                    <input type="hidden" name="ticketing_id" class="form-control" value="<%=rs.getInt("TICKETING_ID")%>">
   	 	</div>

   	 	<div class="form-group">
                    Entry Date
                    <input type="text" name="entry_date" class="form-control" value="<%=rs.getString("ENTRY_DATE")%>">
   	 	</div>

   	 	<div class="form-group">
                   Enter Department Name
                    <input type="text" name="dname" class="form-control" value="<%=rs.getString("DNAME")%>">
   	 	</div>

   	 	<div class="form-group">
                    Enter Client Name
                    <input type="text" name="client_name" class="form-control" value="<%=rs.getString("CLIENT_NAME")%>">
   	 	</div>

   	 	<div class="form-group">
                    Project Name
                    <input type="text" name="project_name"  class="form-control" value="<%=rs.getString("PROJECT")%>">
   	 	</div>

   	 	<div class="form-group">
                    Description of Issue
                    <input type="text" name="issue"  class="form-control" value="<%=rs.getString("ISSUE")%>">
   	 	</div>
                <div class="form-group">
                    Mention Hand Over
                    <input type="text" name="handoverto"  class="form-control" value="<%=rs.getString("HANDOVERTO")%>">
   	 	</div>
                
               <div class="form-group">
   	 		<select name="remark" class="form-control" value="<%=rs.getString("REMARK")%>">
   	 			<option value="">--Select Remark--</option>
   	 			<option value="Issue Resolve">Issue Resolve</option>
   	 			<option value="Issue in Progress">Issue in Progress</option>
   	 			<option value="Issue on Hold">Issue on Hold</option>
   	 		</select> 
               </div>
                
   	 	<div class="form-group text-center">
   	 		<button class="btn btn-info">Go To dashboard</button>

                        <button class="btn btn-info" type="submit" value="Update Ticketing" onclick="return validation()">Update Ticketing</button>
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