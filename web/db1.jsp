<%-- 
    Document   : db1
    Created on : Oct 10, 2018, 3:53:19 PM
    Author     : RGUKT
--%>


<%@page import="javax.xml.registry.infomodel.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
<%
    String Username = request.getParameter("Username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from pro where User name='" + username + "' and password='" + password + "'");
    if (rs.next()) {
        if(rs.getString(3).equals(username)&&rs.getString(3).equals(password))
        session.setAttribute("userid", username);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("img.html");
        out.println("login sucessfull");
    } else {
        //out.println("Invalid password <a href='index.jsp'>try again</a>");
        out.println("invalid user");
    }
%>
    </body>
</html>