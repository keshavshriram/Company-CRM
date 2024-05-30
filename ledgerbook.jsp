<!DOCTYPE html>     
<html>
    <head>
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
                font-weight: bolder;
                margin-top: -15px;
                font-style: italic;
                color: white;
            }
            .well
            {
                font-size: 20px;
                background-color: gold;
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
            .cardcontainer
            {
                box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);
                transition: 0.3s;
            }
            .cardcontainer:hover
            {
                box-shadow: 0px 10px 20px 0px rgba(0, 0, 0, 0.5);
            }
            .add_data
            {
                background-color: deeppink;
                color: white;
                width: 100%;
                padding: 10px;
                padding-bottom: 20px;
            }
            .showamt
            {
                color: gold;
                font-size: 20px;
            }
        </style>
    </head>
    <body>

        <%@page import="java.sql.*" %>
        
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db", "root", "");

                Statement st_c = con.createStatement();
                Statement st_e = con.createStatement();
                Statement st_v = con.createStatement();
                String sql_client = "select sum(pay_amt) `tot_cpay` from client_pay_entry";
                String sql_employee = "select sum(pay_amt) `tot_epay` from employee_pay_entry";
                String sql_vendor = "select sum(pay_amt) `tot_vpay` from vendor_pay_entry";

                ResultSet rs_client = st_c.executeQuery(sql_client);
                ResultSet rs_employee = st_e.executeQuery(sql_employee);
                ResultSet rs_vendor = st_v.executeQuery(sql_vendor);

        %>
        
        <%!
            int cpay,epay=0,vpay=0,final_payment;
            
        %>

        <div class="jumbotron">
            <h2 style="color: gold;">PB Matics CRM</h2>
            <p>Digital Software Solution</p>
        </div>

        <div class="container-fluid text-center">
            <h3>Ledger Book Profit & Loss</h3>

            <div class="row">
                <div class="col-sm-3">
                    <div class="cardcontainer">
                        <img src="Book/client.jpg" style="width: 100%;">
                        <div class="add_data">
                            <h3>Client Payment</h3>
                            <br>
                            <p class="showamt">&#8377 <%while (rs_client.next()) {%>
                                <%= cpay=rs_client.getInt("tot_cpay")%>
                                <%}%>

                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="cardcontainer">
                        <img src="Book/emp_pay.jpg" style="width: 100%;">
                        <div class="add_data">
                            <h3>Employee Payment</h3>
                            <br>
                            <p class="showamt">&#8377 <%while (rs_employee.next()) {%>
                                <%= epay=rs_employee.getInt("tot_epay")%>
                                <%}%>/-</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="cardcontainer">
                        <img src="Book/vendor.png" style="width: 100%;">
                        <div class="add_data">
                            <h3>Vendor Payment</h3>
                            <br>
                            <p class="showamt">&#8377 <%while (rs_vendor.next()) {%>
                                <%= vpay=rs_vendor.getInt("tot_vpay")%>
                                <%}%>/-</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="cardcontainer">
                        <img src="Book/profit.jpg" style="width: 100%;">
                        <div class="add_data">
                            <h3>Final Payment</h3>
                            <br>
                            <p class="showamt">&#8377 <%= final_payment=cpay-(epay+vpay)%>/-</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        %>



    </body>
</html>