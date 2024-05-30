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
		// validation for plan_date
		if(document.f1.plan_date.value=="")
		{
			alert("Please enter the Plan Date");
			document.f1.plan_date.focus();
			return false;
		}

      // validation for plan day
		if(document.f1.plan_day.value=="")
		{
			alert("Please enter the Plan Day");
			document.f1.plan_day.focus();
			return false;
		}

		var data=/^[A-Za-z]+$/;
		
      // validation for plan time
		if(document.f1.plan_time.value=="")
		{
			alert("Please enter Plan time");
			document.f1.plan_time.focus();
			return false;
		}

     

		// validation for task details 

		if(document.f1.task_details.value=="")
		{
			alert("Please enter the task details");
			document.f1.task_details.focus();
			return false;
		}

                 
                // validation for status
		if(document.f1.status.value=="")
		{
			alert("Please select the status");
			document.f1.status.focus();
			return false;
		}


		// valiadtion for task
		if(document.f1.task.value=="")
		{
			alert("Please select the remark");
			document.f1.task.focus();
			return false;
		}
     
	}// end of validation

	
         function showDate()
	{
		var d=new Date();
		var dd=d.getDate();

		var month_list=["JAN","FEB","MAR","APR","MAY","JUNE","JULY","AUG","SEPT","OCT","NOV","DEC"];
                var day=["SUNDAY","MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY"];
		var mm=month_list[d.getMonth()];

		var yy=d.getFullYear();

		var cdate=dd+"/"+mm+"/"+yy;

		document.f1.plan_date.value=cdate;
                document.f1.plan_day.value=day[d.getMonth()];
                
                var h=d.getHours();
                var m=d.getMinutes();
                var ctime=h+":"+m;
                
                document.f1.plan_time.value=ctime;
	}
</script>

</head>
<body onload="showDate()">
                  <%@include file="header.html"%>

   <button class="btn btn-primary">
   	<a href="logout.html">Log Out</a>
   </button>
                  
                  
   <%
    int id=Integer.parseInt(request.getParameter("id"));
    
    try{
        Class.forName("com.mysql.jdbc.Driver");           
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
        Statement st=con.createStatement();
        
        String sql="select * from dayplan_entry where plan_id="+id;
        
        ResultSet rs=st.executeQuery(sql);
        
        
        while(rs.next())
        {
          %>
               
                  

                  <div class="form formdiv">
                      <h2 class="text-center" style="color:white;">Update User</h2>
           <form name="f1" action="update_dayplan.jsp" method="POST">
   	 	 <div class="form-group">
   	 		<input type="hidden" name="plan_id" class="form-control" value="<%=rs.getInt("PLAN_ID")%>">
   	 	</div>
               <div class="form-group">
   	 		Plan Date 
   	 		<input type="text" name="plan_date" class="form-control" value="<%=rs.getString("DATE")%>">
   	 	</div>

   	 	<div class="form-group">
                        Plan Day 
   	 		<input type="text" name="plan_day" class="form-control"value="<%=rs.getString("DAY")%>">
   	 	</div>

   	 	<div class="form-group">
                         Plan Time 
   	 		<input type="text" name="plan_time" class="form-control" value="<%=rs.getString("TIME")%>">
   	 	</div>

   	 	<div class="form-group">
                        Task Details
   	 		<input type="text" name="task_details" placeholder="Task Details" class="form-control" value="<%=rs.getString("DETAILS")%>">
   	 	</div>

   	 	<div class="form-group">
                    <label>Task Status</label>
   	 		<div class="radio-inline">
                            <%
                                String data=rs.getString("STATUS");
                                String rmdata=rs.getString("REMARK");

                            %>
                            <input type="radio" name="STATUS" value="Urgent and Important" <%=data.equals("Urgent and Important")?"checked":"unchecked"%>>Urgent and Important
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="STATUS" value="Not Urgent But Important" <%=data.equals("Not Urgent But Important")?"checked":"unchecked"%>>Not Urgent But Important
                        </div>
   	 	</div>
                
                <div class="form-group">
                    <label value="<%=rs.getString("REMARK")%>">Remark</label>
   	 		<div class="radio-inline">
                            <input type="radio" name="task" value="In Progress" <%=rmdata.equals("In Progress")?"checked":"unchecked"%>>In Progress
   	 		</div>
   	 		<div class="radio-inline">
                            <input type="radio" name="task" value="Task Completed" <%=rmdata.equals("Task Completed")?"checked":"unchecked"%>>Task Completed
   	 		</div>
   	 		<div class="radio-inline">
   	 			<input type="radio" name="task" value="On Hold" <%=rmdata.equals("On Hold")?"checked":"unchecked"%>>On Hold
   	 		</div>
   	 	</div>


   	 	<div class="form-group">
                      Plan By
   	 		<input type="text" name="plan_by" class="form-control" value="<%=rs.getString("PLAN_BY")%>">
   	 	</div>

   	 	
   	 	<div class="form-group text-center">
   	 		<button class="btn btn-info">Go To dashboard</button>

                        <button class="btn btn-info" type="submit" value="Update Client" onclick="return validation()">Update Client</button>
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
        out.print(e);
    }
    %>
    
</body>
</html>