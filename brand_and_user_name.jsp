
<body>
    <div class="jumbotron">
        <h2 style="color: gold;">PB Matics CRM</h2>
        <p>Digital Software Solution</p>
        
        <p>
                <%

                    String sname =(String)session.getAttribute("session_username");
                    out.println("Welcome " + sname);
                %>
            </p>
    </div>
</body>

