<%-- 
    Document   : db
    Created on : Oct 10, 2018, 3:44:06 PM
    Author     : RGUKT
--%>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
            response.setContentType("text/html");
            String Firstname=request.getParameter("fn");
            String lastname=request.getParameter("ln");
            String username=request.getParameter("un");
            String password=request.getParameter("pwd");
            String mobileno=request.getParameter("mn");
            String email=request.getParameter("eid");
            String dob=request.getParameter("dt");
            String location=request.getParameter("ads");
              Connection con=null;
            Class.forName("com.mysql.jdbc.Driver");
            String conURL="jdbc:mysql://localhost:3306/railway";
            String dbUser="root";
            String dbPWD="";
            String ConURL = null;
            con=DriverManager.getConnection(conURL,dbUser,dbPWD);
            
            PreparedStatement ps=con.prepareStatement("insert into rail values(?,?,?,?,?,?,?,?)");
            ps.setString(1,Firstname);
            ps.setString(2,lastname);
            ps.setString(3,username);
            ps.setString(4,password);
            ps.setString(5,mobileno);
            ps.setString(6,email);
            ps.setString(7,dob);
            ps.setString(8,location);
            int i= ps.executeUpdate();
            if(i>0)
            {
                out.print("Registered successfully.....!!");
                //String redirectURL="reg.html";
                //response.sendRedirect(redirectURL);
            }
            %>
    </body>
</html>