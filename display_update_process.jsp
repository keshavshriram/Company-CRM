<%@page import="java.sql.*"%>

<%
    int id=Integer.parseInt(request.getParameter("id"));
    
    try{
        Class.forName("com.mysql.jdbc.Driver");           
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db","root","");
      
        Statement st=con.createStatement();
        
        String sql="select * from users where userid="+id;
        
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

		// validation for Username
		if(document.f1.uname.value=="")
		{
			alert("Please enter the Username");
			document.f1.uname.focus();
			return false;
		}

		var uname_len=document.f1.uname.value.length;
		if(uname_len<5 || uname_len>10)
		{
			alert("Username length must in range 5 to 10");
			document.f1.uname.focus();
			return false;
		}

		// validation for password
		if(document.f1.pass.value=="")
		{
			alert("Please enter the Password");
			document.f1.pass.focus();
			return false;
		}
		var pass_len=document.f1.pass.value.length;
		if(pass_len<5 || pass_len>10)
		{
			alert("Password length must in range 5 to 10");
			document.f1.pass.focus();
			return false;
		}
	}// end of validation
</script>

</head>
              <body>
                  <div class="jumbotron">
   	  <h2 style="color: gold;">PB Matics CRM</h2>
   	  <p>Digital Software Solution</p>
   </div>

   <button class="btn btn-primary">
   	<a href="logout.html">Log Out</a>
   </button>

                  <div class="form formdiv">
                      <h2 class="text-center" style="color:white;">Update User</h2>
           <form name="f1" action="display_updateuser.jsp" method="POST">
   	 	
   	 	<div class="form-group">
   	 	   
                    <input type="hidden" name="userid" class="form-control" value="<%=rs.getInt("USERID")%>">
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
                    Email Id
                    <input type="email" name="email"  class="form-control" value="<%=rs.getString("EMAIL")%>">
   	 	</div>

   	 	<div class="form-group">
                    Username
                    <input type="text" name="uname"  class="form-control" value="<%=rs.getString("UNAME")%>">
   	 	</div>
                <div class="form-group">
                    Password
                    <input type="text" name="pass"  class="form-control" value="<%=rs.getString("PASS")%>">
   	 	</div>

   	 	<div class="form-group text-center">
   	 		<button class="btn btn-info">Go To dashboard</button>

                        <button class="btn btn-info" type="submit" value="Update User" onclick="return validation()">Update User</button>
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