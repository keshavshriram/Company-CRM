<%@page import="java.sql.*"%>

<%
    String username = request.getParameter("uname");
    String password = request.getParameter("pass");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pbmatics_db", "root", "");

//        Statement st = con.createStatement();

        PreparedStatement ps = con.prepareStatement("select * from users where uname='" + username + "' and pass='" + password + "'");
        ResultSet rs = ps.executeQuery();
        String name = "";
        String uname="";
        String passx = "";
        int uid=0;
        while (rs.next()) {
            name = rs.getString("fname");
            uname = rs.getString("uname");
            passx = rs.getString("pass");
            uid=rs.getInt("userid");
        }
        if (uname.equals(username) && passx.equals(password)) {
            response.sendRedirect("employee_dashboard.jsp");
        } else if (username.equals("admin") && password.equals("admin123")) {
            response.sendRedirect("dashboard_admin.jsp");
            name="admin";
        } else {
            out.println("<h1><font color='red'><center>Login Failed</center></font></h1>");
        }
        session.setAttribute("session_username", name);
        session.setAttribute("session_uid", uid);

    } catch (Exception e) {
        out.print(e);
    }
%>